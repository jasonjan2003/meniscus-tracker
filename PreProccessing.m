%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Preproccessing of images prior to Edge Detection %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function im = PreProccessing( p, crop, contrastLimits);

% Detect number of input arguments
if( nargin > 0)
    if isnumeric(p)
        im = p;
    else
        im = imread( p);
    end;
else
    crop = true;
end;

switch nargin
    case 1
        crop = true;
    case 2
        contrastLimits = [0.25, 0.75];
    case 3
        % nothing here yet
    otherwise
        % Directory where to find the data
        dir = uigetdir('.');
        if( dir == 0)   % catch error
            disp('Please rerun the program, then select a directory'); 
            return;
        else
            dir = strcat(dir,'/');  % append trailing forward slash
        end;

        % Prompt user for information on the image to analyze.
        % BasenameIndex 
        % ex. testImage0004 -> baseName = testImage; index = 4
        prompt = 'What is the basename of the image files: ';
        baseName= input(prompt,'s');
        prompt = 'What is the starting index of the image files: ';
        index=input(prompt);
        %baseName = 'test'; index = 5;
        
        %fields
        contrastLimits = [0.25 0.75];
        % path to file
        p = [dir baseName num2str(index,'%04d') '.tiff'];
        
        % Load image
        im = imread( p);
end;

% transform to grayscale(as necessary) and invert
if( ndims(im) == 3)
    im = rgb2gray(im);
end;
im = imcomplement( im);

% crop
if( crop)
    im = imcrop(im);
end;

% filter image noise
%im = wiener2(im,[5 5]);


%Adjust contrast
im = imadjust(im,stretchlim(im, contrastLimits),[]);

% filter image noise
%im = wiener2(im,[25 25]);
im = medfilt2(im, [10,10]);

% clip border
im = im(26:end-25, 26:end-25);
