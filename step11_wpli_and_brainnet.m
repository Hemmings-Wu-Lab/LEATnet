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

load 'data_post_rej_change_side.mat'

cfg = [];
cfg.method = 'mtmconvol';
cfg.taper = 'hanning';
cfg.channel =  {'Fp1';'F7';'F3';'T3';'T5';'P3';'O1';'C3';'Fp2';'F8';'F4';'T4';'T6';'P4';'O2';'C4';'Fz';'Cz';'Pz'};
cfg.foi          = 1:1:100;                         % analysis 2 to 30 Hz in steps of 2 Hz
cfg.t_ftimwin    = ones(length(cfg.foi),1).*1;   % length of time window = 1 sec
cfg.toi          = 2:0.1:8;                  % time window "slides" from -0.5 to 1.5 sec in steps of 0.05 sec (50 ms)
% cfg.foi = 1:1:50; % analysis 1 to 20 Hz in steps of 1 Hz
% cfg.t_ftimwin = ones(length(cfg.foi),1).*0.03; % length of time window = 0.5 sec
% cfg.toi = 0:0.05:6.99;
cfg.output = 'powandcsd';
cfg.tapsmofrq = 2;

cfg.keeptrials = 'yes';
freq_wpli= ft_freqanalysis(cfg, data_post_rej_change_side); %10段数据

cfg.method='wpli_debiased';
cfg.complex = 'abs';
%WPLI generating
connect_wpli=ft_connectivityanalysis(cfg,freq_wpli); %1段数据

FileName=['wpli',datestr(now, 'dd-mmm-yyyy'),'.mat'];
save(FileName,'freq_wpli','connect_wpli','cfg')

% save freq_wpli.mat freq_wpli
% save connect_wpli.mat connect_wpli

cd('../')

end

%% Calculate average wpli 平均时间维度

clear
clc

files = dir;
% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir];
% Extract only those that are directories.
folderlist = files(dirFlags);

addpath '/Users/mingwenjie/My Document/Matlab/MATLAB tools/fieldtrip/fieldtrip-20210311/'
ft_defaults

for i = 3:length(folderlist)

    cd(folderlist(i,:).name)
    
clearvars -except folderlist wpli_raw_data wpli_all i

load 'wpli23-Sep-2024.mat'

wpli_raw_data(:,:,:,i-2) = connect_wpli.wpli_debiasedspctrm; %增加患者人数到第四维度
wpli_all(:,:,i-2) = mean(wpli_raw_data(:,:,:,i-2),3); %time window average/平均时间维度后变成wpli✖频率✖人数三维矩阵

cd('../')

end

save wpli_all.mat wpli_all wpli_raw_data

%% Get mean and std of wpli between different channels at different frequency

clear
clc

load('wpli_all.mat')

mean_wpli = mean(wpli_all,3);
std_wpli = std(wpli_all,0,3);

% delta
delta_mean_wpli = sum(mean_wpli(:,1:4),2);
delta_std_wpli = sum(std_wpli(:,1:4),2);

% theta
theta_mean_wpli = sum(mean_wpli(:,4:8),2);
theta_std_wpli = sum(std_wpli(:,4:8),2);

% alpha
alpha_mean_wpli = sum(mean_wpli(:,8:12),2);
alpha_std_wpli = sum(std_wpli(:,8:12),2);

% beta
beta_mean_wpli = sum(mean_wpli(:,12:30),2);
beta_std_wpli = sum(std_wpli(:,12:30),2);

% gamma
gamma_mean_wpli = sum(mean_wpli(:,30:100),2);
gamma_std_wpli = sum(std_wpli(:,30:100),2);

save wpli_mean_band.mat

%% Create data sheet for brainnet

delta_brainnet_data = [];
for i = 1:19
delta_brainnet_data(i,i) = 0;
end
delta_brainnet_data(2:19,1) = delta_mean_wpli(1:18);
delta_brainnet_data(3:19,2) = delta_mean_wpli(19:35);
delta_brainnet_data(4:19,3) = delta_mean_wpli(36:51);
delta_brainnet_data(5:19,4) = delta_mean_wpli(52:66);
delta_brainnet_data(6:19,5) = delta_mean_wpli(67:80);
delta_brainnet_data(7:19,6) = delta_mean_wpli(81:93);
delta_brainnet_data(8:19,7) = delta_mean_wpli(94:105);
delta_brainnet_data(9:19,8) = delta_mean_wpli(106:116);
delta_brainnet_data(10:19,9) = delta_mean_wpli(117:126);
delta_brainnet_data(11:19,10) = delta_mean_wpli(127:135);
delta_brainnet_data(12:19,11) = delta_mean_wpli(136:143);
delta_brainnet_data(13:19,12) = delta_mean_wpli(144:150);
delta_brainnet_data(14:19,13) = delta_mean_wpli(151:156);
delta_brainnet_data(15:19,14) = delta_mean_wpli(157:161);
delta_brainnet_data(16:19,15) = delta_mean_wpli(162:165);
delta_brainnet_data(17:19,16) = delta_mean_wpli(166:168);
delta_brainnet_data(18:19,17) = delta_mean_wpli(169:170);
delta_brainnet_data(19,18) = delta_mean_wpli(171);

