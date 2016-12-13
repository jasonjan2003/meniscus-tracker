function edges = EdgeSearch( im, imWoContrast, smoothRange, imBinary)

if( nargin == 2)
    smoothRange = 0.8;
else
    smoothRange = 0.01 * smoothRange;
end;

% find gradient
%[Gx, Gy] = imgradientxy(im, 'centraldifference');

% make a copy of im in double
imD = double(im);
if( islogical(imBinary) )
    binarize = true;
    imBinary = ones(size(imBinary)) .* imBinary;
else
    binarize = false; 
    % fill holes
    imDBinary = double(imD>0);
    imDBinaryFilled = imfill(imDBinary,'holes');
    imDBinaryFilled = (imDBinaryFilled - imDBinary) .* 255;
    imD = imD + imDBinaryFilled;
end;
imWoContrastD = im2double(imWoContrast);

% find the first diff() of im
firstDiff = diff(imWoContrastD,1,1);
%firstDiff = diff(imD,1,1);

% transform firstDiff to double array
firstDiff = double(firstDiff);

% find the maxes and each respective index of each column of firstDiff
[firstDiffMax, firstDiffMaxIndex] = max( firstDiff);

% smooth out firstDiff max() data
 firstDiffMaxIndexSmooth = smooth(firstDiffMaxIndex', 0.8, 'rloess')';
%firstDiffMaxIndexSmooth = firstDiffMaxIndex;

% define `top` for readability
topLine = firstDiffMax; 
topLineIndex = firstDiffMaxIndexSmooth;

% blacken pixels above top line
if( binarize)
    boundaryMatrix = (1:size(imD,1))'*ones(1,size(imD,2));
    boundaryMatrix(boundaryMatrix<firstDiffMaxIndexSmooth) = 0;
    imBinary = imBinary .* boundaryMatrix;
end;

% and bottom
bottomLineIndex = zeros(1,size(im, 2));

% find column minimum of the subset of im under max of firstDiff 
 for i=1:size(imD, 2)
    % starting index of subset
    colTopPeakIndex = round(topLineIndex(i));
    % minima and respective indecies
    %[pks, pksIndex] = findpeaks( max( imD(colTopPeakIndex:end,i)) - imD(colTopPeakIndex:end,i));
    % Alt1: first occurence of lowest point
    if( ~binarize)
        
        [~, maxImIndex] = max(imD(colTopPeakIndex:round(colTopPeakIndex+(end-colTopPeakIndex)*2/3),i));
        if maxImIndex > 40
            maxImIndex = 35;
        elseif maxImIndex < 15
            maxImIndex = 15;  
        end;
        maxImIndex = floor(maxImIndex + colTopPeakIndex)+0;
        pksIndex = find( imD(maxImIndex:end,i)' <= 130, 1 );
        if( size( pksIndex,2) == 0)
            pksIndex = find( imBinary(maxImIndex:end,i)' == min(imBinary(maxImIndex:end,i)), 1);
        end;
        
    % Alt2: using binary, first black pixel below colTopPeakIndex +
    % threshold margin
    else
        threshold_margin = 50;
        maxImIndex = colTopPeakIndex;
        [~,pksIndex] = find( imBinary(colTopPeakIndex+threshold_margin:end,i)' == 0, 1);
    end
    % translate pksIndex right by colTopPeakIndex
    %pksIndex = pksIndex + colTopPeakIndex;
    % revert pks
    %pks =  -1 .*pks + max( imD(colTopPeakIndex:end,i));
    % width of the subset
    
    subsetWidth = size(imD, 1) - maxImIndex;
    
    % find minumum closest to the 1/3 boundary of the subset
    %pki = -1;
    %for j=1:size(pksIndex)
    %    if pksIndex(j) < (2/3)*subsetWidth 
    %        pki = pksIndex(j) + colTopPeakIndex; 
    %    else
    %        break;
    %    end;
    %end;
    
    if( ~binarize )
        if( pksIndex > 2/3 * subsetWidth)
            pksIndex = colTopPeakIndex;
        else
            pksIndex = pksIndex + maxImIndex;
        end;
        pki = pksIndex;
    else
        pki = pksIndex + colTopPeakIndex+threshold_margin;
    end
    % if one wasn't found or , make it the max
    %if pki == -1
    %    if i > 1
    %        bestAlt = bottomLineIndex(i-1);
    %        if( bestAlt > colTopPeakIndex)
    %            pki = bestAlt;
    %        else
    %            pki = colTopPeakIndex;
    %        end;
    %    else
    %        pki = colTopPeakIndex;
    %    end;
    %end;
    
    % record pki
    try
        bottomLineIndex(i) = pki;
    catch 
        bottomLineIndex(i) = colTopPeakIndex;
    end;
end;
s = size(bottomLineIndex, 2);
if( smoothRange ~= 1)
    sides = round((0.5 - smoothRange / 2)*s);
    bottomLineIndexSmoothPartial = smooth(bottomLineIndex( 1, sides:s-sides )', 0.8, 'rloess');
    %bottomLineIndexSmoothPartial = bottomLineIndex( 1, sides:s-sides );
    bottomLineIndexSmooth = bottomLineIndex;
    bottomLineIndexSmooth( 1, sides:s-sides) = bottomLineIndexSmoothPartial;
else
    bottomLineIndexSmooth = smooth(bottomLineIndex', 0.8, 'rloess')';
end;

edges = [topLineIndex; bottomLineIndexSmooth];

% for raw data, uncomment below
%edges = [topLineIndex; bottomLineIndex];

