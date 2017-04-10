function [ out, lLPT ] = section_5( in, p, M, lLPC, lf, BR, f, vc )
%this function calculates the parameters in the section after the LPT.
%It takes specific work of LPC, Fan and other
%parameters which I am to lazy to enumerate.
%For default mach number enter -1.

%checking mach number
if M == -1
    M = 0.6;
elseif M <= 0
    error('Wrong mach number!!!')
end

%reading inputs
etat = p(6);
etam = p(12);

k = in(3);
R = in(4);
pt = in(5);
Tt = in(6);

%calculations
lLPT = (lLPC + BR * lf)/((1 + f) * (1 - vc) * etam);
Tt5 = Tt - (lLPT * (k - 1)/ (k * R * etat));

pit = (1 - lLPT * (k - 1)/(R * Tt * k * etat))^(k/(k - 1));

pt5 = pt * pit;


p5 = pt5/ ((1 + (k - 1)/2 * M^2)^(k/(k - 1)));
T5 = Tt5/ ((1 + (k - 1)/2 * M^2));

V = M * sqrt(k * R * T5);

%saving results
out(1) = 5;
out(2) = in(2);
out(3) = k;
out(4) = R;
out(5) = pt5;
out(6) = Tt5;
out(7) = p5;
out(8) = T5;
out(9) = M;
out(10) = V;

end