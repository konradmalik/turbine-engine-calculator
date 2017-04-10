function [ wy, lHPC ] = section_3( we, p, piHPC )
%Funkcja bêdzie liczyæ parametry w przekroju za sprê¿ark¹ wysokiego
%ciœnienia. Trzeba do niej wprowadziæ oprócz standardowych danych tak¿e
%sprê¿ HPC
%zwraca te¿ pracê HPC

%sprawdzenie poprawnoœci danych
if piHPC <= 1
    error('le wprowadzony sprê¿!')
end

%wczytujemy dane
etac = p(3);

mdot = we(2);
k = we(3);
R = we(4);
pt = we(5);
Tt = we(6);
V = we(10);

%obliczenia
pt3 = piHPC * pt;
lHPC = k/(k - 1) * R * Tt * (piHPC^((k - 1)/k) - 1) /etac;
Tt3 = Tt + lHPC/ (k * R /(k - 1));

T3 = Tt3 - (k - 1)*V^2/(2*k*R);
M = V/sqrt(k*R*T3);

p3 = pt3/ (1 + (k - 1)/2 * M^2)^(k/(k - 1));

%zapisujemy wartoœci
wy(1) = 3;
wy(2) = mdot;
wy(3) = k;
wy(4) = R;
wy(5) = pt3;
wy(6) = Tt3;
wy(7) = p3;
wy(8) = T3;
wy(9) = M;
wy(10) = V;

end