function [] = save_out_txt( file, out )
%Funkcja

headers = ['Section\t' 'Air mass flow [kg/s]\t', 'Isentropic constant\t', 'R [J/(kg*K)]\t', 'Total pressure [Pa]\t', 'Total temperature [K]\t', 'Static pressure [Pa]\t', 'Static temperature [K]\t', 'Mach number\t', 'Velocity [m/s]\t']; 
fid = fopen(file, 'w');
[m, n] = size(out);
fprintf(fid, [ headers '\n']);

for i = 1:m
    for j = 1:n
        fprintf(fid, '%f\t', out(i, j));
    end
    fprintf(fid, '\n');
end

fclose(fid);

end