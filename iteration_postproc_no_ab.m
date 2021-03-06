function varargout = iteration_postproc_no_ab(varargin)
% ITERATION_POSTPROC_NO_AB MATLAB code for iteration_postproc_no_ab.fig
%      ITERATION_POSTPROC_NO_AB, by itself, creates a new ITERATION_POSTPROC_NO_AB or raises the existing
%      singleton*.
%
%      H = ITERATION_POSTPROC_NO_AB returns the handle to a new ITERATION_POSTPROC_NO_AB or the handle to
%      the existing singleton*.
%
%      ITERATION_POSTPROC_NO_AB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ITERATION_POSTPROC_NO_AB.M with the given input arguments.
%
%      ITERATION_POSTPROC_NO_AB('Property','Value',...) creates a new ITERATION_POSTPROC_NO_AB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before iteration_postproc_no_ab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to iteration_postproc_no_ab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help iteration_postproc_no_ab

% Last Modified by GUIDE v2.5 25-Jun-2015 19:08:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @iteration_postproc_no_ab_OpeningFcn, ...
                   'gui_OutputFcn',  @iteration_postproc_no_ab_OutputFcn, ...
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


% --- Executes just before iteration_postproc_no_ab is made visible.
function iteration_postproc_no_ab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to iteration_postproc_no_ab (see VARARGIN)

% Choose default command line output for iteration_postproc_no_ab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

handles.engine_efficiencies_name = 'engine_efficiencies.txt';
handles.given_parameters_name = 'given_parameters.txt';
handles.results_name = 'iteration.txt';
handles.headers = {'Altitude', 'Mach number', 'Specific impulse (internal) [m/s]', 'Specific impulse (external) [m/s]', 'Specific impulse [m/s]', 'Fuel flow [kg/s]', 'Specific fuel consumption [kg/(N*s)]','Pt9/P9', 'P0/P9', 'V9/V0', 'Thermal efficiency', 'Propulsive efficiency', 'General efficiency'};

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes iteration_postproc_no_ab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = iteration_postproc_no_ab_OutputFcn(hObject, eventdata, handles) 
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

mdot0 = evalin('base','mdot0');
Tt4 = evalin('base','temperature');
piF = evalin('base','piF');
FtoLPC = evalin('base','FtoLPC');
piC = evalin('base','piC');
BR = evalin('base','BR');
vc = evalin('base','vc');
cool1 = evalin('base','cool1');
cool2 = evalin('base','cool2');
save_engine_given_parameters_txt( handles.given_parameters_name, nan, nan, mdot0, Tt4, nan, piF, FtoLPC, piC, BR, vc, cool1, cool2 )

% --- Executes on button press in results_saver.
function results_saver_Callback(hObject, eventdata, handles)
% hObject    handle to results_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

out = evalin('base','out');
save_iteration_txt( handles.results_name, handles.headers, out )

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



function iterationresults_filename_Callback(hObject, eventdata, handles)
% hObject    handle to iterationresults_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterationresults_filename as text
%        str2double(get(hObject,'String')) returns contents of iterationresults_filename as a double

handles.results_name = get(hObject,'String');

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function iterationresults_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterationresults_filename (see GCBO)
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


if strcmpi(contents{get(hObject,'Value')}, 'Iteration results')
    out = evalin('base', 'out');
    figure;
    uitable;
    set(uitable,'Units','normalized','visible','on','Data',out,'ColumnName',handles.headers,'Position',[0 0 1.0 1.0]);
