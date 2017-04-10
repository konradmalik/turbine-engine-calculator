function [] = save_iteration_txt( file, headers, out )
%Funkcja

fid = fopen(file, 'w');
i = size(headers);
n = 1;
while n<=i
    fprintf(fid, '%s\t', headers{:});
    n=n+1;
end
fprintf(fid, '\n');

[i, j] = size(out);

for n=1:i
    fprintf(fid, '%f\t', out(n,:));
    fprintf(fid, '\n');
end

fclose(fid);

end