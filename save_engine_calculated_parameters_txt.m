function [] = save_engine_calculated_parameters_txt( file, kjint, kjext, kj, Tr, bj, etat, etap, eta )
%Funkcja

headers = ['Specific impulse (internal) [m/s]\t' 'Specific impulse (external) [m/s]\t', 'Specific impulse [m/s]\t', 'Reduced Thrust [N]\t', 'Specific fuel consumption [kg/(N*s)]\t', 'Thermal efficiency\t', 'Propulsive efficiency\t', 'General efficiency\t']; 
fid = fopen(file, 'w');
fprintf(fid, [ headers '\n']);

fprintf(fid, '%f\t', [kjint, kjext, kj, Tr, bj, etat, etap, eta]);

fclose(fid);

end