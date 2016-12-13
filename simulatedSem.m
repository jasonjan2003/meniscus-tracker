
fps2 = str2double(fps);
pixelSize2 = str2double(pixelSize);
liftRate2 = str2double(liftRate);
seqStart2 = str2double(seqStart);
seqEnd2 = str2double(seqEnd);

combEdges=ones(crop(3),seqEnd2);
combEdgesSmooth=ones(crop(3),seqEnd2);
z=(1:seqEnd2)/fps2;
shift = liftRate2 .* z;
    
parfor itrColumn = 1:crop(3)
	
	% get the edges for current column
    [~, bottomEdge] = findColumnEdges( imagesEdges, itrColumn );
    %[~, bottomEdgeCorr] = findColumnEdges( imagesEdgesRawUnsmoothed, itrColumn );
    
    % replace bad data
        % dips frame:320-523, column:200-400
        if itrColumn >= 200 && itrColumn <= 400
            %bottomEdge(320:523) = bottomEdgeDip(320:523);
        end;
        %bottomEdge(500:end) = bottomEdgeCorr(500:end);
    
    % change reference frame
    bottomEdge = bottomEdge .* pixelSize2;
    bottomEdge = bottomEdge + shift;
    
    % add to collection
    combEdges(itrColumn,:) = bottomEdge;
    combEdgesSmooth(itrColumn,:) = smooth(bottomEdge', 0.05,'rloess')';
    %combEdges(itrColumn,:)=smooth(bottomEdge', 0.05,'rloess')';
    %combEdges(itrColumn,:)=smooth(smooth(bottomEdge', 3,'moving'), 0.05,'rloess')';
    
end;

combEdgesSmoothBin = [diff(combEdgesSmooth,1,2) zeros(989,1)];
combEdgesSmoothBin(combEdgesSmoothBin<2) = 0;
combEdgesSmoothBin(combEdgesSmoothBin>=2) = 1;

f=figure;surf(-1*combEdges,[-1*diff(combEdgesSmooth,1,2) zeros(989,1)]);caxis([-3.0,0])
shading interp
%axis equal
    
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