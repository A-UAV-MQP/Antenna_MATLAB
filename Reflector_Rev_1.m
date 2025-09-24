%% Define Element
load("OP_Parameters.mat")
% load('Elements/Bicone_Rev_1.mat', "ANT_Bicone_Rev_1")
% load('Elements/Discone_Rev_1.mat', "ANT_Discone_Rev_1")
load('Elements/FatDipole_Rev_1.mat', "ANT_FatDipole_Rev_1")
load('Elements/Bowtie_Rev_1.mat', "ANT_Bowtie_Rev_1")

lambda = (physconst('LightSpeed')/F_Resonant);


% ANT_Reflector_Bicone_Rev_1 = design(reflectorCylindrical,F_Resonant);
% ANT_Reflector_Bicone_Rev_1.Tilt = 90;
% ANT_Reflector_Bicone_Rev_1.TiltAxis = [1 0 0];
% 
% ANT_Bicone_Rev_1.Tilt = 90;
% ANT_Bicone_Rev_1.TiltAxis = [1 0 0];
% ANT_Reflector_Bicone_Rev_1.Exciter = ANT_Bicone_Rev_1;
% ANT_Reflector_Bicone_Rev_1.Spacing = 0.25*lambda;
% figure(1)
% show(ANT_Reflector_Bicone_Rev_1)
% % pattern(ANT_Reflector_Bicone_Rev_1, F_Resonant)
% save('Elements/Reflector-Bicone_Rev_1.mat', "ANT_Reflector_Bicone_Rev_1", "F_Band_Start", "F_Band_End", "F_Resonant")


% ANT_Reflector_Discone_Rev_1 = design(reflectorCylindrical,F_Resonant);
% ANT_Reflector_Discone_Rev_1.Tilt = 90;
% ANT_Reflector_Discone_Rev_1.TiltAxis = [1 0 0];
% ANT_Reflector_Discone_Rev_1.Exciter = ANT_Discone_Rev_1;
% ANT_Reflector_Discone_Rev_1.Spacing = 0.25*lambda;
% 
% figure(2)
% show(ANT_Reflector_Discone_Rev_1)
% pattern(ANT_Reflector_Discone_Rev_1, F_Resonant)
% save('Elements/Reflector-Discone_Rev_1.mat', "ANT_Reflector_Discone_Rev_1", "F_Band_Start", "F_Band_End", "F_Resonant")


ANT_Reflector_Dipole_Rev_1 = design(reflectorCylindrical,F_Resonant);
ANT_Reflector_Dipole_Rev_1.Tilt = 90;
ANT_Reflector_Dipole_Rev_1.TiltAxis = [1 0 0];

ANT_FatDipole_Rev_1.Tilt = 90;
ANT_FatDipole_Rev_1.TiltAxis = [1 0 0];
ANT_Reflector_Dipole_Rev_1.Exciter = ANT_FatDipole_Rev_1;
ANT_Reflector_Dipole_Rev_1.Spacing = 0.25*lambda;
figure(3)
show(ANT_Reflector_Dipole_Rev_1)
figure(4)
pattern(ANT_Reflector_Dipole_Rev_1, F_Resonant)
save('Elements/Reflector-Dipole_Rev_1.mat', "ANT_Reflector_Dipole_Rev_1", "F_Band_Start", "F_Band_End", "F_Resonant")


ANT_Reflector_Bowtie_Rev_1 = design(reflectorCylindrical,F_Resonant);
ANT_Reflector_Bowtie_Rev_1.Tilt = 90;
ANT_Reflector_Bowtie_Rev_1.TiltAxis = [1 0 0];

ANT_Bowtie_Rev_1.Tilt = [90 90];
ANT_Bowtie_Rev_1.TiltAxis = [1 0 0; 0 1 0];
ANT_Reflector_Bowtie_Rev_1.Exciter = ANT_Bowtie_Rev_1;
ANT_Reflector_Bowtie_Rev_1.Spacing = 0.25*lambda;
figure(4)
show(ANT_Reflector_Bowtie_Rev_1)
figure(5)
pattern(ANT_Reflector_Bowtie_Rev_1, F_Resonant)
save('Elements/Reflector-Bowtie_Rev_1.mat', "ANT_Reflector_Bowtie_Rev_1", "F_Band_Start", "F_Band_End", "F_Resonant")



