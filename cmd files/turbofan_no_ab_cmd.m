clearvars
clear
clear all

Wu = 42e6;

%interactive script
level = input('Enter the technological level of the engine: ');
if level == 1
    para = input('Enter "1" for default mechanization levels of the inlet and nozzle or "2" if you want to specify them: ');
    if para == 1
        parameters = engine_level_1(3, 3);
    elseif para == 2
        inlet = input('Enter the mechanization level of the inlet (1,2 or 3. Higher -> more advanced): ');
        nozzle = input('Enter the mechanization level of the nozzle (1,2 or 3. Higher -> more advanced): ');
        parameters = engine_level_1(inlet, nozzle);
    else
        error('You must type "1" or "2"');
    end
elseif level == 2
    para = input('Enter "1" for default mechanization levels of the inlet, turbine and nozzle or "2" if you want to specify them: ');
    if para == 1
        parameters = engine_level_2(3, 2, 3);
    elseif para == 2
        inlet = input('Enter the mechanization level of the inlet (1,2 or 3. Higher -> more advanced): ');
        turbine = input('Enter the mechanization level of the turbine (1 - uncooled, 2 - cooled): ');
        nozzle = input('Enter the mechanization level of the nozzle (1,2 or 3. Higher -> more advanced): ');
        parameters = engine_level_2(inlet, turbine, nozzle);
    else
        error('You must type "1" or "2"');
    end
elseif level == 3
    para = input('Enter "1" for default mechanization levels of the inlet, turbine and nozzle or "2" if you want to specify them: ');
    if para == 1
        parameters = engine_level_3(3, 2, 3);
    elseif para == 2
        inlet = input('Enter the mechanization level of the inlet (1,2 or 3. Higher -> more advanced): ');
        turbine = input('Enter the mechanization level of the turbine (1 - uncooled, 2 - cooled): ');
        nozzle = input('Enter the mechanization level of the nozzle (1,2 or 3. Higher -> more advanced): ');
        parameters = engine_level_3(inlet, turbine, nozzle);
    else
        error('You must type "1" or "2"');
    end
elseif level == 4
    para = input('Enter "1" for default mechanization levels of the inlet, turbine and nozzle or "2" if you want to specify them: ');
    if para == 1
        parameters = engine_level_4(3, 2, 3);
    elseif para == 2
        inlet = input('Enter the mechanization level of the inlet (1,2 or 3. Higher -> more advanced): ');
        turbine = input('Enter the mechanization level of the turbine (1 - uncooled, 2 - cooled): ');
        nozzle = input('Enter the mechanization level of the nozzle (1,2 or 3. Higher -> more advanced): ');
        parameters = engine_level_4(inlet, turbine, nozzle);
    else
        error('You must type "1" or "2"');
    end
else
    error('You must enter 1, 2, 3 or 4.');
end
height = input('Enter the height of flight [m]: ');
M0 = input('Enter the mach number of flight: ');
mdot0 = input('Enter the air mass flow [kg/s]: ');
default = input('Enter "1" for default mach numbers through the engine or "2" if you want to specify them: ');
if default == 1
    M1 = -1;
    M2 = -1;
    M3i2 = -1;
    M5 = -1;
elseif default == 2
    M1 = input('Enter the mach number in section 1: ');
    M2 = input('Enter the mach number in section 2: ');
    M3i2 = input('Enter the mach number in section 3.2: ');
    M5 = input('Enter the mach number in section 5: ');
else
    error('You must type "1" or "2"');
end
BR = input('Enter the bypass ratio: ');
piF = input('Enter the compression of the fan: ');
piC = input('Enter the total compression of the compressor: ');
FtoLPC = input('Enter the fan to LPC compression ratio: ');
piLPC = piF / FtoLPC;
piHPC = piC /piLPC;
temperature = input('Enter "1" for a custom value of Tt4 or anything else for default based on the engine level: ');
if temperature == 1
    Tt4 = input('Enter the Tt4: ');
else
    Tt4 = parameters(10);
