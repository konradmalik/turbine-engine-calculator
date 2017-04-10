function varargout = postproc_with_ab(varargin)
% postproc_with_ab MATLAB code for postproc_with_ab.fig
%      postproc_with_ab, by itself, creates a new postproc_with_ab or raises the existing
%      singleton*.
%
%      H = postproc_with_ab returns the handle to a new postproc_with_ab or the handle to
%      the existing singleton*.
%
%      postproc_with_ab('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in postproc_with_ab.M with the given input arguments.
%
%      postproc_with_ab('Property','Value',...) creates a new postproc_with_ab or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before postproc_with_ab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to postproc_with_ab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help postproc_with_ab

% Last Modified by GUIDE v2.5 28-Jun-2015 13:08:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @postproc_with_ab_OpeningFcn, ...
                   'gui_OutputFcn',  @postproc_with_ab_OutputFcn, ...
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


% --- Executes just before postproc_with_ab is made visible.
function postproc_with_ab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to postproc_with_ab (see VARARGIN)

% Choose default command line output for postproc_with_ab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

handles.given_parameters_name = 'given_parameters.txt';
handles.engine_efficiencies_name = 'engine_efficiencies.txt';
handles.main_parameters_name = 'main_engine_parameters.txt';
handles.internal_parameters_name = 'internal_parameters_in_sections.txt';
handles.external_parameters_name = 'external_parameters_in_sections.txt';

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes postproc_with_ab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = postproc_with_ab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in given_parameters_saver.
function given_parameters_saver_Callback(hObject, eventdata, handles)
% hObject    handle to given_parameters_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

M0 = evalin('base','M0');
height = evalin('base','height');
mdot0 = evalin('base','mdot0');
Tt4 = evalin('base','temperature');
Tt7 = evalin('base','temperature7');
piF = evalin('base','piF');
FtoLPC = evalin('base','FtoLPC');
piC = evalin('base','piC');
BR = evalin('base','BR');
vc = evalin('base','vc');
cool1 = evalin('base','cool1');
cool2 = evalin('base','cool2');
save_engine_given_parameters_txt( handles.given_parameters_name, M0, height, mdot0, Tt4, Tt7, piF, FtoLPC, piC, BR, vc, cool1, cool2 )

% --- Executes on button press in engine_efficiencies_saver.
function engine_efficiencies_saver_Callback(hObject, eventdata, handles)
% hObject    handle to engine_efficiencies_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

parameters = evalin('base','parameters');
save_engine_eff_parameters_txt( handles.engine_efficiencies_name, parameters )

% --- Executes on button press in main_engine_parameters_saver.
function main_engine_parameters_saver_Callback(hObject, eventdata, handles)
% hObject    handle to main_engine_parameters_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

kj = evalin('base','kj');
Tr = evalin('base','Tr');
bj = evalin('base','bj');
etat = evalin('base','etat');
etap = evalin('base','etap');
eta = evalin('base','eta');
save_engine_calculated_parameters_one_flow_txt( handles.main_parameters_name, kj, Tr, bj, etat, etap, eta )

% --- Executes on button press in internal_parameters_saver.
function internal_parameters_saver_Callback(hObject, eventdata, handles)
% hObject    handle to internal_parameters_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

out_int = evalin('base','out_int');
save_out_txt( handles.internal_parameters_name, out_int )


function given_parameters_filename_Callback(hObject, eventdata, handles)
% hObject    handle to given_parameters_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of given_parameters_filename as text
%        str2double(get(hObject,'String')) returns contents of given_parameters_filename as a double

handles.given_parameters_name = get(hObject,'String');

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function given_parameters_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to given_parameters_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function engine_efficiencies_filename_Callback(hObject, eventdata, handles)
% hObject    handle to engine_efficiencies_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of engine_efficiencies_filename as text
%        str2double(get(hObject,'String')) returns contents of engine_efficiencies_filename as a double

handles.engine_efficiencies_name = get(hObject,'String');

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function engine_efficiencies_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to engine_efficiencies_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function main_engine_parameters_filename_Callback(hObject, eventdata, handles)
% hObject    handle to main_engine_parameters_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of main_engine_parameters_filename as text
%        str2double(get(hObject,'String')) returns contents of main_engine_parameters_filename as a double

handles.main_parameters_name = get(hObject,'String');

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function main_engine_parameters_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to main_engine_parameters_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function internal_parameters_filename_Callback(hObject, eventdata, handles)
% hObject    handle to internal_parameters_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of internal_parameters_filename as text
%        str2double(get(hObject,'String')) returns contents of internal_parameters_filename as a double

handles.internal_parameters_name = get(hObject,'String');

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function internal_parameters_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to internal_parameters_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in results_list.
function results_list_Callback(hObject, eventdata, handles)
% hObject    handle to results_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns results_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from results_list
contents = cellstr(get(hObject,'String'));


if strcmpi(contents{get(hObject,'Value')}, 'Internal flow parameters')
    out_int = evalin('base', 'out_int');
    figure;
    uitable;
    column_names = {'Section', 'Air mass flow [kg/s]', 'Isentropic constant', 'R [J/(kg*K)]', 'Total pressure [Pa]', 'Total temperature [K]', 'Static pressure [Pa]', 'Static temperature [K]', 'Mach number', 'Velocity [m/s]'}; 
    set(uitable,'Units','normalized','visible','on','Data',out_int,'ColumnName',column_names,'Position',[0 0 1.0 1.0]);
elseif strcmpi(contents{get(hObject,'Value')}, 'External flow parameters')
    out_ext = evalin('base', 'out_ext');
    figure;
    uitable;
    column_names = {'Section', 'Air mass flow [kg/s]', 'Isentropic constant', 'R [J/(kg*K)]', 'Total pressure [Pa]', 'Total temperature [K]', 'Static pressure [Pa]', 'Static temperature [K]', 'Mach number', 'Velocity [m/s]'}; 
    set(uitable,'Units','normalized','visible','on','Data',out_ext,'ColumnName',column_names,'Position',[0 0 1.0 1.0]);
elseif strcmpi(contents{get(hObject,'Value')}, 'Given parameters')
    M0 = evalin('base','M0');
    height = evalin('base','height');
    mdot0 = evalin('base','mdot0');
    Tt4 = evalin('base','temperature');
    Tt7 = evalin('base','temperature7');
    piF = evalin('base','piF');
    FtoLPC = evalin('base','FtoLPC');
    piC = evalin('base','piC');
    BR = evalin('base','BR');
    vc = evalin('base','vc');
    cool1 = evalin('base','cool1');
    cool2 = evalin('base','cool2');
    figure;
    uitable;
    given_param = [M0, height, mdot0, Tt4, Tt7, piF, FtoLPC, piC, BR, vc, cool1, cool2];
    column_names = {'Flight mach number', 'Height [m]', 'Air mass flow [kg/s]', 'Tt4 [K]', 'Tt7 [K]', 'Fan compression', 'Fan to LPC compression ratio', 'Compressor compression', 'Bypass ratio', 'Bleed air (fraction)', 'Cooling air for HPT noozle vanes (fraction)', 'Cooling air for HPT rotor (fraction)'}; 
    set(uitable,'Units','normalized','visible','on','Data',given_param,'ColumnName',column_names,'Position',[0 0 1.0 1.0]);
elseif strcmpi(contents{get(hObject,'Value')}, 'Engine efficiencies')
    parameters = evalin('base','parameters');
    figure;
    uitable;
    column_names = {'Inlet (pi)' 'Compressor (eta)', 'Fan (eta)', 'Combustor (pi)', 'Combustor (eta)', 'Turbine (eta)', 'Burner (pi)', 'Burner (eta)', 'Nozzle (pi)', 'Tt4 [K]', 'Tt7 [K]', 'Mechanical efficiency (eta)'};
    set(uitable,'Units','normalized','visible','on','Data',parameters,'ColumnName',column_names,'Position',[0 0 1.0 1.0]);
elseif strcmpi(contents{get(hObject,'Value')}, 'Main engine parameters')
    kj = evalin('base','kj');
    Tr = evalin('base','Tr');
    bj = evalin('base','bj');
    etat = evalin('base','etat');
    etap = evalin('base','etap');
    eta = evalin('base','eta');
    figure;
    uitable;
    main_param = [kj, Tr, bj, etat, etap, eta];
    column_names = {'Specific impulse [m/s]', 'Reduced Thrust [N]', 'Specific fuel consumption [kg/(N*s)]', 'Thermal efficiency', 'Propulsive efficiency', 'General efficiency'};
    set(uitable,'Units','normalized','visible','on','Data',main_param,'ColumnName',column_names,'Position',[0 0 1.0 1.0]);
end


% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function results_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to results_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in xaxis_menu.
function xaxis_menu_Callback(hObject, eventdata, handles)
% hObject    handle to xaxis_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns xaxis_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from xaxis_menu

contents = cellstr(get(hObject,'String'));
handles.xaxis = contents{get(hObject,'Value')};
out_int_plot = evalin('base', 'out_int_plot');
out_ext = evalin('base', 'out_ext');

if strcmpi(handles.graph_flow,'Internal flow')
    if strcmpi(handles.xaxis, 'Section')
        handles.xgraph = out_int_plot(:,1);
    elseif strcmpi(handles.xaxis, 'Mass flow [kg/s]')
        handles.xgraph = out_int_plot(:,2);
    elseif strcmpi(handles.xaxis, 'Isentropic coefficient')
        handles.xgraph = out_int_plot(:,3);
    elseif strcmpi(handles.xaxis, 'Gas constant [J/kgK]')
        handles.xgraph = out_int_plot(:,4);
    elseif strcmpi(handles.xaxis, 'Total pressure [Pa]')
        handles.xgraph = out_int_plot(:,5);
    elseif strcmpi(handles.xaxis, 'Total temperature [K]')
        handles.xgraph = out_int_plot(:,6);
    elseif strcmpi(handles.xaxis, 'Static pressure [Pa]')
        handles.xgraph = out_int_plot(:,7);
    elseif strcmpi(handles.xaxis, 'Static temperature [K]')
        handles.xgraph = out_int_plot(:,8);
    elseif strcmpi(handles.xaxis, 'Mach number')
        handles.xgraph = out_int_plot(:,9);
    elseif strcmpi(handles.xaxis, 'Velocity [m/s]')
        handles.xgraph = out_int_plot(:,10);
    end
elseif strcmpi(handles.graph_flow,'External flow')
    if strcmpi(handles.xaxis, 'Section')
        handles.xgraph = out_ext(:,1);
    elseif strcmpi(handles.xaxis, 'Mass flow [kg/s]')
        handles.xgraph = out_ext(:,2);
    elseif strcmpi(handles.xaxis, 'Isentropic coefficient')
        handles.xgraph = out_ext(:,3);
    elseif strcmpi(handles.xaxis, 'Gas constant [J/kgK]')
        handles.xgraph = out_ext(:,4);
    elseif strcmpi(handles.xaxis, 'Total pressure [Pa]')
        handles.xgraph = out_ext(:,5);
    elseif strcmpi(handles.xaxis, 'Total temperature [K]')
        handles.xgraph = out_ext(:,6);
    elseif strcmpi(handles.xaxis, 'Static pressure [Pa]')
        handles.xgraph = out_ext(:,7);
    elseif strcmpi(handles.xaxis, 'Static temperature [K]')
        handles.xgraph = out_ext(:,8);
    elseif strcmpi(handles.xaxis, 'Mach number')
        handles.xgraph = out_ext(:,9);
    elseif strcmpi(handles.xaxis, 'Velocity [m/s]')
        handles.xgraph = out_ext(:,10);
    end
end

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function xaxis_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xaxis_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in yaxis_menu.
function yaxis_menu_Callback(hObject, eventdata, handles)
% hObject    handle to yaxis_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns yaxis_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from yaxis_menu

contents = cellstr(get(hObject,'String'));
handles.yaxis = contents{get(hObject,'Value')};
out_int_plot = evalin('base', 'out_int_plot');
out_ext = evalin('base', 'out_ext');

if strcmpi(handles.graph_flow,'Internal flow')
    if strcmpi(handles.yaxis, 'Section')
        handles.ygraph = out_int_plot(:,1);
    elseif strcmpi(handles.yaxis, 'Mass flow [kg/s]')
        handles.ygraph = out_int_plot(:,2);
    elseif strcmpi(handles.yaxis, 'Isentropic coefficient')
        handles.ygraph = out_int_plot(:,3);
    elseif strcmpi(handles.yaxis, 'Gas constant [J/kgK]')
        handles.ygraph = out_int_plot(:,4);
    elseif strcmpi(handles.yaxis, 'Total pressure [Pa]')
        handles.ygraph = out_int_plot(:,5);
    elseif strcmpi(handles.yaxis, 'Total temperature [K]')
        handles.ygraph = out_int_plot(:,6);
    elseif strcmpi(handles.yaxis, 'Static pressure [Pa]')
        handles.ygraph = out_int_plot(:,7);
    elseif strcmpi(handles.yaxis, 'Static temperature [K]')
        handles.ygraph = out_int_plot(:,8);
    elseif strcmpi(handles.yaxis, 'Mach number')
        handles.ygraph = out_int_plot(:,9);
    elseif strcmpi(handles.yaxis, 'Velocity [m/s]')
        handles.ygraph = out_int_plot(:,10);
    end
elseif strcmpi(handles.graph_flow,'External flow')
    if strcmpi(handles.yaxis, 'Section')
        handles.ygraph = out_ext(:,1);
    elseif strcmpi(handles.yaxis, 'Mass flow [kg/s]')
        handles.ygraph = out_ext(:,2);
    elseif strcmpi(handles.yaxis, 'Isentropic coefficient')
        handles.ygraph = out_ext(:,3);
    elseif strcmpi(handles.yaxis, 'Gas constant [J/kgK]')
        handles.ygraph = out_ext(:,4);
    elseif strcmpi(handles.yaxis, 'Total pressure [Pa]')
        handles.ygraph = out_ext(:,5);
    elseif strcmpi(handles.yaxis, 'Total temperature [K]')
        handles.ygraph = out_ext(:,6);
    elseif strcmpi(handles.yaxis, 'Static pressure [Pa]')
        handles.ygraph = out_ext(:,7);
    elseif strcmpi(handles.yaxis, 'Static temperature [K]')
        handles.ygraph = out_ext(:,8);
    elseif strcmpi(handles.yaxis, 'Mach number')
        handles.ygraph = out_ext(:,9);
    elseif strcmpi(handles.yaxis, 'Velocity [m/s]')
        handles.ygraph = out_ext(:,10);
    end
end

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function yaxis_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yaxis_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in graph_maker.
function graph_maker_Callback(hObject, eventdata, handles)
% hObject    handle to graph_maker (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

make_plot( handles.xaxis, handles.yaxis, handles.xgraph, handles.ygraph, 0  )

% --- Executes during object creation, after setting all properties.
function results_table_CreateFcn(hObject, eventdata, handles)
% hObject    handle to results_table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in external_parameters_saver.
function external_parameters_saver_Callback(hObject, eventdata, handles)
% hObject    handle to external_parameters_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

out_ext = evalin('base','out_ext');
save_out_txt( handles.external_parameters_name, out_ext )


function external_parameters_filename_Callback(hObject, eventdata, handles)
% hObject    handle to external_parameters_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of external_parameters_filename as text
%        str2double(get(hObject,'String')) returns contents of external_parameters_filename as a double

handles.external_parameters_name = get(hObject,'String');

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function external_parameters_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to external_parameters_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in graph_flow_chooser.
function graph_flow_chooser_Callback(hObject, eventdata, handles)
% hObject    handle to graph_flow_chooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graph_flow_chooser contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graph_flow_chooser

contents = cellstr(get(hObject,'String'));
handles.graph_flow = contents{get(hObject,'Value')};
% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function graph_flow_chooser_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph_flow_chooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in results_table.
function results_table_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to results_table (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in back_button.
function back_button_Callback(hObject, eventdata, handles)
% hObject    handle to back_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(postproc_with_ab)
run('start')


% --- Executes during object deletion, before destroying properties.
function graph_flow_chooser_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to graph_flow_chooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over graph_flow_chooser.
function graph_flow_chooser_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to graph_flow_chooser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on graph_flow_chooser and none of its controls.
function graph_flow_chooser_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to graph_flow_chooser (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function xaxis_menu_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to xaxis_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function given_parameters_saver_CreateFcn(hObject, eventdata, handles)
% hObject    handle to given_parameters_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function engine_efficiencies_saver_CreateFcn(hObject, eventdata, handles)
% hObject    handle to engine_efficiencies_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function main_engine_parameters_saver_CreateFcn(hObject, eventdata, handles)
% hObject    handle to main_engine_parameters_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function internal_parameters_saver_CreateFcn(hObject, eventdata, handles)
% hObject    handle to internal_parameters_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function external_parameters_saver_CreateFcn(hObject, eventdata, handles)
% hObject    handle to external_parameters_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
