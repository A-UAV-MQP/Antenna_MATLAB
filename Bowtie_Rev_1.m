%% Define Element
load("OP_Parameters.mat")
ANT_Bowtie_Rev_1 = design(bowtieTriangular,F_Resonant)
ANT_Bowtie_Rev_1.Tilt = 90;
ANT_Bowtie_Rev_1.TiltAxis = [0 0 1];
save('Elements/Bowtie_Rev_1.mat', "ANT_Bowtie_Rev_1", "F_Band_Start", "F_Band_End", "F_Resonant")


%%

show(ANT_Bowtie_Rev_1);
pattern(ANT_Bowtie_Rev_1, F_Resonant);