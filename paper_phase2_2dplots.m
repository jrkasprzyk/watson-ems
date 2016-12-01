% Abigail Watson, 07/01/2015
% LRGV deep uncertainty exploration
% 2d plots

clc; clear all; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Begin User Defined Input %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set local directory that contains all 25 csv evaluation files (NOTE: If you change the file names from what they are originally, it is very important that they are ordered as Opt1_Eval1, Opt1_Eval2, Opt1_Eval3, Opt1_Eval4, Opt1_Eval5, Opt2_Eval1, Opt2, Eval2, etc.)

Dir = '/Users/abigailawatson/Google Drive/Research/Paper/Plots/';

% Select three variables of interest to plot

%%% Begin Variable Codes %%%
% 1=Cost ; 2=Rel ; 3=CritRel ; 4=Surplus ; 5=CostVar ; 6=Drop ; 7=NumLeases ;
% 12=Rights ; 13=xi ; 14=options_low ; 15=options_high ; 16=alpha2 ; 17=beta2
% 18=alpha ; 19=beta; 134=DrTransCost
%%% End Variable Codes %%%

var1 = 6; 
var2 = 12; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% End User Defined Input %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd(Dir)
fnames = dir('*.csv'); % create a struct array of csv files

% Read in the csv files into a cell array
for i=1:length(fnames) % cycle through all csv files
    fid = fopen(fnames(i).name,'rt'); % open csv file to read in text mode
    data{i}=cell2mat(textscan(fid, repmat('%f',1,199), 'headerlines', 1, 'delimiter', ',','EndOfLine', '\r\n')); % add each csv file data into a cell of an array called 'data'
    fclose(fid); % close csv file
end

% Column names taken from redirection output csv files
colNames = {'objcost' 'objrel' 'objcrel' 'objsurplus' 'objcostvar' 'objdrop' 'objnumleases' 'objresilience' 'failvol' 'objvulnerability' 'maxfailureperiods' 'rights' 'xi' 'options_low' 'options_high' 'alpha2' 'beta2' 'alpha' 'beta' 'ifri' 'rel1' 'rel2' 'rel3' 'rel4' 'rel5' 'rel6' 'rel7' 'rel8' 'rel9' 'rel10' 'relavg' 'crel1' 'crel2' 'crel3' 'crel4' 'crel5' 'crel6' 'crel7' 'crel8' 'crel9' 'crel10' 'crelavg' 'drop1' 'drop2' 'drop3' 'drop4' 'drop5' 'drop6' 'drop7' 'drop8' 'drop9' 'drop10' 'dropavg' 'totcost1' 'totcost2' 'totcost3' 'totcost4' 'totcost5' 'totcost6' 'totcost7' 'totcost8' 'totcost9' 'totcost10' 'totcostavg' 'leasecost1' 'leasecost2' 'leasecost3' 'leasecost4' 'leasecost5' 'leasecost6' 'leasecost7' 'leasecost8' 'leasecost9' 'leasecost10' 'leasecostavg' 'costpercentrights' 'costpercentoptions' 'costpercentleases' 'numhighopt1' 'numhighopt2' 'numhighopt3' 'numhighopt4' 'numhighopt5' 'numhighopt6' 'numhighopt7' 'numhighopt8' 'numhighopt9' 'numhighopt10' 'numhighoptavg' 'numNx1' 'numNx2' 'numNx3'	'numNx4' 'numNx5' 'numNx6' 'numNx7' 'numNx8' 'numNx9' 'numNx10' 'numNxavg' 'avgNx1' 'avgNx2' 'avgNx3' 'avgNx4' 'avgNx5' 'avgNx6' 'avgNx7' 'avgNx8' 'avgNx9' 'avgNx10' 'avgNxavg' 'avgNl1' 'avgNl2' 'avgNl3' 'avgNl4' 'avgNl5' 'avgNl6' 'avgNl7' 'avgNl8' 'avgNl9' 'avgNl10' 'avgNlavg' 'endwtr1' 'endwtr2' 'endwtr3' 'endwtr4' 'endwtr5' 'endwtr6' 'endwtr7' 'endwtr8' 'endwtr9' 'endwtr10' 'endwtravg' 'droughttranscost' 'droughtvulnerability' 'droughtmaxfailureperiods' 'droughttotalperiods' 'droughtavwater1' 'droughtNr1' 'droughtleases1' 'droughtdemand1' 'droughtmonthlysurplus1' 'droughtavwater2' 'droughtNr2' 'droughtleases2' 'droughtdemand2' 'droughtmonthlysurplus2' 'droughtavwater3' 'droughtNr3' 'droughtleases3' 'droughtdemand3' 'droughtmonthlysurplus3' 'droughtavwater4' 'droughtNr4' 'droughtleases4' 'droughtdemand4' 'droughtmonthlysurplus4' 'droughtavwater5' 'droughtNr5' 'droughtleases5' 'droughtdemand5' 'droughtmonthlysurplus5' 'droughtavwater6' 'droughtNr6' 'droughtleases6' 'droughtdemand6' 'droughtmonthlysurplus6' 'droughtavwater7' 'droughtNr7' 'droughtleases7' 'droughtdemand7' 'droughtmonthlysurplus7' 'droughtavwater8' 'droughtNr8' 'droughtleases8' 'droughtdemand8' 'droughtmonthlysurplus8' 'droughtavwater9' 'droughtNr9' 'droughtleases9' 'droughtdemand9' 'droughtmonthlysurplus9' 'droughtavwater10' 'droughtNr10' 'droughtleases10' 'droughtdemand10' 'droughtmonthlysurplus10' 'droughtavwater11' 'droughtNr11' 'droughtleases11' 'droughtdemand11' 'droughtmonthlysurplus11' 'droughtavwater12' 'droughtNr12' 'droughtleases12' 'droughtdemand12' 'droughtmonthlysurplus12' 'droughtNo' 'droughtNx'};

