function [ wy, lf ] = section_13( we, p, pif, BR)
%Funkcja liczy parametry w przekroju 13, po sprê¿eniu przez wentylator.
%Jako argument wejœciowy przyjmuje ona równie¿ sprê¿ wentylatora i BypassRatio.

%sprawdzenie poprawnoœci danych
if BR <= 0
    error('le wprowadzony stosuek dwuprzep³ywowoœci!')
elseif pif <= 1
    error('le wprowadzony sprê¿ wentylatora!')
end

%wczytywanie danch
etaf = p(3);

mdot = we(2);
k = we(3);
R = we(4);
pt = we(5);
Tt = we(6);
V = we(10);

%obliczenia
pt13 = pif * pt;
lf = k/(k - 1) * R * Tt * (pif^((k - 1)/k) - 1) /etaf;
Tt13 = Tt + lf/ (k * R /(k - 1));

T13 = Tt13 - (k - 1)*V^2/(2*k*R);
M = V/sqrt(k*R*T13);

p13 = pt13/ (1 + (k - 1)/2 * M^2)^(k/(k - 1));

mdot_bypass = mdot * BR / (BR + 1);

%zapisujemy wartoœci
wy(1) = 13;
wy(2) = mdot_bypass;
wy(3) = k;
wy(4) = R;
wy(5) = pt13;
wy(6) = Tt13;
wy(7) = p13;
wy(8) = T13;
wy(9) = M;
wy(10) = V;

end

