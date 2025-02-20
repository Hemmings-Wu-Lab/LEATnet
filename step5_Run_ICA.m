%% ICA去眼动和肌电
clear
clc

load data_19ch.mat

dat = cat(2, data.trial{:});
dat(isnan(dat)) = 0;
n_ic = rank(dat);

cfg = [];
%cfg.label = {'Fp1';'F7';'Fp2';'F8';'F3';'Fz';'F4';'T4';'C4';'Cz';'C3';'T3';'T6';'P4';'Pz';'P3';'T5';'O1';'O2'};
cfg.method       = 'runica';
cfg.numcomponent = n_ic;
comp = ft_componentanalysis(cfg, data);

% plot the components for visual inspection
figure
cfg = [];
cfg.component = 1:19;       % specify the component(s) that should be plotted
cfg.layout    = 'ZEYY_21'; % specify the layout file that should be used for plotting
cfg.comment   = 'no';
ft_topoplotIC(cfg, comp)

cfg = [];
cfg.layout = 'ZEYY_21'; % specify the layout file that should be used for plotting
cfg.viewmode = 'component';
ft_databrowser(cfg, comp)


%% Remove component(s)
cfg = [];
cfg.component = [5]; % to be removed component(s)去除成分选择
data_post_rej = ft_rejectcomponent(cfg, comp, data)

save data_post_rej.mat data_post_rej
save data_19ch.mat data
%save data_19ch_post_rej.mat data_post_rej