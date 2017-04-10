function [] = save_engine_calculated_parameters_one_flow_txt( file, kj, Tr, bj, etat, etap, eta )
%Funkcja

headers = ['Specific impulse [m/s]\t', 'Reduced Thrust [N]\t', 'Specific fuel consumption [kg/(N*s)]\t', 'Thermal efficiency\t', 'Propulsive efficiency\t', 'General efficiency\t']; 
fid = fopen(file, 'w');
fprintf(fid, [ headers '\n']);

fprintf(fid, '%f\t', [kj, Tr, bj, etat, etap, eta]);

fclose(fid);

end