delta_brainnet_data(1,2:19) = delta_mean_wpli(1:18);
delta_brainnet_data(2,3:19) = delta_mean_wpli(19:35);
delta_brainnet_data(3,4:19) = delta_mean_wpli(36:51);
delta_brainnet_data(4,5:19) = delta_mean_wpli(52:66);
delta_brainnet_data(5,6:19) = delta_mean_wpli(67:80);
delta_brainnet_data(6,7:19) = delta_mean_wpli(81:93);
delta_brainnet_data(7,8:19) = delta_mean_wpli(94:105);
delta_brainnet_data(8,9:19) = delta_mean_wpli(106:116);
delta_brainnet_data(9,10:19) = delta_mean_wpli(117:126);
delta_brainnet_data(10,11:19) = delta_mean_wpli(127:135);
delta_brainnet_data(11,12:19) = delta_mean_wpli(136:143);
delta_brainnet_data(12,13:19) = delta_mean_wpli(144:150);
delta_brainnet_data(13,14:19) = delta_mean_wpli(151:156);
delta_brainnet_data(14,15:19) = delta_mean_wpli(157:161);
delta_brainnet_data(15,16:19) = delta_mean_wpli(162:165);
delta_brainnet_data(16,17:19) = delta_mean_wpli(166:168);
delta_brainnet_data(17,18:19) = delta_mean_wpli(169:170);
delta_brainnet_data(18,19) = delta_mean_wpli(171);

save delta_brainnet_data.mat delta_brainnet_data

alpha_brainnet_data = [];
for i = 1:19
alpha_brainnet_data(i,i) = 0;
end
alpha_brainnet_data(2:19,1) = alpha_mean_wpli(1:18);
alpha_brainnet_data(3:19,2) = alpha_mean_wpli(19:35);
alpha_brainnet_data(4:19,3) = alpha_mean_wpli(36:51);
alpha_brainnet_data(5:19,4) = alpha_mean_wpli(52:66);
alpha_brainnet_data(6:19,5) = alpha_mean_wpli(67:80);
alpha_brainnet_data(7:19,6) = alpha_mean_wpli(81:93);
alpha_brainnet_data(8:19,7) = alpha_mean_wpli(94:105);
alpha_brainnet_data(9:19,8) = alpha_mean_wpli(106:116);
alpha_brainnet_data(10:19,9) = alpha_mean_wpli(117:126);
alpha_brainnet_data(11:19,10) = alpha_mean_wpli(127:135);
alpha_brainnet_data(12:19,11) = alpha_mean_wpli(136:143);
alpha_brainnet_data(13:19,12) = alpha_mean_wpli(144:150);
alpha_brainnet_data(14:19,13) = alpha_mean_wpli(151:156);
alpha_brainnet_data(15:19,14) = alpha_mean_wpli(157:161);
alpha_brainnet_data(16:19,15) = alpha_mean_wpli(162:165);
alpha_brainnet_data(17:19,16) = alpha_mean_wpli(166:168);
alpha_brainnet_data(18:19,17) = alpha_mean_wpli(169:170);
alpha_brainnet_data(19,18) = alpha_mean_wpli(171);

alpha_brainnet_data(1,2:19) = alpha_mean_wpli(1:18);
alpha_brainnet_data(2,3:19) = alpha_mean_wpli(19:35);
alpha_brainnet_data(3,4:19) = alpha_mean_wpli(36:51);
alpha_brainnet_data(4,5:19) = alpha_mean_wpli(52:66);
alpha_brainnet_data(5,6:19) = alpha_mean_wpli(67:80);
alpha_brainnet_data(6,7:19) = alpha_mean_wpli(81:93);
alpha_brainnet_data(7,8:19) = alpha_mean_wpli(94:105);
alpha_brainnet_data(8,9:19) = alpha_mean_wpli(106:116);
alpha_brainnet_data(9,10:19) = alpha_mean_wpli(117:126);
alpha_brainnet_data(10,11:19) = alpha_mean_wpli(127:135);
alpha_brainnet_data(11,12:19) = alpha_mean_wpli(136:143);
alpha_brainnet_data(12,13:19) = alpha_mean_wpli(144:150);
alpha_brainnet_data(13,14:19) = alpha_mean_wpli(151:156);
alpha_brainnet_data(14,15:19) = alpha_mean_wpli(157:161);
alpha_brainnet_data(15,16:19) = alpha_mean_wpli(162:165);
alpha_brainnet_data(16,17:19) = alpha_mean_wpli(166:168);
alpha_brainnet_data(17,18:19) = alpha_mean_wpli(169:170);
alpha_brainnet_data(18,19) = alpha_mean_wpli(171);

