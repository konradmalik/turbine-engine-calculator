function [ wy ] = section_0( T, a, p, M, mdot )
%Funkcja bêdzie liczyæ parametry w przekroju w pewnej odleg³oœci za
%silnikiem. Dane wejœciowe z funkcji atmoscoesa i warunków pocz¹kowych.
%tutaj definiowana jest liczba R.

%sprawdzenie poprawnoœci danych
if M <= 0
    error('le wprowadzona wartoœæ liczby Macha!')
end
    
if mdot < 0
    error('Wydatek masowy powietrza musi byæ dodatni!')    
end

% indywidualna sta³a powietrza
R = 286.9;

%oczywiste obliczenia
k = 1.4;

pt = p * (1 + (k-1)/2 * M^2)^(k/(k-1));
Tt = T * (1 + (k-1)/2 * M^2);

V = M * a;

%przypisujemy wartoœci do elementów zbioru dla czytelnoœci
wy(1) = 0;
wy(2) = mdot;
wy(3) = k;
wy(4) = R;
wy(5) = pt;
wy(6) = Tt;
wy(7) = p;
wy(8) = T;
wy(9) = M;
wy(10) = V;


end

