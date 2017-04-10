function [ kj, Tr, bj, etat, etap, eta ] = engine_parameters_bypass_turbofan_AB( p9, p0, T9, V9, V0, R9, BR, f, fAB, mdot0, Wu )
%

f = f/(1 + BR) + fAB;

rho9 = p9 /(R9 * T9);
kj = (1+f)*V9 - V0 + (1+f)*(p9 - p0)/(rho9 * V9);
Tr = mdot0 * kj;
bj = f/kj;

Vred = kj + V0;
etat = (Vred^2 - V0^2)/ (2 * Wu * f);
etap = 2 / (1 + Vred/V0);
eta = etap * etat;

end