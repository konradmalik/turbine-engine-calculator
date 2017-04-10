function [ wy ] = section_3i2( we, p, M3i2 )
%Funkcja bêdzie liczyæ parametry w przekroju tu¿ przed komor¹ spalania
%po zwolnieniu przep³ywu do M3.2 i stratach zwi¹zanych z pi kom. spalania.
%Wartoœæ tej liczby macha wpisujemy w argumenty albo "-1" dla domyœlnej.

%strata ciœnienia statycznego w tym przekroju definiowana jest przeze mnie
%jako sprawnoœæ kom. spalania (raczej nieprawidlowo..)

%sprawdzenie poprawnoœci danych
if M3i2 == -1
    M3i2 = 0.08;
elseif M3i2 <= 0
    error('le wprowadzona liczba macha przed komor¹ spalania!')
end

%wczytujemy dane
etab = p(5);

k = we(3);
R = we(4);
pt = we(5);
Tt = we(6);


%obliczenia
pt3i2 = etab * pt;

p3i2 = pt3i2/ (1 + (k - 1)/2 * M3i2^2)^(k/(k - 1));
T3i2 = Tt/ (1 + (k - 1)/2 * M3i2^2);

V = M3i2 * sqrt(k * R * T3i2);

wy(1) = 3.2;
wy(2) = we(2);
wy(3) = k;
wy(4) = R;
wy(5) = pt3i2;
wy(6) = we(6);
wy(7) = p3i2;
wy(8) = T3i2;
wy(9) = M3i2;
wy(10) = V;

end
