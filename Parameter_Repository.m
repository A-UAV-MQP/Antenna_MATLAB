clc; clear; close all;
f_Start  = 120e6;
f_End = 4000e6;
F_Band_Start = 700e6;
F_Band_End = 1400e6;
F_Resonant = (F_Band_End+F_Band_Start)/2;
F_c = (f_End+f_Start)/2;
f = linspace(f_Start,f_End,10);

save("OP_Parameters.mat")