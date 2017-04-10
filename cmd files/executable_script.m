clearvars
clear
clear all

disp('Hello! Here is the list of available types of engines to calculate:')
disp('1. Turbofan without afterburner')
disp('2. Turbofan with afterburner')
engine = input('Please, enter the number of the engine which you want to calculate: ');

%engine type
switch engine
    case 1
        turbofan_no_ab_cmd
    case 2
        turbofan_with_ab_cmd
    otherwise
        error('Wrong number!!!');
end

%error
if not(isreal(out_int))
    error('Mach numbers are complex numbers! Probably there is too high bypass ratio for the specified mach number of flight.');
end

disp('Calculations are done!')

c = 0;

%finishing loop
while c ~= 1
    disp('Type help if you do not know what to do next.')
    command = input('','s');
    
    c = strcmp(command, 'quit');
    %all alternatives
    if strcmp(command, 'save_given')
        file = input('Enter a name for this file: ','s');
        save_engine_given_parameters_txt( file, M0, mdot0, piF, FtoLPC, piC, BR, vc, cool1, cool2 );
    elseif strcmp(command, 'help')
        disp('save_given - Saves given parameters to the file.')
        disp('save_out - Saves the parameters through the entire engine to the file.')
        disp('save_eff - Saves the default efficiencies chosen with the "engine level" to the file.')
        disp('save_calculated - Saves the calculated parameters of the engine to the file.')
        disp('plot - Makes a plot (it is automaically saved).')
        disp('quit - Exits the program.')
    elseif strcmp(command, 'save_out')
        file = input('Enter a name for internal flow file: ','s');
        save_out_txt( file, out_int );
        file = input('Enter a name for external flow file: ','s');
        save_out_txt( file, out_ext );
    elseif strcmp(command, 'save_calculated')
        file = input('Enter a name for this file: ','s');
        save_engine_calculated_parameters_txt( file, kjint, kjext, kj, Tr, bj, etat, etap, eta );
    elseif strcmp(command, 'save_eff')
        file = input('Enter a name for this file: ','s');
        save_engine_eff_parameters_txt( file, parameters )
    elseif strcmp(command, 'plot')
        disp('Please specify which flow interests you:')
        disp('1 - internal, 2 - external')
        f = input('');
        disp('Please choose the X axis element:')
        disp('1 - section number, 2 - mass flow, 3 - k, 4 - R, 5 - total pressure, 6 - total temperature, 7 - static pressure, 8 - static temperature, 9 - mach number, 10 - velocity')
        numx = input('');
        disp('Please choose the Y axis element:')
        disp('1 - section number, 2 - mass flow, 3 - k, 4 - R, 5 - total pressure, 6 - total temperature, 7 - static pressure, 8 - static temperature, 9 - mach number, 10 - velocity')
        numy = input('');
        title_of_plot = input('Title of plot: ','s');
        label_on_x = input('Label of X: ','s');
        label_on_y = input('Label of Y: ','s');
        if f == 1
            make_plot( title_of_plot, label_on_x, label_on_y, out_int_plot(:,numx), out_int_plot(:,numy) );
        elseif f == 2
            make_plot( title_of_plot, label_on_x, label_on_y, out_ext(:,numx), out_ext(:,numy) );
        end
    end
end