elseif strcmpi(contents{get(hObject,'Value')}, 'Given parameters')
    mdot0 = evalin('base','mdot0');
    Tt4 = evalin('base','temperature');
    piF = evalin('base','piF');
    FtoLPC = evalin('base','FtoLPC');
    piC = evalin('base','piC');
    BR = evalin('base','BR');
    vc = evalin('base','vc');
    cool1 = evalin('base','cool1');
    cool2 = evalin('base','cool2');
    figure;
    uitable;
    given_param = [nan, nan, mdot0, Tt4, nan, piF, FtoLPC, piC, BR, vc, cool1, cool2];
    column_names = {'Flight mach number', 'Height [m]', 'Air mass flow [kg/s]', 'Tt4 [K]', 'Tt7 [K]', 'Fan compression', 'Fan to LPC compression ratio', 'Compressor compression', 'Bypass ratio', 'Bleed air (fraction)', 'Cooling air for HPT noozle vanes (fraction)', 'Cooling air for HPT rotor (fraction)'}; 
    set(uitable,'Units','normalized','visible','on','Data',given_param,'ColumnName',column_names,'Position',[0 0 1.0 1.0]);
elseif strcmpi(contents{get(hObject,'Value')}, 'Engine efficiencies')
    parameters = evalin('base','parameters');
    figure;
    uitable;
    column_names = {'Inlet (pi)' 'Compressor (eta)', 'Fan (eta)', 'Combustor (pi)', 'Combustor (eta)', 'Turbine (eta)', 'Burner (pi)', 'Burner (eta)', 'Nozzle (pi)', 'Tt4 [K]', 'Tt7 [K]', 'Mechanical efficiency (eta)'};
    set(uitable,'Units','normalized','visible','on','Data',parameters,'ColumnName',column_names,'Position',[0 0 1.0 1.0]);
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