save alpha_brainnet_data.mat alpha_brainnet_data

theta_brainnet_data = [];
for i = 1:19
theta_brainnet_data(i,i) = 0;
end
theta_brainnet_data(2:19,1) = theta_mean_wpli(1:18);
theta_brainnet_data(3:19,2) = theta_mean_wpli(19:35);
theta_brainnet_data(4:19,3) = theta_mean_wpli(36:51);
theta_brainnet_data(5:19,4) = theta_mean_wpli(52:66);
theta_brainnet_data(6:19,5) = theta_mean_wpli(67:80);
theta_brainnet_data(7:19,6) = theta_mean_wpli(81:93);
theta_brainnet_data(8:19,7) = theta_mean_wpli(94:105);
theta_brainnet_data(9:19,8) = theta_mean_wpli(106:116);
theta_brainnet_data(10:19,9) = theta_mean_wpli(117:126);
theta_brainnet_data(11:19,10) = theta_mean_wpli(127:135);
theta_brainnet_data(12:19,11) = theta_mean_wpli(136:143);
theta_brainnet_data(13:19,12) = theta_mean_wpli(144:150);
theta_brainnet_data(14:19,13) = theta_mean_wpli(151:156);
theta_brainnet_data(15:19,14) = theta_mean_wpli(157:161);
theta_brainnet_data(16:19,15) = theta_mean_wpli(162:165);
theta_brainnet_data(17:19,16) = theta_mean_wpli(166:168);
theta_brainnet_data(18:19,17) = theta_mean_wpli(169:170);
theta_brainnet_data(19,18) = theta_mean_wpli(171);

theta_brainnet_data(1,2:19) = theta_mean_wpli(1:18);
theta_brainnet_data(2,3:19) = theta_mean_wpli(19:35);
theta_brainnet_data(3,4:19) = theta_mean_wpli(36:51);
theta_brainnet_data(4,5:19) = theta_mean_wpli(52:66);
theta_brainnet_data(5,6:19) = theta_mean_wpli(67:80);
theta_brainnet_data(6,7:19) = theta_mean_wpli(81:93);
theta_brainnet_data(7,8:19) = theta_mean_wpli(94:105);
theta_brainnet_data(8,9:19) = theta_mean_wpli(106:116);
theta_brainnet_data(9,10:19) = theta_mean_wpli(117:126);
theta_brainnet_data(10,11:19) = theta_mean_wpli(127:135);
theta_brainnet_data(11,12:19) = theta_mean_wpli(136:143);
theta_brainnet_data(12,13:19) = theta_mean_wpli(144:150);
theta_brainnet_data(13,14:19) = theta_mean_wpli(151:156);
theta_brainnet_data(14,15:19) = theta_mean_wpli(157:161);
theta_brainnet_data(15,16:19) = theta_mean_wpli(162:165);
theta_brainnet_data(16,17:19) = theta_mean_wpli(166:168);
theta_brainnet_data(17,18:19) = theta_mean_wpli(169:170);
theta_brainnet_data(18,19) = theta_mean_wpli(171);

save theta_brainnet_data.mat theta_brainnet_data

beta_brainnet_data = [];
for i = 1:19
beta_brainnet_data(i,i) = 0;
end
beta_brainnet_data(2:19,1) = beta_mean_wpli(1:18);
beta_brainnet_data(3:19,2) = beta_mean_wpli(19:35);
beta_brainnet_data(4:19,3) = beta_mean_wpli(36:51);
beta_brainnet_data(5:19,4) = beta_mean_wpli(52:66);
beta_brainnet_data(6:19,5) = beta_mean_wpli(67:80);
beta_brainnet_data(7:19,6) = beta_mean_wpli(81:93);
beta_brainnet_data(8:19,7) = beta_mean_wpli(94:105);
beta_brainnet_data(9:19,8) = beta_mean_wpli(106:116);
beta_brainnet_data(10:19,9) = beta_mean_wpli(117:126);
beta_brainnet_data(11:19,10) = beta_mean_wpli(127:135);
beta_brainnet_data(12:19,11) = beta_mean_wpli(136:143);
beta_brainnet_data(13:19,12) = beta_mean_wpli(144:150);
beta_brainnet_data(14:19,13) = beta_mean_wpli(151:156);
beta_brainnet_data(15:19,14) = beta_mean_wpli(157:161);
beta_brainnet_data(16:19,15) = beta_mean_wpli(162:165);
beta_brainnet_data(17:19,16) = beta_mean_wpli(166:168);
beta_brainnet_data(18:19,17) = beta_mean_wpli(169:170);
beta_brainnet_data(19,18) = beta_mean_wpli(171);

