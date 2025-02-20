% Clear workspace and command window
clear;
clc;

% List all files and directories in the current directory
files = dir;

% Get a logical vector that tells which is a directory
dirFlags = [files.isdir];

% Extract only those that are directories
folderlist = files(dirFlags);

% Initialize FieldTrip
addpath '/Users/mingwenjie/My Document/Matlab/MATLAB tools/fieldtrip/fieldtrip-20210311/';
ft_defaults;

% Initialize a cell array to store results
results = {'Folder', 'Delta', 'Theta', 'Alpha', 'Beta', 'Gamma'};

% Loop over each folder starting from the third one
for i = 3:length(folderlist)
    % Change directory to the current folder
    cd(folderlist(i).name);
    
    % Clear variables except folderlist
    clearvars -except folderlist results i;

    % Load the data
    load 'data_post_rej.mat';

    % Frequency analysis configuration
    cfg = [];
    cfg.method = 'mtmconvol';
    cfg.taper = 'hanning';
   %cfg.channel =  {'Fp1';'F7';'F3';'T3';'T5';'P3';'O1';'C3';'Fz';'Cz';'Pz';'C4';'Fp2';'F8';'F4';'T4';'T6';'P4';'O2'};
    cfg.channel =  {'Fp1';'F7';'F3';'T3';'T5';'P3';'O1';'C3';'Fp2';'F8';'F4';'T4';'T6';'P4';'O2';'C4';'Fz';'Cz';'Pz'};
    cfg.foi = 1:1:100;
    cfg.t_ftimwin = ones(length(cfg.foi),1).*1;
    cfg.toi = 2:0.1:8;
    cfg.output = 'powandcsd';
    cfg.tapsmofrq = 2;
    cfg.keeptrials = 'yes';
    
    % Perform frequency analysis
    freq_wpli = ft_freqanalysis(cfg, data_post_rej);

    % Connectivity analysis configuration
    cfg.method = 'wpli_debiased';
    cfg.complex = 'abs';
    
    % Generate WPLI
    connect_wpli = ft_connectivityanalysis(cfg, freq_wpli);

    % Compute average values for different frequency bands
    wpli_person_average_delta = mean(mean(mean(connect_wpli.wpli_debiasedspctrm(:, 1:4, :, :), 3), 2), 1);
    wpli_person_average_theta = mean(mean(mean(connect_wpli.wpli_debiasedspctrm(:, 4:8, :, :), 3), 2), 1);
    wpli_person_average_alpha = mean(mean(mean(connect_wpli.wpli_debiasedspctrm(:, 8:12, :, :), 3), 2), 1);
    wpli_person_average_beta = mean(mean(mean(connect_wpli.wpli_debiasedspctrm(:, 12:30, :, :), 3), 2), 1);
    wpli_person_average_gamma = mean(mean(mean(connect_wpli.wpli_debiasedspctrm(:, 30:100, :, :), 3), 2), 1);

    % Store results in the cell array
    results(end+1, :) = {folderlist(i).name, wpli_person_average_delta, wpli_person_average_theta, wpli_person_average_alpha, wpli_person_average_beta, wpli_person_average_gamma};

    % Save the results in a MAT file
    FileName = ['wpli', datestr(now, 'dd-mmm-yyyy'), '.mat'];
    save(FileName, 'freq_wpli', 'connect_wpli', 'cfg');

    % Return to the parent directory
    cd('../');
end

% Convert cell array to table
resultsTable = cell2table(results(2:end, :), 'VariableNames', results(1, :));

% Write the table to an Excel file
writetable(resultsTable, 'wpli_band_person_average.xlsx');
