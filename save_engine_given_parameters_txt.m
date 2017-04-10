function [] = save_engine_given_parameters_txt( file, M0, height, mdot0, Tt4, Tt7, piF, FtoLPC, piC, BR, vc, cool1, cool2 )
%Funkcja

headers = ['Flight mach number\t', 'Altitude [m]\t', 'Air mass flow [kg/s]\t', 'Tt4 [K]\t', 'Tt7 [K]\t', 'Fan compression\t', 'Fan to LPC compression ratio\t', 'Compressor compression\t', 'Bypass ratio\t', 'Bleed air (fraction)\t', 'Cooling air for HPT noozle vanes (fraction)\t', 'Cooling air for HPT rotor (fraction)\t']; 
fid = fopen(file, 'w');
fprintf(fid, [ headers '\n']);

fprintf(fid, '%f\t', [M0, height, mdot0, Tt4, Tt7, piF, FtoLPC, piC, BR, vc, cool1, cool2]);

fclose(fid);

end