% --- Executes on button press in graph_maker.
function graph_maker_Callback(hObject, eventdata, handles)
% hObject    handle to graph_maker (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

out = evalin('base', 'out');
mach_start= evalin('base', 'mach_start');
mach_step = evalin('base', 'mach_step');
mach_end = evalin('base', 'mach_end');
height_start = evalin('base', 'height_start');
height_step = evalin('base', 'height_step');
height_end = evalin('base', 'height_end');
handles.out = out;

nm = (mach_end-mach_start)/mach_step +1; %number of mach iterations
na = (height_end-height_start)/height_step +1; %number of height iterations

if strcmpi('Altitude [m]',handles.xaxis)
    figure
    hold on
    for i=1:nm
        if strcmpi(handles.yaxis, 'Specific impulse (internal) [m/s]')
            handles.ygraph = out(i:nm:size(out,1),3);
        elseif strcmpi(handles.yaxis, 'Specific impulse (external) [m/s]')
            handles.ygraph = out(i:nm:size(out,1),4);
        elseif strcmpi(handles.yaxis, 'Specific impulse [m/s]')
            handles.ygraph = out(i:nm:size(out,1),5);
        elseif strcmpi(handles.yaxis, 'Fuel flow [kg/s]')
            handles.ygraph = out(i:nm:size(out,1),6);
        elseif strcmpi(handles.yaxis, 'Specific fuel consumption [kg/(N*s)]')
            handles.ygraph = out(i:nm:size(out,1),7);
        elseif strcmpi(handles.yaxis, 'Pt9/P9')
            handles.ygraph = out(i:nm:size(out,1),8);
        elseif strcmpi(handles.yaxis, 'P0/P9')
            handles.ygraph = out(i:nm:size(out,1),9);
        elseif strcmpi(handles.yaxis, 'V9/V0')
            handles.ygraph = out(i:nm:size(out,1),10);
        elseif strcmpi(handles.yaxis, 'Thermal efficiency')
            handles.ygraph = out(i:nm:size(out,1),11);
        elseif strcmpi(handles.yaxis, 'Propulsive efficiency')
            handles.ygraph = out(i:nm:size(out,1),12);
        elseif strcmpi(handles.yaxis, 'General efficiency')
            handles.ygraph = out(i:nm:size(out,1),13);
        end
        
        make_plot_hold( 'Altitude [m]', handles.yaxis, [height_start:height_step:height_end], handles.ygraph, 1  )
        
    end
    legenda_num = mach_start:mach_step:mach_end;
    legenda = strread(num2str(legenda_num),'%s');
    legend(legenda);
    hold off
    
else
    i=1;
    figure
    hold on
    for n=1:na
        if strcmpi(handles.yaxis, 'Specific impulse (internal) [m/s]')
            handles.ygraph = out(i:i+nm-1,3);
        elseif strcmpi(handles.yaxis, 'Specific impulse (external) [m/s]')
            handles.ygraph = out(i:i+nm-1,4);
        elseif strcmpi(handles.yaxis, 'Specific impulse [m/s]')
            handles.ygraph = out(i:i+nm-1,5);
        elseif strcmpi(handles.yaxis, 'Fuel flow [kg/s]')
            handles.ygraph = out(i:i+nm-1,6);
        elseif strcmpi(handles.yaxis, 'Specific fuel consumption [kg/(N*s)]')
            handles.ygraph = out(i:i+nm-1,7);
        elseif strcmpi(handles.yaxis, 'Pt9/P9')
            handles.ygraph = out(i:i+nm-1,8);
        elseif strcmpi(handles.yaxis, 'P0/P9')
            handles.ygraph = out(i:i+nm-1,9);
        elseif strcmpi(handles.yaxis, 'V9/V0')
            handles.ygraph = out(i:i+nm-1,10);
        elseif strcmpi(handles.yaxis, 'Thermal efficiency')
            handles.ygraph = out(i:i+nm-1,11);
        elseif strcmpi(handles.yaxis, 'Propulsive efficiency')
            handles.ygraph = out(i:i+nm-1,12);
        elseif strcmpi(handles.yaxis, 'General efficiency')
            handles.ygraph = out(i:i+nm-1,13);
        end
        i = i + nm;
        make_plot_hold( 'Mach number', handles.yaxis, [mach_start:mach_step:mach_end], handles.ygraph, 1  )
        
    end
    legenda_num = height_start:height_step:height_end;
    legenda = strread(num2str(legenda_num),'%s');
    legend(legenda);
    hold off
end
        
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


% --- Executes on selection change in yaxis_graph_menu.
function yaxis_graph_menu_Callback(hObject, eventdata, handles)
% hObject    handle to yaxis_graph_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns yaxis_graph_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from yaxis_graph_menu

contents = cellstr(get(hObject,'String'));
handles.yaxis = contents{get(hObject,'Value')};
out = evalin('base', 'out');

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function yaxis_graph_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yaxis_graph_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in engine_efficiencies_saver.
function engine_efficiencies_saver_Callback(hObject, eventdata, handles)
% hObject    handle to engine_efficiencies_saver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

parameters = evalin('base','parameters');
save_engine_eff_parameters_txt( handles.engine_efficiencies_name, parameters )

function engine_efficiencies_filename_Callback(hObject, eventdata, handles)
% hObject    handle to engine_efficiencies_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of engine_efficiencies_filename as text
%        str2double(get(hObject,'String')) returns contents of engine_efficiencies_filename as a double

handles.engine_efficiencies_name = get(hObject,'String');

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


% --- Executes on button press in back_button.
function back_button_Callback(hObject, eventdata, handles)
% hObject    handle to back_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(iteration_postproc_no_ab)
run('start')



function height_plot_edit_Callback(hObject, eventdata, handles)
% hObject    handle to height_plot_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of height_plot_edit as text
%        str2double(get(hObject,'String')) returns contents of height_plot_edit as a double


% --- Executes during object creation, after setting all properties.
function height_plot_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to height_plot_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in xaxis_choose.
function xaxis_choose_Callback(hObject, eventdata, handles)
% hObject    handle to xaxis_choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns xaxis_choose contents as cell array
%        contents{get(hObject,'Value')} returns selected item from xaxis_choose

contents = cellstr(get(hObject,'String'));
handles.xaxis = contents{get(hObject,'Value')};

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function xaxis_choose_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xaxis_choose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
