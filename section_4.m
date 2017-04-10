function [ out, mdot_f, f, alpha ] = section_4( in, p, Wu, Tt4 )
%this function evaluates parameters in section after the burner
%its arguments are, in addition to the standard ones, lower heating value (Wu),
%and it returns fuel mass flow, f = F/A and alpha = 1/(Lt*f)
%in this function the fumes individual gas constant is defined.

%required individual gas constant for air and fuel, isentropic constant and
%theoretical ratio of air to fuel
R1 = 280;
k1 = 1.3;
Lt = 14.9;

%checking if inputs are legitimate
if Wu <= 0
    error('Wrong lower heating value!')
end

%choosing Tt4
if Tt4 == -1
    Tt4 = p(10);
elseif Tt4 <= 0
   error('Wrong Tt4!!')
end

%reading input data
pib = p(4);
etab = p(5);

mdot = in(2);
pt = in(5);
Tt = in(6);

%calculating specific heat for combustion process
cum = (0.9089 + 2.095e-4 * (Tt4 + 0.48 * Tt))*1000;

%calculations
M = 1;

pt4 = pib * pt;
p4 = pt4/ (1 + (k1 - 1)/2 * M^2)^(k1/(k1 - 1));
T4 = Tt4/ (1 + (k1 - 1)/2 * M^2);

f = cum * (Tt4 - Tt)/(etab * Wu);

alpha = 1/(Lt * f);

mdot_f = mdot * f;
mdot = mdot + mdot_f;

V = M * sqrt(k1 * R1 * T4);

%saving values
out(1) = 4;
out(2) = mdot;
out(3) = k1;
out(4) = R1;
out(5) = pt4;
out(6) = Tt4;
out(7) = p4;
out(8) = T4;
out(9) = M;
out(10) = V;


end