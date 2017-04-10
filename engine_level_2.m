function [ p ] = engine_level_2( Dtype, Ttype, Ntype )
%Funkcja stworzy zbiór sprawnoœci, sprê¿ów i maks. temperatur dla charakterystycznych
%elementów silnika poziomu "2" na podstawie wpisanego typu wlotu, turbiny i wylotu
%(szczegó³y na str. 107 w Mattingly - Aircraft Engine Design Second
%Edition.

%Wlot (pi)
switch Dtype
    case 1
        p(1) = 0.95; %samolot poddŸwiêkowy z silnikami w gondolach
    case 2
        p(1) = 0.93; %samolot poddŸwiêkowy z silnikiem w kad³ubie
    case 3
        p(1) = 0.9; %samolot naddŸwiêkowy z silnikiem w kad³ubie
    otherwise
        error('Poda³eœ z³y typ wlotu!')
end

p(2) = 0.84; %Sprê¿arka (eta)
p(3) = 0.82; %Wentylator (eta)
p(4) = 0.92; %Komora spalania (pi)
p(5) = 0.94; %Komora spalania (eta)

%Turbina (eta)
switch Ttype
    case 1
        p(6) = 0.85; %Turbina niech³odzona
    case 2
        p(6) = 0.83; %Turbina ch³odzona
    otherwise
        error('Poda³eœ z³y typ turbiny!')
end

p(7) = 0.92; %Dopalacz (pi)
p(8) = 0.91; %Dopalacz (eta)

%Dysza (pi)
switch Ntype
    case 1
        p(9) = 0.97; %dysza zbie¿na o sta³ym przekroju
    case 2
        p(9) = 0.96; %dysza zbie¿na o zmiennym przekroju
    case 3
        p(9) = 0.93; %dysza zbie¿no-rozbie¿na o zmiennym przkeroju
    otherwise
         error('Poda³eœ z³y typ wylotu!')
end

p(10) = 1390; %Tt4 (K)
p(11) = 1670; %Tt7 (K)
p(12) = 0.99; %Sprawnoœæ mechaniczna sprê¿arka - turbina

end