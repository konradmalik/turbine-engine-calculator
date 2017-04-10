function [ out, mdot_fAB, fAB, alpha_AB ] = section_7( in, p, Wu, Tt7, M7 )
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

%choosing Tt7
if Tt7 == -1
    Tt7 = p(10);
elseif Tt7 <= 0
   error('Wrong Tt7!!')
end

%choosing M7
if M7 == -1
    M7 = 0.5;
elseif M7 <= 0
   error('Wrong M7!!')
end

%reading input data
piAB = p(7);
etaAB = p(8);

mdot = in(2);
pt = in(5);
Tt = in(6);

%calculating specific heat for combustion process
cum = (0.9089 + 2.095e-4 * (Tt7 + 0.48 * Tt))*1000;

%calculations
pt7 = piAB * pt;
p7 = pt7/ (1 + (k1 - 1)/2 * M7^2)^(k1/(k1 - 1));
T7 = Tt7/ (1 + (k1 - 1)/2 * M7^2);

fAB = cum * (Tt7 - Tt)/(etaAB * Wu);

alpha_AB = 1/(Lt * fAB);

mdot_fAB = mdot * fAB;
mdot = mdot + mdot_fAB;

V = M7 * sqrt(k1 * R1 * T7);

%saving values
out(1) = 7;
out(2) = mdot;
out(3) = k1;
out(4) = R1;
out(5) = pt7;
out(6) = Tt7;
out(7) = p7;
out(8) = T7;
out(9) = M7;
out(10) = V;


end