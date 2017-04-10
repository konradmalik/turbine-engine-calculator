function [ out ] = section_6( in_int, in_ext, p, BR )
%this function calculates the parameters at the section where mixing occurs

%reading inputs
piAB = p(7);

mdot_int = in_int(2);
k_int = in_int(3);
R_int = in_int(4);
pt_int = in_int(5);
Tt_int = in_int(6);
V_int = in_int(10);

mdot_ext = in_ext(2);
k_ext = in_ext(3);
R_ext = in_ext(4);
pt_ext = in_ext(5);
Tt_ext = in_ext(6);
V_ext = in_ext(10);

%calculations
mdot = mdot_int + mdot_ext;

pt6 = piAB * (pt_int + pt_ext)/2;
k = (k_int + BR * k_ext)/(1 + BR);
R = (R_int + BR * R_ext)/(1 + BR);
cp = k * R /(k - 1);
cp_int = k_int * R_int /(k_int - 1);
cp_ext = k_ext * R_ext /(k_ext - 1);

Tt6 = (Tt_int * cp_int + BR * Tt_ext * cp_ext)/(cp * (1 + BR));

V = (V_int + BR * V_ext)/(1 + BR);

T6 = Tt6 - V^2*(k - 1)/(2*k*R);
M = sqrt(k * R * T6);
p6 = pt6/ (1 + (k - 1)/2 * M^2)^(k/(k - 1));

%saving results
out(1) = 6;
out(2) = mdot;
out(3) = k;
out(4) = R;
out(5) = pt6;
out(6) = Tt6;
out(7) = p6;
out(8) = T6;
out(9) = M;
out(10) = V;

end