function varargout = MeniscusTracker(varargin)
% MeniscusTracker MATLAB code for MeniscusTracker.fig
%      MeniscusTracker, by itself, creates a new MeniscusTracker or raises the existing
%      singleton*.
%
%      H = MeniscusTracker returns the handle to a new MeniscusTracker or the handle to
%      the existing singleton*.
%
%      MeniscusTracker('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MeniscusTracker.M with the given input arguments.
%
%      MeniscusTracker('Property','Value',...) creates a new MeniscusTracker or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MeniscusTracker_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MeniscusTracker_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MeniscusTracker

% Last Modified by GUIDE v2.5 09-Sep-2016 11:00:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MeniscusTracker_OpeningFcn, ...
                   'gui_OutputFcn',  @MeniscusTracker_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT



% --- Executes just before MeniscusTracker is made visible.
function MeniscusTracker_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MeniscusTracker (see VARARGIN)

% Choose default command line output for MeniscusTracker
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MeniscusTracker wait for user response (see UIRESUME)
% uiwait(handles.figure1);

handles.dir.String = pwd;
guidata( hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = MeniscusTracker_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in dirButton.
function dirButton_Callback(hObject, eventdata, handles)
% hObject    handle to dirButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    directory = handles.dir.String;
    if( strcmp( directory, ''))
        directory = './';
    end;
    if iscell(directory)
        newDir = uigetdir(directory{1});
    else
        newDir = uigetdir(directory);
    end;
    
    if( newDir ~= 0)
        set( handles.dir, 'String', newDir)
    end;


function basename_Callback(hObject, eventdata, handles)
% hObject    handle to basename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of basename as text
%        str2double(get(hObject,'String')) returns contents of basename as a double


% --- Executes during object creation, after setting all properties.
function basename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to basename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function seqStart_Callback(hObject, eventdata, handles)
% hObject    handle to seqStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seqStart as text
%        str2double(get(hObject,'String')) returns contents of seqStart as a double


% --- Executes during object creation, after setting all properties.
function seqStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seqStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function seqEnd_Callback(hObject, eventdata, handles)
% hObject    handle to seqEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seqEnd as text
%        str2double(get(hObject,'String')) returns contents of seqEnd as a double


% --- Executes during object creation, after setting all properties.
function seqEnd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seqEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over dirButton.
function dirButton_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to dirButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in nextStep1.
function nextStep1_Callback(hObject, eventdata, handles)
% hObject    handle to nextStep1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    %%
    % Disable nextStep2
    disable2( handles);
    
    %%
    % reset MeniscusTracker
    resetUI( handles);
    
    %%
    % fields
    images = cell(1);
    imagesMod = cell(1);
    contrastLim = [0.7, 0.9];
    handles.contrastLim = contrastLim;
    guidata( hObject, handles);
    
    seqStart = str2double( handles.seqStart.String);
    seqEnd = str2double( handles.seqEnd.String);
    dir = handles.dir.String;
    
    if ispc
        c = '\';
    else
        c = '/';
    end;
    if ~strcmp(c,dir(end))
        dir(end+1) = c;
        handles.dir.String = dir; % might as well update it
        guidata( handles.dir, handles);
    end;
    
    base = handles.basename.String;
    ext = handles.ext.String;
    failures = [];
    handles.curr = seqStart;
    
    %%
    % Loop through for invalid files
    % waitbar
    wBar = waitbar(0,'Checking Files', 'Name', 'Checking Files...');
    handles.browser.String = cell(1, seqEnd-seqStart +1);
    guidata( handles.browser, handles);
    for i=seqStart:seqEnd
        loc = strcat(dir,base,num2str(i,'%04d'),'.',ext);
        if (exist( loc, 'file') == 2)
            handles.browser.String{i - seqStart + 1} = num2str(i);
        else
            failures(end+1) = i;
        end;
        % calculate progress and update waitbar
        waitbar((i-seqStart+1)/(seqEnd-seqStart+1), wBar, ['Processing ' num2str(i)]);
    end;
    
    guidata( handles.browser, handles);
    
    
    %%
    % warning: invalid files, prompt
    w = '';
    s = size(failures);
    if( s > 0)
        if s == 1
            w = strcat( 'File',num2str(failures(1)), ' is');
        else
            for i=1:s
                w = strcat( w, num2str( failures(i)));
                if i < s
                    w = strcat(w, ', ');
                end;
            end;
            w = strcat( 'Files', w, ' are');
        end;
        delete( wBar);
        w = strcat( w, ' not available. Please consider regathering images.');
        errordlg(w, 'Error');
        return;
    end;
    
    
    %%
    % load first image to crop to adjust contrastLim
    axes( handles.axes1);
    im = readIm( handles, seqStart);
    %im = PreProccessing( im, false, handles.contrastLim);
    imshow( im);
    
    updateHisto( handles, im);
    [~, crop] = imcrop( handles.axes1 );
    crop = round( crop);
    handles.crop.String = strcat('[ ', num2str(crop), ' ]');
    handles.crop.Value = crop;
    guidata( handles.crop, handles);
    axis off;
    
    %% 
    % Update image
    axes( handles.axes1);
    im = PreProccessing( imcrop( im, crop), false, handles.contrastLim);
    imshow( im);
    
    
    %%
    % Fill histogram
    axes( handles.histo);
    axis off;
    his = histogram( im);
    his.NumBins = 256;
    updateHisto( handles);
    
    
    %%
    % Enable nextStep2
    enable2( handles);
    
    %%
    % close wBar
    delete( wBar);

function ext_Callback(hObject, eventdata, handles)
% hObject    handle to ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ext as text
%        str2double(get(hObject,'String')) returns contents of ext as a double


% --- Executes during object creation, after setting all properties.
function ext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function histoLow_Callback(hObject, eventdata, handles)
% hObject    handle to histoLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

if handles.histoHigh.Value < hObject.Value
    hObject.Value = handles.histoHigh.Value;
    return;
end;

newVal = hObject.Value;
contrastLim = handles.contrastLim;
if( contrastLim(1,1) ~= newVal)
    contrastLim(1,1) = newVal;
    handles.contrastLim = contrastLim;
    guidata( hObject, handles);
    updateHisto( handles);
end;

% --- Executes during object creation, after setting all properties.
function histoLow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to histoLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function histoHigh_Callback(hObject, eventdata, handles)
% hObject    handle to histoHigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
if hObject.Value < handles.histoLow.Value
    hObject.Value = handles.histoLow.Value;
    return;
end;
newVal = hObject.Value;
contrastLim = handles.contrastLim;
if( contrastLim(1,2) ~= newVal)
    contrastLim(1,2) = newVal;
    handles.contrastLim = contrastLim;
    guidata( hObject, handles);
    updateHisto( handles);
end;

% --- Executes during object creation, after setting all properties.
function histoHigh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to histoHigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function updateHisto( handles, im)

lim = handles.contrastLim;
resetUI( handles);

if nargin == 1    
% generate new image
    im = readIm( handles, handles.curr, true);
    im = PreProccessing( im, false, lim);
end;

axes( handles.axes1);
imshow( im);

axes( handles.histo);
his = histogram( im);
his.NumBins = 256;

% confirm correct `edit` value
handles.contrastLow.String = num2str( lim(1,1));
handles.contrastHigh.String = num2str( lim(1,2));

% confirm correct slider position
handles.histoLow.Value = lim(1,1);
handles.histoHigh.Value = lim(1,2);

% --- Executes on button press in nextStep2.
function nextStep2_Callback(hObject, eventdata, handles)
% hObject    handle to nextStep2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%
% clear results
cla( handles.yTimeResult);

%%
% Input Dialog for the column to find max at
range = 0.01 * str2double( handles.smoothingRange.String);
cropX = handles.crop.Value(1);
cropWidth = handles.crop.Value(3);

%%
% range
cropWidth = handles.crop.Value(3)-50+1;
smoothingRange = str2double(handles.smoothingRange.String) * 0.01;
side = (1-smoothingRange)/2 * cropWidth;
side = round(side);
topIndex = -1;

%%
% Process every image
s = str2double(handles.seqEnd.String) - str2double(handles.seqStart.String) + 1;
contrastLim = handles.contrastLim;
imagesEdges = cell(1, s);
maxEdges = zeros(2, s);
% waitbar
wBar = waitbar(0,'Processing Images...', 'Name', 'Processing Images...','CreateCancelBtn', 'setappdata(gcbf,''canceling'',1)');
setappdata(wBar,'canceling',0)

for i=1:s;
    
    % stop process if the cancel button is triggered
    if getappdata(wBar,'canceling')
        break;
    end
    
    % corresponding i
    seq = i + str2double(handles.seqStart.String) - 1;
    
    % read, preproccess, edgeSearch
    im = readIm( handles, seq, true);
    imWoContrast = PreProccessing( im, false, [0.1,0.99]);
    im = PreProccessing( im, false, contrastLim);
    imagesEdges{1,i} = EdgeSearch( im, imWoContrast , str2double( handles.smoothingRange.String));
    
    % MODE1: find max of each curve
    %maxEdges(1,i) = min(imagesEdges{1,i}(1,:));
    %maxEdges(2,i) = min(imagesEdges{1,i}(2,:));
    
    % MODE2: track by first image max
    if topIndex == -1
        [~,topIndex] = min(imagesEdges{1,i}(1,side:end-side));
    end;
    maxEdges(1,i) = imagesEdges{1,i}(1,topIndex);
    maxEdges(2,i) = imagesEdges{1,i}(2,topIndex);
    
    % calculate progress and update waitbar
    waitbar(i/s, wBar, [num2str(i) ' images processed...']);
end;

% Delete wbar
delete(wBar);

%%
% Update guidata
handles.imagesEdges = imagesEdges;
handles.maxEdges = maxEdges;
handles.topIndex = topIndex;
guidata( hObject, handles);

%%
% Update yTimeResult axes
axes( handles.yTimeResult);
plot( str2double(handles.seqStart.String):str2double(handles.seqEnd.String), maxEdges(1,:))
hold on;
plot( str2double(handles.seqStart.String):str2double(handles.seqEnd.String), maxEdges(2,:))
hold off;
handles.yTimeResult.Parent.CurrentAxes.YDir = 'reverse';
legend('Top', 'Bottom');
handles.yTimeResult.YLabel.String = ['Menisci position at column ' num2str(topIndex)];
handles.yTimeResult.XLabel.String = 'Frame';
handles.yTimeResult.Title.String =  ['Menisci position at column ' num2str(topIndex) ' vs. Sequential Frames'] ;



function overlayEdge( handles, edges)

% pull up edge data
curr = handles.curr;
if nargin == 1
    edges = handles.imagesEdges{1,curr};
end;

% switch axes
axes( handles.axes1);
hold on;
plot( edges(1,:));
hold on;
plot( edges(2,:));
hold off;

function resetUI( handles)
cla( handles.axes1);
cla( handles.histo);


% --- Executes on selection change in browser.
function browser_Callback(hObject, eventdata, handles)
% hObject    handle to browser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns browser contents as cell array
%        contents{get(hObject,'Value')} returns selected item from browser
handles.curr = hObject.String{ hObject.Value};
guidata( hObject, handles);
updateHisto( handles);

% --- Executes during object creation, after setting all properties.
function browser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to browser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in nextStepPreview.
function nextStepPreview_Callback(hObject, eventdata, handles)
% hObject    handle to nextStepPreview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% reset image
resetUI(handles);
updateHisto( handles);

% waitbar
wBar = waitbar(0,'1', 'Name', 'Processing Images...','CreateCancelBtn', 'setappdata(gcbf,''canceling'',1)');
setappdata(wBar,'canceling',0)
curr = handles.curr;

im = readIm( handles, curr, true);
imWoContrast = PreProccessing( im, false, [0.1,0.99]);
im = PreProccessing( im, false, handles.contrastLim);
imEdges = EdgeSearch( im, imWoContrast, str2double( handles.smoothingRange.String));

overlayEdge( handles, imEdges);
delete( wBar);



function smoothingRange_Callback(hObject, eventdata, handles)
% hObject    handle to smoothingRange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of smoothingRange as text
%        str2double(get(hObject,'String')) returns contents of smoothingRange as a double

% --- Executes during object creation, after setting all properties.

function smoothingRange_CreateFcn(hObject, eventdata, handles)
% hObject    handle to smoothingRange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function contrastHigh_Callback(hObject, eventdata, handles)
% hObject    handle to contrastHigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of contrastHigh as text
%        str2double(get(hObject,'String')) returns contents of contrastHigh as a double
lim = handles.contrastLim;
lim(1,2) = str2num(hObject.String);
handles.contrastLim = lim;
updateHisto( handles);

% --- Executes during object creation, after setting all properties.
function contrastHigh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to contrastHigh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function contrastLow_Callback(hObject, eventdata, handles)
% hObject    handle to contrastLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of contrastLow as text
%        str2double(get(hObject,'String')) returns contents of contrastLow as a double
lim = handles.contrastLim;
lim(1,1) = str2num(hObject.String);
handles.contrastLim = lim;
updateHisto( handles);

% --- Executes during object creation, after setting all properties.
function contrastLow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to contrastLow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function im = readIm(handles, seq, crop)
    if nargin == 1
        loc = buildLoc( handles); 
        crop = false;
    else
        if nargin == 2
            crop = false;
        end;
        loc = buildLoc( handles, seq);
    end;
    if iscell( loc)
        im = imread( loc{1});
    else
        im = imread( loc);
    end;
    if crop
        im = imcrop( im, handles.crop.Value);
    end;

function loc = buildLoc( handles, seq)
    if nargin == 1
        if handles.curr > 0
            seq = handles.curr;
        else
            seq = str2double( handles.seqStart.String);
        end;
    end;
    if ~isnumeric( seq)
        seq = str2double(seq);
    end;
    loc = strcat( handles.dir.String, handles.basename.String, num2str(seq,'%04d'), '.', handles.ext.String);
        
function disable2( handles)
    handles.nextStep2.Enable = 'off';
    handles.contrastLow.Enable = 'off';
    handles.contrastHigh.Enable = 'off';
    handles.smoothingRange.Enable = 'off';
    handles.nextStepPreview.Enable = 'off';
    handles.saveResultEdges.Enable = 'off';
    
function enable2( handles)
    handles.nextStep2.Enable = 'on';
    handles.contrastLow.Enable = 'on';
    handles.contrastHigh.Enable = 'on';
    handles.smoothingRange.Enable = 'on';
    handles.nextStepPreview.Enable = 'on';
    handles.saveResultEdges.Enable = 'on';


% --- Executes on button press in saveResultEdges.
function saveResultEdges_Callback(hObject, eventdata, handles)
% hObject    handle to saveResultEdges (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagesEdges = handles.imagesEdges;
crop = handles.crop.Value;
seqStart = handles.seqStart.String;
seqEnd = handles.seqEnd.String;
dir = handles.dir.String;
basename = handles.basename.String;
ext = handles.ext.String;
contrastLim = handles.contrastLim;
smoothingRange = handles.smoothingRange.String;
maxEdges = handles.maxEdges;
topIndex = handles.topIndex;
liftRate = handles.liftRate.String;
pixelSize = handles.pixelSize.String;
fps = handles.fps.String;

if iscell(dir)
    name = [dir{1} basename 'imagesEdges'];
else
    name = [dir basename 'imagesEdges'];
end;

uisave( {'imagesEdges', 'crop', 'seqStart', 'seqEnd', 'dir', 'basename', 'ext', 'contrastLim', 'smoothingRange', 'topIndex','maxEdges', 'liftRate', 'pixelSize', 'fps'}, ...
            name);


% --------------------------------------------------------------------
function openTool_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to openTool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fileName,pathName,~] = uigetfile('*.mat','Select the MATLAB code file');
if fileName == 0
    errordlg('Please Select a File', 'Error');
    return;
end;
%%% else
file = load([pathName fileName], '-mat');
handles.imagesEdges = file.imagesEdges;
handles.crop.Value = file.crop;
handles.seqStart.String = file.seqStart;
handles.seqEnd.String = file.seqEnd;
handles.dir.String = cellstr( ( file.dir));
handles.basename.String = file.basename;
handles.ext.String = file.ext;
handles.contrastLim = file.contrastLim;
handles.smoothingRange.String = file.smoothingRange;
handles.curr = file.seqStart;
handles.topIndex = file.topIndex;
handles.maxEdges = file.maxEdges;
handles.liftRate.String = file.liftRate;
handles.pixelSize.String = file.pixelSize;
handles.fps.String = file.fps;
guidata( hObject, handles);

for i=str2double(handles.seqStart.String):str2double(handles.seqEnd.String)
	handles.browser.String{i - str2double(handles.seqStart.String) + 1} = num2str(i);
end;

updateHisto( handles);

axes( handles.yTimeResult);
cla;
plot( str2double(handles.seqStart.String):str2double(handles.seqEnd.String), handles.maxEdges(1,:))
hold on;
plot( str2double(handles.seqStart.String):str2double(handles.seqEnd.String), handles.maxEdges(2,:))
hold off;
handles.yTimeResult.Parent.CurrentAxes.YDir = 'reverse';
legend('Top', 'Bottom');
handles.yTimeResult.YLabel.String = ['Menisci position at column ' num2str(handles.topIndex)];
handles.yTimeResult.XLabel.String = 'Frame';
handles.yTimeResult.Title.String =  ['Menisci position at column ' num2str(handles.topIndex) ' vs. Sequential Frames'] ;
view(2);


function pixelSize_Callback(hObject, eventdata, handles)
% hObject    handle to pixelSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pixelSize as text
%        str2double(get(hObject,'String')) returns contents of pixelSize as a double


% --- Executes during object creation, after setting all properties.
function pixelSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pixelSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function liftRate_Callback(hObject, eventdata, handles)
% hObject    handle to liftRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of liftRate as text
%        str2double(get(hObject,'String')) returns contents of liftRate as a double


% --- Executes during object creation, after setting all properties.
function liftRate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to liftRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in replot.
function replot_Callback(hObject, eventdata, handles)
% hObject    handle to replot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (size(handles.imagesEdges) < 1 & ...
        size(handles.liftRate.String)<1 & ...
        size(handles.fps.String)<1)
    return;
end;

if( size(handles.pixelSize.String, 2) < 1)
    measurePixelSize( hObject, handles);
end;

topIndex = handles.topIndex;
maxEdges = handles.maxEdges;
numFrames = size( maxEdges, 2);
fps = str2double(handles.fps.String);
pixelSize = str2double( handles.pixelSize.String);
liftRate = str2double( handles.liftRate.String);
x = (0:numFrames-1)/fps;
maxEdges = maxEdges .* pixelSize;
maxEdges(1,:) = maxEdges(1,:) + liftRate .* x;
maxEdges(2,:) = maxEdges(2,:) + liftRate .* x;
inter = max( maxEdges(2,:));
%maxEdges(1,:) = maxEdges(1,:) - inter;
%maxEdges(2,:) = maxEdges(2,:) - inter;

axes( handles.yTimeResult);
cla;
plot3( x, maxEdges(1,:),handles.maxEdges(1,:));
hold on;
plot3( x, maxEdges(2,:),handles.maxEdges(2,:));
hold on;
view(2);

legend('Top', 'Bottom');
legend('boxoff');
legend('Location', 'southeast');
handles.yTimeResult.YLabel.String = ['Menisci position at column ' num2str( topIndex) '[um]'];
handles.yTimeResult.XLabel.String = 'Time[s]';
handles.yTimeResult.Title.String =  ['Menisci position at column ' num2str( topIndex) ' [um] vs. Time [s]'] ;
handles.yTimeResult.Parent.CurrentAxes.YDir = 'reverse';



function fps_Callback(hObject, eventdata, handles)
% hObject    handle to fps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fps as text
%        str2double(get(hObject,'String')) returns contents of fps as a double


% --- Executes during object creation, after setting all properties.
function fps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function measurePixelSize( hObject, handles)

[dir,f] = uigetfile( handles.dir.String);
im = imread( fullfile(f,dir));
im = rgb2gray(im);
h = helpdlg( 'Choose two points from image.', 'Measure Pixel Size');
uiwait(h);
f = figure;
imshow( im);
axis equal;
colormap gray;
[x, y] = ginput(2);
d = inputdlg('Enter Distance [mm]');
d = str2double(d{1});
pixelSize = d * 1000 / ( (x(2)-x(1))^2 +( y(2)-y(1))^2) ^ (1/2);
delete(f);

handles.pixelSize.String = num2str( pixelSize);
guidata( handles.pixelSize, handles);


% --- Executes on button press in savePlot.
function savePlot_Callback(hObject, eventdata, handles)
% hObject    handle to savePlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = figure;
copyobj(handles.yTimeResult,f);
f.Children.OuterPosition = [0,0,1,1];

dir = handles.dir.String;
basename = handles.basename.String;

if iscell(dir)
    name = [dir{1} basename 'resultPlot'];
else
    name = [dir basename 'resultPlot'];
end;

[a,b] = uiputfile({'.*'},'Save Image',...
name);

saveas( f, [fullfile(b,a) '.fig'], 'fig');
saveas( f, [fullfile(b,a) '.tiff'], 'tiffn');

delete(f);
