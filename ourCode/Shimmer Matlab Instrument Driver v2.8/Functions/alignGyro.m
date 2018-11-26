function varargout = alignGyro(varargin)
% ALIGNGYRO MATLAB code for alignGyro.fig
%      ALIGNGYRO, by itself, creates a new ALIGNGYRO or raises the existing
%      singleton*.
%
%      H = ALIGNGYRO returns the handle to a new ALIGNGYRO or the handle to
%      the existing singleton*.
%
%      ALIGNGYRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ALIGNGYRO.M with the given input arguments.
%
%      ALIGNGYRO('Property','Value',...) creates a new ALIGNGYRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before alignGyro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to alignGyro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help alignGyro

% Last Modified by GUIDE v2.5 26-Nov-2018 11:58:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @alignGyro_OpeningFcn, ...
                   'gui_OutputFcn',  @alignGyro_OutputFcn, ...
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


% --- Executes just before alignGyro is made visible.
function alignGyro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to alignGyro (see VARARGIN)

%%Import the data:
[~,~,~,L] = loadData();

set(handles.slider1, 'max', L(1));
set(handles.slider1, 'min', 1);
set(handles.slider2, 'max', L(1));
set(handles.slider2, 'min', 1);
set(handles.slider3, 'max', L(2));
set(handles.slider3, 'min', 1);
set(handles.slider4, 'max', L(2));
set(handles.slider4, 'min', 1);
set(handles.slider5, 'max', L(3));
set(handles.slider5, 'min', 1);
set(handles.slider6, 'max', L(3));
set(handles.slider6, 'min', 1);

% Choose default command line output for alignGyro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes alignGyro wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function plotStuffAndSuch(slider1, slider2, slider3, slider4, slider5, ...
    slider6, xLeg, yLeg, zLeg, xChest, yChest, zChest, aPress, bPress, ...
    cPress, dPress, ePress, fPress, axes1)

slider(1) = get(slider1,'Value');
slider(2) = get(slider2,'Value');
slider(3) = get(slider3,'Value');
slider(4) = get(slider4,'Value');
slider(5) = get(slider5,'Value');
slider(6) = get(slider6,'Value');
checkbox(1) = get(xLeg, 'Value');
checkbox(2) = get(yLeg, 'Value');
checkbox(3) = get(zLeg, 'Value');
checkbox(4) = get(xChest, 'Value');
checkbox(5) = get(yChest, 'Value');
checkbox(6) = get(zChest, 'Value');
checkbox(7) = get(aPress, 'Value');
checkbox(8) = get(bPress, 'Value');
checkbox(9) = get(cPress, 'Value');
checkbox(10) = get(dPress, 'Value');
checkbox(11) = get(ePress, 'Value');
checkbox(12) = get(fPress, 'Value');


[legData, chestData, press, ~] = loadData();
cla(axes1);
plotData(axes1, press, legData, chestData, slider, checkbox);

% --- Outputs from this function are returned to the command line.
function varargout = alignGyro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%syncData(slider);
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cutData.
function cutData_Callback(hObject, eventdata, handles)
% hObject    handle to cutData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
slider(1) = get(handles.slider1,'Value');
slider(2) = get(handles.slider2,'Value');
slider(3) = get(handles.slider3,'Value');
slider(4) = get(handles.slider4,'Value');
slider(5) = get(handles.slider5,'Value');
slider(6) = get(handles.slider6,'Value');
syncData(slider);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in yLeg.
function yLeg_Callback(hObject, eventdata, handles)
% hObject    handle to yLeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of yLeg


% --- Executes on button press in xLeg.
function xLeg_Callback(hObject, eventdata, handles)
% hObject    handle to xLeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of xLeg


% --- Executes on button press in zLeg.
function zLeg_Callback(hObject, eventdata, handles)
% hObject    handle to zLeg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of zLeg


% --- Executes on button press in yChest.
function yChest_Callback(hObject, eventdata, handles)
% hObject    handle to yChest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of yChest


% --- Executes on button press in xChest.
function xChest_Callback(hObject, eventdata, handles)
% hObject    handle to xChest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of xChest


% --- Executes on button press in zChest.
function zChest_Callback(hObject, eventdata, handles)
% hObject    handle to zChest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of zChest


% --- Executes on button press in bPress.
function bPress_Callback(hObject, eventdata, handles)
% hObject    handle to bPress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of bPress


% --- Executes on button press in aPress.
function aPress_Callback(hObject, eventdata, handles)
% hObject    handle to aPress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of aPress


% --- Executes on button press in cPress.
function cPress_Callback(hObject, eventdata, handles)
% hObject    handle to cPress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of cPress


% --- Executes on button press in dPress.
function dPress_Callback(hObject, eventdata, handles)
% hObject    handle to dPress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of dPress


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in ePress.
function ePress_Callback(hObject, eventdata, handles)
% hObject    handle to ePress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of ePress


% --- Executes on button press in fPress.
function fPress_Callback(hObject, eventdata, handles)
% hObject    handle to fPress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

plotStuffAndSuch(handles.slider1, handles.slider2, ... 
    handles.slider3, handles.slider4, handles.slider5, handles.slider6, ...
    handles.xLeg, handles.yLeg, handles.zLeg, handles.xChest, ... 
    handles.yChest, handles.zChest, handles.aPress, handles.bPress, ...
    handles.cPress, handles.dPress, handles.ePress, handles.fPress, handles.axes1);
% Hint: get(hObject,'Value') returns toggle state of fPress
