function [ kjint, kjext, kj, Tr, bj, etat, etap, eta ] = engine_parameters_bypass_turbofan_noAB( p9, p19, p0, T9, T19, V9, V19, V0, R9, R19, BR, f, mdot0, Wu )
%

rho9 = p9 /(R9 * T9);
rho19 = p19 /(R19 * T19);
kjext = V19 - V0 + (p19 - p0)/(rho19 * V19);
kjint = V9 - V0 + (p9 - p0)/(rho9 * V9);
kj = (kjint + kjext * BR)/(1 + BR);
Tr = mdot0 * kj;
bj = f/(kjint + kjext * BR);

Vred = kj + V0;
etat = (1 + BR) * (Vred^2 - V0^2)/ (2 * Wu * f);
etap = 2 / (1 + Vred/V0);
eta = etap * etat;

end