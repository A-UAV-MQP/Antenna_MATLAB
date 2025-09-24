%% Define Element
load("OP_Parameters.mat")
ANT_Bicone_Rev_1 = design(bicone,F_Resonant)
save('Elements/Bicone_Rev_1.mat', "ANT_Bicone_Rev_1", "F_Band_Start", "F_Band_End", "F_Resonant")
% ANT_Bicone_Rev_1_Dimensions = coneangle2size();
% ANT_Bicone_Rev_1.ConeHeight = ANT_Bicone_Rev_1_Dimensions.ConeHeight;
% ANT_Bicone_Rev_1.BroadRadius = ANT_Bicone_Rev_1_Dimensions.BroadRadius;
% ANT_Bicone_Rev_1.NarrowRadius = ANT_Bicone_Rev_1_Dimensions.NarrowRadius;

%%

show(ANT_Bicone_Rev_1);
pattern(ANT_Bicone_Rev_1, F_Resonant);