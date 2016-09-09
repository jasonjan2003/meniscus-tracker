function edges = EdgeSearch( im, imWoContrast, smoothRange)

if( nargin == 2)
    smoothRange = 0.8;
else
    smoothRange = 0.01 * smoothRange;
end;

% find gradient
%[Gx, Gy] = imgradientxy(im, 'centraldifference');

% make a copy of im in double
imD = im2double(im);
imWoContrastD = im2double(imWoContrast);

% find the first diff() of im
firstDiff = diff(imWoContrastD,1,1);

% transform firstDiff to double array
firstDiff = double(firstDiff);

% find the maxes and each respective index of each column of firstDiff
[firstDiffMax, firstDiffMaxIndex] = max( firstDiff);

% smooth out firstDiff max() data
firstDiffMaxIndexSmooth = smooth(firstDiffMaxIndex', 0.8, 'rloess')';

% define `top` for readability
topLine = firstDiffMax; 
topLineIndex = firstDiffMaxIndexSmooth;
% and bottom
bottomLineIndex = zeros(1,size(im, 2));

% find column minimum of the subset of im under max of firstDiff 
 for i=1:size(imD, 2)
     
    % starting index of subset
    colTopPeakIndex = firstDiffMaxIndex(i);
    % minima and respective indecies
    %[pks, pksIndex] = findpeaks( max( imD(colTopPeakIndex:end,i)) - imD(colTopPeakIndex:end,i));
    % Alt: first occurence of lowest point
    [~, maxImIndex] = max(imD(colTopPeakIndex:round(colTopPeakIndex+(end-colTopPeakIndex)/2),i));
    maxImIndex = maxImIndex + colTopPeakIndex;
    [~,pksIndex] = find( imD(maxImIndex:end,i)' == 0, 1);
    if( size( pksIndex,2) == 0)
        [~,pksIndex] = find( imD(maxImIndex:end,i)' == min(imD(maxImIndex:end,i)), 1);
    end;
    
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
    
    if( pksIndex > 2/3 * subsetWidth)
        pksIndex = colTopPeakIndex;
    else
        pksIndex = pksIndex + maxImIndex;
    end;
    pki = pksIndex;
    
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
    bottomLineIndex(i) = pki;
end;
s = size(bottomLineIndex, 2);
if( smoothRange ~= 1)
    sides = round((0.5 - smoothRange / 2)*s);
    bottomLineIndexSmoothPartial = smooth(bottomLineIndex( 1, sides:s-sides )', 0.8, 'rloess');
    bottomLineIndexSmooth = bottomLineIndex;
    bottomLineIndexSmooth( 1, sides:s-sides) = bottomLineIndexSmoothPartial;
else
    bottomLineIndexSmooth = smooth(bottomLineIndex', 0.8, 'rloess')';
end;

edges = [topLineIndex; bottomLineIndexSmooth];

% for raw data, uncomment below
%edges = [topLineIndex; bottomLineIndex];

