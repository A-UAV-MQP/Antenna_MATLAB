%% Define Element
load("OP_Parameters.mat")
ANT_FatDipole_Rev_1 = design(dipole,F_Resonant)
save('Elements/FatDipole_Rev_1.mat', "ANT_FatDipole_Rev_1", "F_Band_Start", "F_Band_End", "F_Resonant")


%%

show(ANT_FatDipole_Rev_1);
pattern(ANT_FatDipole_Rev_1, F_Resonant);

