function [ out, lHPT ] = section_4i4( in, pt3i1, p, lHPC, f, vc, cool2 )
%this function calculates the parameters in the section after the HPT.
%It takes specific work of HPC and other
%parameters which I am to lazy to enumerate.

%reading inputs
etat = p(6);
etam = p(12);

k = in(3);
R = in(4);
pt = pt3i1;
Tt = in(6);


%calculations
lHPT = lHPC/((1 + f) * (1 - vc - cool2) * etam);
Tt4i4 = Tt - lHPT/ (k * R /(k - 1) * etat);

pit = (1 - lHPT * (k - 1)/(R * Tt * k * etat))^(k/(k - 1));
pt4i4 = pt * pit;

%saving results
out(1) = 4.4;
out(2) = in(2);
out(3) = k;
out(4) = R;
out(5) = pt4i4;
out(6) = Tt4i4;
out(7) = NaN;
out(8) = NaN;
out(9) = NaN;
out(10) = NaN;

end