beta_brainnet_data(1,2:19) = beta_mean_wpli(1:18);
beta_brainnet_data(2,3:19) = beta_mean_wpli(19:35);
beta_brainnet_data(3,4:19) = beta_mean_wpli(36:51);
beta_brainnet_data(4,5:19) = beta_mean_wpli(52:66);
beta_brainnet_data(5,6:19) = beta_mean_wpli(67:80);
beta_brainnet_data(6,7:19) = beta_mean_wpli(81:93);
beta_brainnet_data(7,8:19) = beta_mean_wpli(94:105);
beta_brainnet_data(8,9:19) = beta_mean_wpli(106:116);
beta_brainnet_data(9,10:19) = beta_mean_wpli(117:126);
beta_brainnet_data(10,11:19) = beta_mean_wpli(127:135);
beta_brainnet_data(11,12:19) = beta_mean_wpli(136:143);
beta_brainnet_data(12,13:19) = beta_mean_wpli(144:150);
beta_brainnet_data(13,14:19) = beta_mean_wpli(151:156);
beta_brainnet_data(14,15:19) = beta_mean_wpli(157:161);
beta_brainnet_data(15,16:19) = beta_mean_wpli(162:165);
beta_brainnet_data(16,17:19) = beta_mean_wpli(166:168);
beta_brainnet_data(17,18:19) = beta_mean_wpli(169:170);
beta_brainnet_data(18,19) = beta_mean_wpli(171);

save beta_brainnet_data.mat beta_brainnet_data

gamma_brainnet_data = [];
for i = 1:19
gamma_brainnet_data(i,i) = 0;
end
gamma_brainnet_data(2:19,1) = gamma_mean_wpli(1:18);
gamma_brainnet_data(3:19,2) = gamma_mean_wpli(19:35);
gamma_brainnet_data(4:19,3) = gamma_mean_wpli(36:51);
gamma_brainnet_data(5:19,4) = gamma_mean_wpli(52:66);
gamma_brainnet_data(6:19,5) = gamma_mean_wpli(67:80);
gamma_brainnet_data(7:19,6) = gamma_mean_wpli(81:93);
gamma_brainnet_data(8:19,7) = gamma_mean_wpli(94:105);
gamma_brainnet_data(9:19,8) = gamma_mean_wpli(106:116);
gamma_brainnet_data(10:19,9) = gamma_mean_wpli(117:126);
gamma_brainnet_data(11:19,10) = gamma_mean_wpli(127:135);
gamma_brainnet_data(12:19,11) = gamma_mean_wpli(136:143);
gamma_brainnet_data(13:19,12) = gamma_mean_wpli(144:150);
gamma_brainnet_data(14:19,13) = gamma_mean_wpli(151:156);
gamma_brainnet_data(15:19,14) = gamma_mean_wpli(157:161);
gamma_brainnet_data(16:19,15) = gamma_mean_wpli(162:165);
gamma_brainnet_data(17:19,16) = gamma_mean_wpli(166:168);
gamma_brainnet_data(18:19,17) = gamma_mean_wpli(169:170);
gamma_brainnet_data(19,18) = gamma_mean_wpli(171);

gamma_brainnet_data(1,2:19) = gamma_mean_wpli(1:18);
gamma_brainnet_data(2,3:19) = gamma_mean_wpli(19:35);
gamma_brainnet_data(3,4:19) = gamma_mean_wpli(36:51);
gamma_brainnet_data(4,5:19) = gamma_mean_wpli(52:66);
gamma_brainnet_data(5,6:19) = gamma_mean_wpli(67:80);
gamma_brainnet_data(6,7:19) = gamma_mean_wpli(81:93);
gamma_brainnet_data(7,8:19) = gamma_mean_wpli(94:105);
gamma_brainnet_data(8,9:19) = gamma_mean_wpli(106:116);
gamma_brainnet_data(9,10:19) = gamma_mean_wpli(117:126);
gamma_brainnet_data(10,11:19) = gamma_mean_wpli(127:135);
gamma_brainnet_data(11,12:19) = gamma_mean_wpli(136:143);
gamma_brainnet_data(12,13:19) = gamma_mean_wpli(144:150);
gamma_brainnet_data(13,14:19) = gamma_mean_wpli(151:156);
gamma_brainnet_data(14,15:19) = gamma_mean_wpli(157:161);
gamma_brainnet_data(15,16:19) = gamma_mean_wpli(162:165);
gamma_brainnet_data(16,17:19) = gamma_mean_wpli(166:168);
gamma_brainnet_data(17,18:19) = gamma_mean_wpli(169:170);
gamma_brainnet_data(18,19) = gamma_mean_wpli(171);

save gamma_brainnet_data.mat gamma_brainnet_data
