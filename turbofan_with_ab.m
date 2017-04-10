function [ parameters, nozzle_int, out_int, out_ext, out_int_plot, mdot_f, mdot_fAB, alpha, alpha_AB, lf, lHPT, lHPC, lLPT, lLPC, f, kj, Tr, bj, etat, etap, eta ] = turbofan_with_ab(level, Wu, inlet, turbine, nozzle, height, M0, mdot0, M1, M2, M3i2, M5, M7, BR, piF, piC, FtoLPC, temperature, temperature7, vc, cool1, cool2 )

%engine levels
if level == 1
    param = engine_level_1(inlet, turbine, nozzle);

elseif level == 2
    param = engine_level_2(inlet, turbine, nozzle);
        
elseif level == 3
    param = engine_level_3(inlet, turbine, nozzle);
   
elseif level == 4
    param = engine_level_4(inlet, turbine, nozzle);
    
end

%compression values
piLPC = piF / FtoLPC;
piHPC = piC /piLPC;

if temperature == -1
    Tt4 = param(10);
else
    Tt4 = temperature;
end

if temperature7 == -1
    Tt7 = param(11);
else
    Tt7 = temperature7;
end

%allocationg matrix memory
out_int = zeros(15,10);
out_ext = zeros(4,10);
out_int_plot = zeros(11,10);

%atmosphere parameters dependent on height
[T0, a0, p0] = atmoscoesa(height);

%saving parameters
parameters  = param;

%section 0
[out_int(1,:)] = section_0(T0, a0, p0, M0, mdot0);
out_int_plot(1,:) = out_int(1,:);
[out_ext(1,:)] = out_int(1,:);

%section 1
out_int(2,:) = section_1(out_int(1,:), M1);
out_int_plot(2,:) = out_int(2,:);
[out_ext(2,:)] = out_int(2,:);

%section 2
out_int(3,:) = section_2(out_int(2,:), param, M0, M2);
out_int_plot(3,:) = out_int(3,:);
[out_ext(3,:)] = out_int(3,:);

%section 13
[out_ext(4,:), lf] = section_13(out_ext(3,:), param, piF, BR);

%section 2.5
[out_int(4,:), lLPC] = section_2i5(out_int(3,:), param, BR, piLPC);
out_int_plot(4,:) = out_int(4,:);

%section 3
[out_int(5,:), lHPC] = section_3(out_int(4,:), param, piHPC);
out_int_plot(5,:) = out_int(5,:);

%section 3.1
[out_int(6,:), bleed_2, bleed_3] = section_3i1(out_int(5,:), vc, cool1, cool2);
out_int_plot(6,:) = out_int(6,:);

%section 3.2
[out_int(7,:)] = section_3i2(out_int(6,:), param, M3i2);
out_int_plot(7,:) = out_int(7,:);

%section 4
[out_int(8,:), mdot_f, f, alpha] = section_4(out_int(7,:), param, Wu, Tt4);
out_int_plot(8,:) = out_int(8,:);

%section 4.1
[out_int(9,:)] = section_4i1(out_int(8,:), out_int(6,6), bleed_2);

%section 4.4
[ out_int(10,:), lHPT ] = section_4i4( out_int(9,:), out_int(6,5), param, lHPC, f, vc, cool2 );

%section 4.5
[ out_int(11,:) ] = section_4i5( out_int(10,:), out_int(6,6), bleed_3 );
out_int_plot(9,:) = out_int(11,:);

%section 5
[ out_int(12,:), lLPT ] = section_5( out_int(11,:), param, M5, lLPC, lf, BR, f, vc );
out_int_plot(10,:) = out_int(12,:);

%section 6
[ out_int(13,:) ] = section_6( out_int(12,:), out_ext(4,:), param, BR );
out_int_plot(11,:) = out_int(13,:);


%section 7
[ out_int(14,:), mdot_fAB, fAB, alpha_AB ] = section_7( out_int(13,:), param, Wu, Tt7, M7 );
out_int_plot(12,:) = out_int(14,:);


%section 9
[out_int(15,:), nozzle_int] = section_9(out_int(14,:), param, p0);
out_int_plot(13,:) = out_int(15,:);


%section numbers to floats
out_int(:,1) = single(out_int(:,1));
out_ext(:,1) = single(out_ext(:,1));
out_int_plot(:,1) = single(out_int_plot(:,1));

%calculating final parameters
k = out_int(1,3);
R = out_int(1,4);
V0 = M0 * sqrt(k * R * T0);
[ kj, Tr, bj, etat, etap, eta ] = engine_parameters_bypass_turbofan_AB( out_int(15,7), p0,out_int(15,8), out_int(15,10), V0, out_int(15,4), BR, f, fAB, mdot0, Wu );