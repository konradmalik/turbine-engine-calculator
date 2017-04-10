function [ out ] = section_4i5( in, Tt_bleed, bleed_3 )
%this function calculates the parameters in the section after the second
%coolant mixer, right before LPT.
%it must take as an argument bleed_3 which is the last bleeding air from
%section 3.1

%required individual gas constant and isentropic constant
%for air and fuel (1) and for air only
R = 286.9;
k = 1.4;

%reading inputs
mdot_main = in(2);
k1 = in(3);
R1 = in(4);
pt = in(5);
Tt = in(6);

%calculations
mdot = mdot_main + bleed_3;

k2 = (k * bleed_3 + k1 * mdot_main)/mdot;
R2 = (R * bleed_3 + R1 * mdot_main)/mdot;

cp = k * R /(k - 1);
cp1 = k1 * R1 /(k1 - 1);
cp2 = k2 * R2 /(k2 - 1);

Tt4i5 = (bleed_3 * cp * Tt_bleed + mdot_main * cp1 * Tt)/(mdot * cp2);

M = 1;

p4i5 = pt/ (1 + (k2 - 1)/2 * M^2)^(k2/(k2 - 1));
T4i5 = Tt4i5/ (1 + (k2 - 1)/2 * M^2);

V = M * sqrt(k2 * R2 * T4i5);

%saving data
out(1) = 4.5;
out(2) = mdot;
out(3) = k2;
out(4) = R2;
out(5) = pt;
out(6) = Tt4i5;
out(7) = p4i5;
out(8) = T4i5;
out(9) = M;
out(10) = V;

end