end
vc = input('Enter the fraction of total air flow for bleed air: ');
cool1 = input('Enter the fraction of total air flow for first cooling air: ');
cool2 = input('Enter the fraction of total air flow for second cooling air: ');


%allocationg matrix memory
out_int = zeros(13,10);
out_ext = zeros(5,10);
out_int_plot = zeros(11,10);

%{
M0 = 0.67;
mdot0 = 406.81;
M1 = 0.67;
M2 = -1;
piF = 2.15;
FtoLPC = 1;
piLPC = piF / FtoLPC;
piC = 29;
piHPC = piC /piLPC;
BR = 5;
vc = 0.01;
cool1 = 0.05;
cool2 = 0.05;
M3i2 = -1;
Wu = 42e6;
Tt4 = 1760;
M5 = -1;
%}

%atmosphere parameters dependent on height
[T0, a0, p0] = atmoscoesa(height);

%section 0
[out_int(1,:)] = section_0(T0, a0, p0, M0, mdot0);
out_int_plot(1,:) = out_int(1,:);
[out_ext(1,:)] = out_int(1,:);

%section 1
out_int(2,:) = section_1(out_int(1,:), M1);
out_int_plot(2,:) = out_int(2,:);
[out_ext(2,:)] = out_int(2,:);

%section 2
out_int(3,:) = section_2(out_int(2,:), parameters, M0, M2);
out_int_plot(3,:) = out_int(3,:);
[out_ext(3,:)] = out_int(3,:);

%section 13
[out_ext(4,:), lf] = section_13(out_ext(3,:), parameters, piF, BR);

%section 19
[out_ext(5,:), nozzle_ext] = section_19(out_ext(4,:), parameters, p0);

%section 2.5
[out_int(4,:), lLPC] = section_2i5(out_int(3,:), parameters, BR, piLPC);
out_int_plot(4,:) = out_int(4,:);

%section 3
[out_int(5,:), lHPC] = section_3(out_int(4,:), parameters, piHPC);
out_int_plot(5,:) = out_int(5,:);

%section 3.1
[out_int(6,:), bleed_2, bleed_3] = section_3i1(out_int(5,:), vc, cool1, cool2);
out_int_plot(6,:) = out_int(6,:);

%section 3.2
[out_int(7,:)] = section_3i2(out_int(6,:), parameters, M3i2);
out_int_plot(7,:) = out_int(7,:);

%section 4
[out_int(8,:), mdot_f, f, alpha] = section_4(out_int(7,:), parameters, Wu, Tt4);
out_int_plot(8,:) = out_int(8,:);

%section 4.1
[out_int(9,:)] = section_4i1(out_int(8,:), out_int(6,6), bleed_2);

%section 4.4
[ out_int(10,:), lHPT ] = section_4i4( out_int(9,:), out_int(6,5), parameters, lHPC, f, vc, cool2 );

%section 4.5
[ out_int(11,:) ] = section_4i5( out_int(10,:), out_int(6,6), bleed_3 );
out_int_plot(9,:) = out_int(11,:);

%section 5
[ out_int(12,:), lLPT ] = section_5( out_int(11,:), parameters, M5, lLPC, lf, BR, f, vc );
out_int_plot(10,:) = out_int(12,:);

%section 9
[out_int(13,:), nozzle_int] = section_9(out_int(12,:), parameters, p0);
out_int_plot(11,:) = out_int(13,:);

%section numbers to floats
out_int(:,1) = single(out_int(:,1));
out_ext(:,1) = single(out_ext(:,1));
out_int_plot(:,1) = single(out_int_plot(:,1));

%calculating final parameters
k = out_int(1,3);
R = out_int(1,4);
V0 = M0 * sqrt(k * R * T0);
[ kjint, kjext, kj, Tr, bj, etat, etap, eta ] = engine_parameters_bypass_turbofan_noAB( out_int(13,7), out_ext(5,7), p0,out_int(13,8), out_ext(5,8), out_int(13,10), out_ext(5,10), V0, out_int(13,4), out_ext(5,4), BR, f, mdot0, Wu );