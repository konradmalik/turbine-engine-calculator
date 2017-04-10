function [ out ] = section_4i1( in, Tt_bleed, bleed_2 )
%this function evaluates parameters in section after the nozzle vanes
%and coolant mixer. its arguments are, in addition to the standard ones, mass
%flow of the #1 cooling air which bleeds from the section number 3.1 and Tt
%it returns only Tt, k and mdot because the other parameters are unknown
%due to being in between rotors and stators from the turbine.
%All parameters are returned in out_all for further calculation
%R and R1 are both used here!

%required individual gas constant and isentropic constant
%for air and fuel (1) and for air only
R = 286.9;
k = 1.4;

%reading input data
mdot_main = in(2);
k1 = in(3);
R1 = in(4);
Tt_main = in(6);


%calculations
mdot = mdot_main + bleed_2;

k2 = (k * bleed_2 + k1 * mdot_main)/mdot;
R2 = (R * bleed_2 + R1 * mdot_main)/mdot;

cp = k * R /(k - 1);
cp1 = k1 * R1 /(k1 - 1);
cp2 = k2 * R2 /(k2 - 1);

Tt2 = (bleed_2 * cp * Tt_bleed + mdot_main * cp1 * Tt_main)/(mdot * cp2);

%saving data
out(1) = 4.1;
out(2) = mdot;
out(3) = k2;
out(4) = R2;
out(5) = NaN;
out(6) = Tt2;
out(7) = NaN;
out(8) = NaN;
out(9) = NaN;
out(10) = NaN;

%out_all(1) = mdot;
%out_all(2) = k2;
%out_all(3) = in(3);
%out_all(4) = Tt2;
%out_all(5) = in(5);
%out_all(6) = in(6);
%out_all(7) = in(7);
%out_all(8) = in(8);
%out_all(9) = R2;

end