%% Setup
clear; clc; close all;
load("OP_Parameters.mat")
load('Elements/Reflector-Dipole_Rev_1.mat', "ANT_Reflector_Dipole_Rev_1")
load('Elements/Reflector-Bowtie_Rev_1.mat', "ANT_Reflector_Bowtie_Rev_1")
%load('Fractle_Rev_1.mat', "ANT_Fractle_Rev_1", "F_Band_Start", "F_Band_End", "F_Resonant")
%% Generate Arrays
Element_Name = ["Reflector-Dipole_V1", "Reflector-Bowtie_V1"];
Element_Type = {ANT_Reflector_Dipole_Rev_1, ANT_Reflector_Bowtie_Rev_1};
Element_Counts = [6,8];
disp("Generating Arrays...")

 for(element_type = 1:size(Element_Type,2))
     for(element_counts = 1:size(Element_Counts,2))
        
         if(exist(sprintf('Arrays/UCA_Type-%s_Elements-%i.mat', Element_Name(element_type), Element_Counts(element_counts))) ~= 2)
            CA_Elements = cell(Element_Counts(element_counts),1);
            for(elements = 1:Element_Counts(element_counts))
                CA_Elements{elements} = copy(Element_Type{element_type});
                CA_Elements{elements}.Tilt = [90 ((360/Element_Counts(element_counts))*elements+90)];
                CA_Elements{elements}.TiltAxis = [1 0 0; 0 0 1];
            end

            Incrementation_Theta = 360/Element_Counts(element_counts);
            CA_Theta = Incrementation_Theta:Incrementation_Theta:360;
            CA_Radius = max((Element_Type{element_type}.GroundPlaneLength)/(2*sind(Incrementation_Theta/2)),0);

            CA_Element_Position_X(:,1) = CA_Radius.*cosd(CA_Theta);
            CA_Element_Position_Y(:,1) = CA_Radius.*sind(CA_Theta);
            CA_Element_Position_Z(:,1) = zeros(1,Element_Counts(element_counts));
            CA_Element_Positions = [CA_Element_Position_X CA_Element_Position_Y CA_Element_Position_Z];
            
            CA_Rev_1 = conformalArray(Reference="origin", Element = CA_Elements, ElementPosition = CA_Element_Positions);


            save(sprintf('Arrays/CA_Type-%s_Elements-%i.mat', Element_Name(element_type), Element_Counts(element_counts)), 'CA_Rev_1')
            fprintf("Generated a %i Element Circular Conformal Array with %0.4fm Radius made of %s Antennas.\r\n", Element_Counts(element_counts), CA_Radius, Element_Name(element_type))
        else
            disp('Array already computed.')
        end
            clearvars Incrementation_Theta CA_Theta CA_Element_Position_X CA_Element_Position_Y CA_Element_Position_Z CA_Element_Positions
    end
end
clearvars -except Element_Name Element_Counts

disp("Plotting Patterns...")
%% Plot Patterns
load("OP_Parameters.mat")
for(element_name = 1:size(Element_Name,2))
    for(element_counts = 1:size(Element_Counts,2))
        load(sprintf('Arrays/CA_Type-%s_Elements-%i.mat', Element_Name(element_name), Element_Counts(element_counts)))
        figure(str2double(sprintf('%i%i', element_name, element_counts)));
        show(CA_Rev_1);
        pattern(CA_Rev_1, F_Resonant);
        CA_Name = sprintf('CA_Type-%s_Elements-%i_Pattern-%iMHz', Element_Name(element_name), Element_Counts(element_counts), F_Resonant*10e-7);
        savefig(gcf, sprintf('Patterns/%s.fig', CA_Name))
        %close(gcf)
        fprintf("Generated Pattern for %s\r\n", CA_Name)
    end
end