% Trim out solutions that do not meet the constraints
p_data = []; plot_data = [];
for i = 1:25
    p_data = data{i};
    plot_data{i} = p_data(p_data(:,3) >= 0.99 & p_data(:,2) >= 0.98 & p_data(:,5) <= 1.2 & p_data(:,135) == 0,1:199);
end

% Find the mins / maxs create axes for plotting using the cell array
mins_mat = []; maxs_mat = [];
for j = 1:25
    for i = 1:199
        if isempty(plot_data{j})
            % do nothing
        else
            mins_mat(j,i) = min(plot_data{j}(:,i));
            maxs_mat(j,i) = max(plot_data{j}(:,i));
        end
    end
end

% remove rows of zeros that result from null matrices
mins_mat( ~any(mins_mat,2), : ) = [];  %rows
maxs_mat( ~any(maxs_mat,2), : ) = [];  %rows

min_var1 = min(mins_mat(:,var1)); % find the global min of the column for var1
min_var2 = min(mins_mat(:,var2)); % find the global min of the column for var2

max_var1 = max(maxs_mat(:,var1)); % find the global max of the column for var1
max_var2 = max(maxs_mat(:,var2)); % find the global max of the column for var2

figure(2)
% Make a plot of 1x5 that plots var1 vs. var2 with colors according to
% var3 with files that are optimized under the same scenarios collapsed
for i = 1:5:25
    % Note that i increases by 1 based on how the csv files are stored
    % Need to create a j var to make 5 subplots
    if i==1
        j=1;
    elseif i==6
        j=2; 
    elseif i==11
        j=3;
    elseif i==16
        j=4;
    elseif i==21
        j=5;
    end
    
    sh(j) = subplot(1,5,j);
    % Pull the data differently than before, noting that the files that
    % were optimized under the same scenario are next to each other, if
    % you will
    plot(plot_data{i}(:,var1),plot_data{i}(:,var2),'.b',plot_data{i+1}(:,var1),plot_data{i+1}(:,var2),'.c',plot_data{i+2}(:,var1),plot_data{i+2}(:,var2),'.g', plot_data{i+3}(:,var1),plot_data{i+3}(:,var2),'.y',plot_data{i+4}(:,var1),plot_data{i+4}(:,var2),'.r');
    axis([min_var1,max_var1,min_var2,max_var2]); % set x and y axes according to global min / max of var1 and var2   
    % Set optimized under labels on correct axis
    if i==1
        xlabel('Optimized Under Scen1')
    elseif i==5
        xlabel('Optimized Under Scen2')
    elseif i==11
        xlabel('Optimized Under Scen3')
    elseif i==16
        xlabel('Optimized Under Scen4')     
    elseif i==21
        xlabel('Optimized Under Scen5')   
    end
end
suplabel(colNames(var1),'x',[.075 .075 .8 .85])
suplabel(colNames(var2),'y')

axis(sh,'square');