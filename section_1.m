function [ wy ] = section_1( we, M )
%Funkcja bêdzie liczyæ parametry spiêtrzenia w przekroju wlotowym silnika
%na postawie odpowiednio: temperatury, ciœnienia i liczby macha lotu i 
%wyrzuca tablicê wartoœci. Liczbê macha trzeba zdefiniowaæ lub wpisaæ -1
%aby wczytana zosta³a wartoœæ domyœlna 0.8.

%sprawdzenie poprawnoœci danych
if M == -1
    M = 0.8;
elseif M <= 0
    error('le wprowadzona wartoœæ liczby Macha!')
end

%zamiana tablicy wejœciowej na ³atwe do odczytu dane
k = we(3);
R = we(4);
pt = we(5);
Tt = we(6);

%oczywiste obliczenia
p = pt / (1 + (k-1)/2 * M^2)^(k/(k-1));
T = Tt / (1 + (k-1)/2 * M^2);

V = M * sqrt(k * R * T);

%przypisujemy wartoœci do elementów zbioru dla czytelnoœci
wy(1) = 1;
wy(2) = we(2);
wy(3) = k;
wy(4) = R;
wy(5) = pt;
wy(6) = Tt;
wy(7) = p;
wy(8) = T;
wy(9) = M;
wy(10) = V;

end

