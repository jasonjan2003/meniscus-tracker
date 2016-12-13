
outputVideo = VideoWriter('~/Desktop/5-20/lowSmoothThreshold-raw.mp4', 'MPEG-4');
outputVideo.FrameRate = 29.9;
open(outputVideo); 

%{
outputVideo2 = VideoWriter('~/Desktop/5-20/raw.mp4', 'MPEG-4');
outputVideo2.FrameRate = 29.9;
open(outputVideo2);
%}

column2 = str2double(column);
fps2 = str2double(fps);
pixelSize2 = str2double(pixelSize);
liftRate2 = str2double(liftRate);

for i = str2double(seqStart):str2double(seqEnd)
    f=figure;
    set(gcf,'Visible', 'off'); 
    img = imread(strcat('/Volumes/VERBATIM HD/160720_BackImaging_ConcSeries/160720_5s_20ug_8000_/', 'acA2000-165uc__21766420__20160720_203323009_', num2str(i,'%04d'), '.tiff'));
    img = imcrop(img, crop);
    warning('off', 'Images:initSize:adjustingMag');
    
    %subplot(1,2,1);
    imshow( img ,'InitialMagnification', 200);
    %writeVideo(outputVideo2,getframe(f));
    edges=imagesEdges{1,i};
    edgesRaw=imagesEdgesRaw{1,i};
    edges(2,column2:end)=edgesRaw(2,column2:end);
    %edgesAll=imagesEdgesAll{1,i};
    hold on;
    plot( edges(1,:) );
    plot( edges(2,:) );
    %plot( edgesAll(2,:) );
    line( [column2, column2], [1, crop(4)], 'LineStyle', '--', 'Color', 'b');
    
    %{
    subplot(1,2,2);
    hold on;
        maxEdgesTop = zeros( 1, size(imagesEdges,2) );
        maxEdgesBottom = maxEdgesTop;
        for j=1:size(imagesEdges,2)
            maxEdgesTop(i) = imagesEdges{j}(1, column2);
            maxEdgesBottom(i) = imagesEdges{j}(2, column2);
        end;
    maxEdges = [maxEdgesTop; maxEdgesBottom];
    numFrames = size( maxEdges, 2);

    x = (0:numFrames-1)/fps2;
    maxEdges = maxEdges .* pixelSize2;
    maxEdges(1,:) = maxEdges(1,:) + liftRate2 .* x;
    maxEdges(2,:) = maxEdges(2,:) + liftRate2 .* x;
    plot( x, maxEdges(1,:));
    plot( x, maxEdges(2,:));
    legend('Top', 'Bottom');
    legend('boxoff');
    legend('Location', 'southeast');
    ylabel(['Menisci position at column ' num2str( topIndex) '[um]'])
    xlabel('Time[s]');
    title(['Menisci position at column ' num2str( topIndex) ' [um] vs. Time [s]'] );
    handles.yTimeResult.Parent.CurrentAxes.YDir = 'reverse';
    %}
    writeVideo(outputVideo,getframe(f));
    f.delete();
end;
    close(outputVideo);
    %close(outputVideo2);
    
    
function [topEdge, buttomEdge] = findColumnEdges( imagesEdges, column )
    
    % set the size of arrays
    topEdge = zeros( 1, size(imagesEdges,2) );
    buttomEdge = topEdge;
    
    
    parfor i=1:size(imagesEdges,2)
        topEdge(i) = imagesEdges{i}(1, column)
        buttomEdge(i) = imagesEdges{i}(2, column)
    end;
    
    return;
end