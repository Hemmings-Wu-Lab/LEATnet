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
results = {'Folder', 'Delta Mean', 'Delta SEM', 'Theta Mean', 'Theta SEM', 'Alpha Mean', 'Alpha SEM', 'Beta Mean', 'Beta SEM', 'Gamma Mean', 'Gamma SEM'};
all_wpli_delta = [];
all_wpli_theta = [];
all_wpli_alpha = [];
all_wpli_beta = [];
all_wpli_gamma = [];

% Loop over each folder starting from the third one
for i = 3:length(folderlist)
    % Change directory to the current folder
    cd(folderlist(i).name);
    
    % Clear variables except folderlist
    clearvars -except folderlist results i all_wpli_delta all_wpli_theta all_wpli_alpha all_wpli_beta all_wpli_gamma;

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

    % Compute average values and SEM for different frequency bands
    wpli_delta = connect_wpli.wpli_debiasedspctrm(:, 1:4, :, :);
    wpli_theta = connect_wpli.wpli_debiasedspctrm(:, 4:8, :, :);
    wpli_alpha = connect_wpli.wpli_debiasedspctrm(:, 8:12, :, :);
    wpli_beta = connect_wpli.wpli_debiasedspctrm(:, 12:30, :, :);
    wpli_gamma = connect_wpli.wpli_debiasedspctrm(:, 30:100, :, :);

    % Calculate mean and SEM
    wpli_person_average_delta = mean(wpli_delta(:));
    wpli_person_sem_delta = std(wpli_delta(:)) / sqrt(numel(wpli_delta));

    wpli_person_average_theta = mean(wpli_theta(:));
    wpli_person_sem_theta = std(wpli_theta(:)) / sqrt(numel(wpli_theta));

    wpli_person_average_alpha = mean(wpli_alpha(:));
    wpli_person_sem_alpha = std(wpli_alpha(:)) / sqrt(numel(wpli_alpha));

    wpli_person_average_beta = mean(wpli_beta(:));
    wpli_person_sem_beta = std(wpli_beta(:)) / sqrt(numel(wpli_beta));

    wpli_person_average_gamma = mean(wpli_gamma(:));
    wpli_person_sem_gamma = std(wpli_gamma(:)) / sqrt(numel(wpli_gamma));

    % Store individual results in the cell array
    results(end+1, :) = {folderlist(i).name, wpli_person_average_delta, wpli_person_sem_delta, wpli_person_average_theta, wpli_person_sem_theta, wpli_person_average_alpha, wpli_person_sem_alpha, wpli_person_average_beta, wpli_person_sem_beta, wpli_person_average_gamma, wpli_person_sem_gamma};

    % Collect data for overall mean and SEM calculation
    all_wpli_delta = [all_wpli_delta; wpli_delta(:)];
    all_wpli_theta = [all_wpli_theta; wpli_theta(:)];
    all_wpli_alpha = [all_wpli_alpha; wpli_alpha(:)];
    all_wpli_beta = [all_wpli_beta; wpli_beta(:)];
    all_wpli_gamma = [all_wpli_gamma; wpli_gamma(:)];

    % Save the results in a MAT file
    FileName = ['wpli', datestr(now, 'dd-mmm-yyyy'), '.mat'];
    save(FileName, 'freq_wpli', 'connect_wpli', 'cfg');

    % Return to the parent directory
    cd('../');
end

% Calculate overall mean and SEM for each frequency band
overall_mean_delta = mean(all_wpli_delta);
overall_sem_delta = std(all_wpli_delta) / sqrt(numel(all_wpli_delta));

overall_mean_theta = mean(all_wpli_theta);
overall_sem_theta = std(all_wpli_theta) / sqrt(numel(all_wpli_theta));

overall_mean_alpha = mean(all_wpli_alpha);
overall_sem_alpha = std(all_wpli_alpha) / sqrt(numel(all_wpli_alpha));

overall_mean_beta = mean(all_wpli_beta);
overall_sem_beta = std(all_wpli_beta) / sqrt(numel(all_wpli_beta));

overall_mean_gamma = mean(all_wpli_gamma);
overall_sem_gamma = std(all_wpli_gamma) / sqrt(numel(all_wpli_gamma));

% Add overall results to the results cell array
results(end+1, :) = {'Overall', overall_mean_delta, overall_sem_delta, overall_mean_theta, overall_sem_theta, overall_mean_alpha, overall_sem_alpha, overall_mean_beta, overall_sem_beta, overall_mean_gamma, overall_sem_gamma};

% Convert cell array to table
resultsTable = cell2table(results(2:end, :), 'VariableNames', results(1, :));

% Write the table to an Excel file
writetable(resultsTable, 'wpli_band_person_average3.xlsx');