function [ wy, dysza ] = section_9( we, p, cisnienieatmo)
%Funkcja liczy parametry w przekroju 19 (wylotowym).
%musi wczytaæ ciœnienie otoczenia!!!
%Sprawdza z domyœlnego warunku jak¹ dyszê zastosowaæ
%zwraca oprócz parametrów nazwê zastosowanej dyszy

%wczytywanie danych
pin = p(9);

k = we(3);
R = we(4);
pt17 = we(5);
Tt17 = we(6);
T17 = we(8);

%obliczenia
%sprawdzamy jaka dac dysze
pinatmo = cisnienieatmo / pt17;
picr = (2/(k + 1))^(k/(k - 1));

if pinatmo > 1
    errordlg('Pressure before outlet lower than the atmospheric! Try lowering BR or piF or increasing piC or Tt4.')
end

%dla ka¿dego przypadku
Tt19 = Tt17;

%du¿e ify!!!!
if pinatmo >= picr
    dysza = 'Covergent nozzle, full expansion';
    p19 = cisnienieatmo;
    V19 = pin * sqrt(2 * k * R * T17/(k - 1) * (1 - pinatmo^((k - 1)/k)));
    T19 = Tt17 - V19^2 * ((k - 1)/(2 * k * R));
    M19 = V19 / sqrt(k * R * T19);
    pt19 = p19* ((1 + (k - 1)/2 * M19^2)^(k/(k - 1)));
    
elseif picr > pinatmo && pinatmo > 0.2
    dysza = 'Covergent nozzle, critical flow not fully expanded';
    M19 = 1;
    V19 = pin * sqrt(2 * k * R * Tt17/(k + 1));
    p19 = picr * pt17;
    pt19 = p19 * (1 + (k - 1)/2 * M19^2)^(k/(k - 1));
    T19 = Tt17 - V19^2 * ((k - 1)/(2 * k * R));
    
elseif pinatmo <= 0.2
    dysza = 'Covergent-divergent nozzle, full expansion';
    p19 = cisnienieatmo;
    V19 = pin * sqrt(2 * k * R * T17/(k - 1) * (1 - pinatmo^((k - 1)/k)));
    T19 = Tt17 - V19^2 * ((k - 1)/(2 * k * R));
    M19 = V19 / sqrt(k * R * T19);
    pt19 = p19* ((1 + (k - 1)/2 * M19^2)^(k/(k - 1)));
end

%zapisujemy wartoœci
wy(1) = 9;
wy(2) = we(2);
wy(3) = k;
wy(4) = R;
wy(5) = pt19;
wy(6) = Tt19;
wy(7) = p19;
wy(8) = T19;
wy(9) = M19;
wy(10) = V19;

end