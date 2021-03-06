function varargout = GUI_VSMP2O(varargin)
% GUI_VSMP2O MATLAB code for GUI_VSMP2O.fig
%      GUI_VSMP2O, by itself, creates a new GUI_VSMP2O or raises the existing
%      singleton*.
%
%      H = GUI_VSMP2O returns the handle to a new GUI_VSMP2O or the handle to
%      the existing singleton*.
%
%      GUI_VSMP2O('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_VSMP2O.M with the given input arguments.
%
%      GUI_VSMP2O('Property','Value',...) creates a new GUI_VSMP2O or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_VSMP2O_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_VSMP2O_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_VSMP2O

% Last Modified by GUIDE v2.5 24-May-2018 22:54:54

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_VSMP2O_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_VSMP2O_OutputFcn, ...
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


% --- Executes just before GUI_VSMP2O is made visible.
function GUI_VSMP2O_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_VSMP2O (see VARARGIN)

% Choose default command line output for GUI_VSMP2O
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_VSMP2O wait for user response (see UIRESUME)
% uiwait(handles.figure1);
jinit=[90;60;-120];
assignin('base','jinit',jinit); 

axes(handles.axes1);
FKdraw(jinit(1,1),jinit(2,1),jinit(3,1));
ax_properties = get(gca);
assignin('base','pov',ax_properties.View);

% --- Outputs from this function are returned to the command line.
function varargout = GUI_VSMP2O_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


varargout{1} = handles.output;
%% FK
function pushbutton1_Callback(hObject, eventdata, handles)
axes(handles.axes1);
jinit=evalin('base','jinit');
FKdraw(jinit(1,1),jinit(2,1),jinit(3,1));
set( handles.text1,'String', num2str(90) );
set( handles.text2,'String', num2str(60) );
set( handles.text3,'String', num2str(-120) );



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val1=str2double(get(handles.edit1,'String'));
val2=str2double(get(handles.edit2,'String'));
val3 = str2double(get(handles.edit3,'String'));
val=[val1;val2;val3];
assignin('base','val',val);
set( handles.text3,'String', num2str(val3,3) );
set( handles.text2,'String', num2str(val2,3) );
set( handles.text1,'String', num2str(val1,3) );
axes(handles.axes1);
FKdraw(val1,val2,val3);
view(evalin('base','pov'));


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
