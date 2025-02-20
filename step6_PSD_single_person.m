c%% 第六步 计算PSD
%% create folder list, assuming each folder has a data.m file

clear
clc

files = dir;

% Get a logical vector that tells which is a directory.

dirFlags = [files.isdir];

% Extract only those that are directories.

folderlist = files(dirFlags);

addpath '/Users/mingwenjie/My Document/Matlab/MATLAB tools/fieldtrip/fieldtrip-20210311/'
ft_defaults

%% frequency analysis

for i = 3:length(folderlist)

    cd(folderlist(i,:).name)
    
clearvars -except folderlist

load 'data_post_rej.mat'

cfg = [];
cfg.method = 'mtmconvol';
cfg.taper = 'hanning';
cfg.channels =  {'Fp1';'F7';'F3';'T3';'T5';'P3';'O1';'C3';'Fp2';'F8';'F4';'T4';'T6';'P4';'O2';'C4';'Fz';'Cz';'Pz'};%注意这个改变了channel顺序
cfg.foi          = 1:1:100;                         % analysis 1 to 60 Hz in steps of 1 Hz
cfg.t_ftimwin    = ones(length(cfg.foi),1).*1;   % length of time window = 1 sec
cfg.toi          = 2:0.1:8;                  % time window "slides" from 1 to 300 sec in steps of 0.1 sec (100 ms)
cfg.output = 'pow';

TFRhann = ft_freqanalysis(cfg, data_post_rej);

FileName=['TFRhann',datestr(now, 'dd-mmm-yyyy'),'.mat'];

save(FileName,'TFRhann','cfg')
 
% cfg.keeptrials = 'yes';
% freq_wpli= ft_freqanalysis(cfg, data);

% cfg.method='wpli_debiased';
% cfg.complex = 'abs';
% %WPLI generating
% connect_wpli=ft_connectivityanalysis(cfg,freq_wpli);
% 
% save freq_wpli.mat freq_wpli
% save connect_wpli.mat connect_wpli

%cfg = [];
% cfg.xlim = [0.9 1.3];
% cfg.ylim = [15 20];
% cfg.zlim = [-1e-27 1e-27];
% cfg.baseline = [-0.5 -0.1];
% cfg.baselinetype = 'absolute';
%cfg.layout = 'ZEYY_21.mat';
%figure; ft_topoplotTFR(cfg,TFRhann); colorbar

cd('../')

end