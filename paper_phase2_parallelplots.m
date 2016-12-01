% Abigail Watson, 07/01/2015
% LRGV deep uncertainty exploration
% parallel plots

clc; clear all; close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Begin User Defined Input %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set local directory that contains all 25 csv evaluation files (NOTE: If you change the file names from what they are originally, it is very important that they are ordered as Opt1_Eval1, Opt1_Eval2, Opt1_Eval3, Opt1_Eval4, Opt1_Eval5, Opt2_Eval1, Opt2, Eval2, etc.)

Dir = '/Users/abigailawatson/Google Drive/Research/Paper/Plots/';

% What do you want to plot?
%under = [1 7 13 19 25]; % parallel will show each scen eval under own scen
under = [1 6 11 16 21]; % parallel will show each scen eval under Scen 1
%under = [2 7 12 17 22]; % parallel will show each scen eval under Scen 2
%under = [3 8 13 18 23]; % parallel will show each scen eval under Scen 3
%under = [4 9 14 19 24]; % parallel will show each scen eval under Scen 4
%under = [5 10 15 20 25]; % parallel will show each scen eval under Scen 5

% What solutions do you want to select?
sol1 = 170;
sol2 = 457;
sol3 = 118;
sol4 = 209;
sol5 = 122;

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
   
pardata=[]; pardata_col=[]; pardata_sel = [];
for i=1:25

    % preferred column order: rights, opt-low, opt-high, xi, a2, b2, a, b, cost,
    % crel, surp, drop, #leases, drTransCost, rel, drvuln, CVAR

    % grab data in the columns we care about from each csv file
    pardata = data{i}(:,[12 14 15 13 16 17 18 19 1 3 4 6 7 134 2 135 5]); % these numbers refer to the column order listed above
    
    % for selected solutions
    pardata_sel{i} = pardata;
    pardata_sel{i}(:,10) = pardata_sel{i}(:,10)*-1; % reverse crit rel
    pardata_sel{i}(:,1) = pardata_sel{i}(:,1)*1233.48184; % convert rights to cubic meters
    pardata_sel{i}(:,2) = pardata_sel{i}(:,2)*1233.48184; % convert optlow to cubic meters
    pardata_sel{i}(:,3) = pardata_sel{i}(:,3)*1233.48184; % convert opthigh to cubic meters
    pardata_sel{i}(:,11) = pardata_sel{i}(:,11)*1233.48184; % convert surp to cubic meters
    pardata_sel{i}(:,12) = pardata_sel{i}(:,12)*1233.48184; % convert drop to cubic meters
    
    % trim data down that meets the constraint set
    pardata_col{i} = pardata(pardata(:,10) >= 0.99 & pardata(:,15) >= 0.98 & pardata(:,17) <= 1.2 & pardata(:,16) == 0,1:17);
    pardata_col{i}(:,10) = pardata_col{i}(:,10)*-1; % reverse crit rel
    pardata_col{i}(:,1) = pardata_col{i}(:,1)*1233.48184; % convert rights to cubic meters
    pardata_col{i}(:,2) = pardata_col{i}(:,2)*1233.48184; % convert optlow to cubic meters
    pardata_col{i}(:,3) = pardata_col{i}(:,3)*1233.48184; % convert opthigh to cubic meters
    pardata_col{i}(:,11) = pardata_col{i}(:,11)*1233.48184; % convert surp to cubic meters
    pardata_col{i}(:,12) = pardata_col{i}(:,12)*1233.48184; % convert drop to cubic meters
end

% Find the mins / maxs create axes for plotting using the cell array
mins_mat = []; maxs_mat = [];
for j = 1:25
    for i = 1:17
        if isempty(pardata_col{j})
            % do nothing
        else
            mins_mat(j,i) = min(pardata_col{j}(:,i));
            maxs_mat(j,i) = max(pardata_col{j}(:,i));
        end
    end
end

% remove rows of zeros that result from null matrices
mins_mat( ~any(mins_mat,2), : ) = [];  %rows
maxs_mat( ~any(maxs_mat,2), : ) = [];  %rows

