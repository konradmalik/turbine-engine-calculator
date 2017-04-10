function varargout = single_point_engine_choose(varargin)
% SINGLE_POINT_ENGINE_CHOOSE MATLAB code for single_point_engine_choose.fig
%      SINGLE_POINT_ENGINE_CHOOSE, by itself, creates a new SINGLE_POINT_ENGINE_CHOOSE or raises the existing
%      singleton*.
%
%      H = SINGLE_POINT_ENGINE_CHOOSE returns the handle to a new SINGLE_POINT_ENGINE_CHOOSE or the handle to
%      the existing singleton*.
%
%      SINGLE_POINT_ENGINE_CHOOSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SINGLE_POINT_ENGINE_CHOOSE.M with the given input arguments.
%
%      SINGLE_POINT_ENGINE_CHOOSE('Property','Value',...) creates a new SINGLE_POINT_ENGINE_CHOOSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before single_point_engine_choose_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to single_point_engine_choose_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help single_point_engine_choose

% Last Modified by GUIDE v2.5 13-Jun-2015 21:47:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @single_point_engine_choose_OpeningFcn, ...
                   'gui_OutputFcn',  @single_point_engine_choose_OutputFcn, ...
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


% --- Executes just before single_point_engine_choose is made visible.
function single_point_engine_choose_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to single_point_engine_choose (see VARARGIN)

% Choose default command line output for single_point_engine_choose
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes single_point_engine_choose wait for user response (see UIRESUME)
% uiwait(handles.single_point_engine_choose);


% --- Outputs from this function are returned to the command line.
function varargout = single_point_engine_choose_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in engine_types_listbox.
function engine_types_listbox_Callback(hObject, eventdata, handles)
% hObject    handle to engine_types_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns engine_types_listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from engine_types_listbox

contents = cellstr(get(hObject,'String'));
selected = contents{get(hObject,'Value')};
handles.selection = selected;

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function engine_types_listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to engine_types_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in title_proceed_button.
function title_proceed_button_Callback(hObject, eventdata, handles)
% hObject    handle to title_proceed_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switch handles.selection
    case 'Turbofan Dual-spool with Two Exhausts'
        close(single_point_engine_choose)
        run('turbofan_no_ab_gui')
    case 'Turbofan Dual-spool with Afterburner'
        close(single_point_engine_choose)
        run('turbofan_with_ab_gui')
        
end


% --- Executes on button press in back_button.
function back_button_Callback(hObject, eventdata, handles)
% hObject    handle to back_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(single_point_engine_choose)
run('start')
