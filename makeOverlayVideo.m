
outputVideo = VideoWriter('~/Desktop/160720_10s_15ug_8000_autodetection_100fps.mp4', 'MPEG-4');
outputVideo.FrameRate = 29.9;
open(outputVideo);

for(i = str2num(seqStart):str2num(seqEnd))
    f=figure;
    set(gcf,'Visible', 'off'); 
    img = imread(strcat('/Volumes/VERBATIM HD/160720_BackImaging_ConcSeries/160720_10s_15ug_8000_/', 'acA2000-165uc__21766420__20160720_201415028_', num2str(i,'%04d'), '.tiff'));
    img = imcrop(img, crop);
    img = img(26:end-25, 26:end-25);
    warning('off', 'Images:initSize:adjustingMag');
    imshow( img ,'InitialMagnification', 100);
    edges=imagesEdges{1,i};
    hold on;
    plot( edges(1,:) );
    plot( edges(2,:) );
    writeVideo(outputVideo,getframe(f));
    f.delete();
end;
    close(outputVideo);