% figure out global mins/maxs of data that meet the constraints
m = min(mins_mat);
m(:,15:17) = [];
m(:,5:8) = 0;
M = max(maxs_mat);
M(:,15:17) = [];
M(:,5:8) = 3;

% colors for plotting
colors = ['b' 'c' 'g' 'y' 'r'];

% ditch the constraints
for i = 1:25
    pardata_col{i} = pardata_col{i}(:,1:14);
    pardata_sel{i} = pardata_sel{i}(:,1:14);
end

% scenario 1
pd1 = cat(1,pardata_col{under(1)}); 
pd1 = (pd1-repmat(m, size(pd1,1),1))./(repmat(M, size(pd1,1),1)-repmat(m, size(pd1,1),1)); 
sol1plot = cat(1,pardata_sel{under(1)}(sol1,:));
s1 = (sol1plot-repmat(m, size(sol1plot,1),1))./(repmat(M, size(sol1plot,1),1)-repmat(m, size(sol1plot,1),1)); 

% scenario 2
pd2 = cat(1,pardata_col{under(2)}); 
pd2 = (pd2-repmat(m, size(pd2,1),1))./(repmat(M, size(pd2,1),1)-repmat(m, size(pd2,1),1));    
sol2plot = pardata_sel{under(2)}(sol2,:);
s2 = (sol2plot-repmat(m, size(sol2plot,1),1))./(repmat(M, size(sol2plot,1),1)-repmat(m, size(sol2plot,1),1)); 

% scenario 3
pd3 = cat(1,pardata_col{under(3)}); 
pd3 = (pd3-repmat(m, size(pd3,1),1))./(repmat(M, size(pd3,1),1)-repmat(m, size(pd3,1),1));
sol3plot = pardata_sel{under(3)}(sol3,:);
s3 = (sol3plot-repmat(m, size(sol3plot,1),1))./(repmat(M, size(sol3plot,1),1)-repmat(m, size(sol3plot,1),1)); 

% scenario 4
pd4 = cat(1,pardata_col{under(4)}); 
pd4 = (pd4-repmat(m, size(pd4,1),1))./(repmat(M, size(pd4,1),1)-repmat(m, size(pd4,1),1));
sol4plot = pardata_sel{under(4)}(sol4,:);
s4 = (sol4plot-repmat(m, size(sol4plot,1),1))./(repmat(M, size(sol4plot,1),1)-repmat(m, size(sol4plot,1),1)); 

% scenario 5
pd5 = cat(1,pardata_col{under(5)}); 
pd5 = (pd5-repmat(m, size(pd5,1),1))./(repmat(M, size(pd5,1),1)-repmat(m, size(pd5,1),1));    
sol5plot = pardata_sel{under(5)}(sol5,:);
s5 = (sol5plot-repmat(m, size(sol5plot,1),1))./(repmat(M, size(sol5plot,1),1)-repmat(m, size(sol5plot,1),1)); 

% plot tradeoffs from all scenarios using the data above
figure(1);

hold on; parallelcoords(pd1, 'Color', 'b', 'LineWidth', 0.5);
hold on; parallelcoords(pd2, 'Color', 'c', 'LineWidth', 0.5);
hold on; parallelcoords(pd3, 'Color', 'g', 'LineWidth', 0.5);
hold on; parallelcoords(pd4, 'Color', 'y', 'LineWidth', 0.5);
hold on; parallelcoords(pd5, 'Color', 'r', 'LineWidth', 0.5);
%hold on; parallelcoords(s1, 'Color', 'b', 'LineWidth', 3);
%hold on; parallelcoords(s2, 'Color', 'c', 'LineWidth', 3);
%hold on; parallelcoords(s3, 'Color', 'g', 'LineWidth', 5);
%hold on; parallelcoords(s4, 'Color', 'y', 'LineWidth', 3);
%hold on; parallelcoords(s5, 'Color', 'r', 'LineWidth', 3);





