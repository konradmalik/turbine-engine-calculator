function [ wy, lLPC ] = section_2i5( we, p, BR, piLPC )
%Funkcja bêdzie liczyæ parametry w przekroju za sprê¿ark¹ niskiego
%ciœnienia. Trzeba do niej wprowadziæ oprócz standardowych danych tak¿e
%stopieñ dwup., ca³kowity sprê¿ sprê¿arki, sprê¿ LPC
%zwraca te¿ pracê LPC

%sprawdzenie poprawnoœci danych
if BR <= 0
    error('le wprowadzony stosuek dwuprzep³ywowoœci!')
elseif piLPC <= 1
    error('le wprowadzony sprê¿!')
end

%wczytujemy dane
etac = p(2);

mdot = we(2);
k = we(3);
R = we(4);
pt = we(5);
Tt = we(6);
V = we(10);

%obliczenia
mdot_core = mdot /(BR + 1);

pt2i5= piLPC * pt;
lLPC = k/(k - 1) * R * Tt * (piLPC^((k - 1)/k) - 1) /etac;
Tt2i5 = Tt + lLPC/ (k * R /(k - 1));

T2i5 = Tt2i5 - (k - 1)*V^2/(2*k*R);
M = V/sqrt(k*R*T2i5);

p2i5 = pt2i5/ (1 + (k - 1)/2 * M^2)^(k/(k - 1));

%zapisujemy wartoœci
wy(1) = 2.5;
wy(2) = mdot_core;
wy(3) = k;
wy(4) = R;
wy(5) = pt2i5;
wy(6) = Tt2i5;
wy(7) = p2i5;
wy(8) = T2i5;
wy(9) = M;
wy(10) = V;

end

