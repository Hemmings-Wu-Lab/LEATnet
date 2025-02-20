% 第三步 选择剔除无用电极 将电极名称标准化
clc
clear

addpath '/Users/mingwenjie/My Document/Matlab/MATLAB tools/fieldtrip/fieldtrip-20210311/'
ft_defaults

files = dir;

% Get a logical vector that tells which is a directory.

dirFlags = [files.isdir]

% Extract only those that are directories.

subFolders = files(dirFlags)


for i = 3:length(subFolders)
    
    cd(subFolders(i,:).name)
    
    load data.mat
    cfg            = [];
    cfg.continuous = 'yes';
    cfg.channel = {'Fp1';'F7';'F3';'T3';'T5';'P3';'O1';'C3';'Fp2';'F8';'F4';'T4';'T6';'P4';'O2';'C4';'Fz';'Cz';'Pz';'Oz'};

    data = ft_preprocessing(cfg,data);
    
    save data_19ch.mat data
   % clear data
    cd('../')
end
