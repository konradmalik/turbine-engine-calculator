function [ wy, bleed_2, bleed_3 ] = section_3i1( we, vc, cool1, cool2 )
%Funkcja bÍdzie liczyÊ parametry w przekroju za sprÍøarkπ wysokiego
%ciúnienia po upuúcie powietrza do samolotu i ch≥odzenia pierwszego stopnia
%statora turbiny (1) i rotora (2).

%sprawdzenie poprawnoúci danych
if vc >= 1 || cool1 >= 1 || cool2 >= 1
    error('èle wprowadzony upust!')
end

%wczytujemy dane
mdot = we(2);

%obliczenia
bleed_1 = mdot * vc;
bleed_2 = mdot * cool1;
bleed_3 = mdot * cool2;
mdot3i1 = mdot - bleed_1 - bleed_2 - bleed_3;

%zapisywanie
wy(1) = 3.1;
wy(2) = mdot3i1;
wy(3) = we(3);
wy(4) = we(4);
wy(5) = we(5);
wy(6) = we(6);
wy(7) = we(7);
wy(8) = we(8);
wy(9) = we(9);
wy(10) = we(10);

end