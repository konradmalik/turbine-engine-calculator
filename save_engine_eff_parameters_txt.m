function [] = save_engine_eff_parameters_txt( file, out )
%Funkcja

headers = ['Inlet (pi)\t' 'Compressor (eta)\t', 'Fan (eta)\t', 'Combustor (pi)\t', 'Combustor (eta)\t', 'Turbine (eta)\t', 'Burner (pi)\t', 'Burner (eta)\t', 'Nozzle (pi)\t', 'Tt4 [K]\t', 'Tt7 [K]\t', 'Mechanical efficiency (eta)\t']; 
fid = fopen(file, 'w');
m = length(out);
fprintf(fid, [ headers '\n']);

for i = 1:m
    fprintf(fid, '%f\t', out(i));
end

fclose(fid);

end