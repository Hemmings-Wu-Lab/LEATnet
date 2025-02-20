clc
clear

addpath '/Users/mingwenjie/My Document/Matlab/MATLAB tools/fieldtrip/fieldtrip-20210311/'
ft_defaults

files = dir;

% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir];

% Extract only those that are directories.
subFolders = files(dirFlags);

% 定义左右电极名称
left_channels = {'Fp1';'F7';'F3';'T3';'T5';'P3';'O1';'C3'};
right_channels = {'Fp2';'F8';'F4';'T4';'T6';'P4';'O2';'C4'};

for i = 3:length(subFolders)
    
    cd(subFolders(i,:).name)
   
    % 加载数据
    load data_post_rej.mat
    
    % 检查文件夹名称中是否包含 "R" 或 "L"
    folder_name = subFolders(i).name;
    
    if contains(folder_name, 'R') % 如果文件夹名称包含 "R"，交换左右侧电极数据
        
        % 创建配置结构体，处理原始数据
        cfg = [];
        cfg.continuous = 'yes';
        cfg.channel = {'Fp1';'F7';'F3';'T3';'T5';'P3';'O1';'C3';'Fp2';'F8';'F4';'T4';'T6';'P4';'O2';'C4';'Fz';'Cz';'Pz';'Oz'};
        
        data = ft_preprocessing(cfg, data_post_rej);
        
        % 创建一个副本用于交换左右电极
        data_post_rej_change_side = data;
        
        % 交换左右电极的数据
        for j = 1:length(left_channels)
            % 找到左侧和右侧电极的位置
            left_idx = find(strcmp(data.label, left_channels{j}));
            right_idx = find(strcmp(data.label, right_channels{j}));
            
            % 交换左右电极的数据
            for trial = 1:length(data.trial)
                temp_data = data.trial{trial}(left_idx, :);
                data_post_rej_change_side.trial{trial}(left_idx, :) = data.trial{trial}(right_idx, :);
                data_post_rej_change_side.trial{trial}(right_idx, :) = temp_data;
            end
        end
        
        % 保存交换过电极数据的结果
        save('data_post_rej_change_side.mat', 'data_post_rej_change_side')
        
    elseif contains(folder_name, 'L') % 如果文件夹名称包含 "L"，保持数据不变
        
        % 创建配置结构体，提取所需的电极
        cfg = [];
        cfg.continuous = 'yes';
        cfg.channel = {'Fp1';'F7';'F3';'T3';'T5';'P3';'O1';'C3';'Fp2';'F8';'F4';'T4';'T6';'P4';'O2';'C4';'Fz';'Cz';'Pz';'Oz'};
        
        % 处理数据
        data_post_rej_change_side = ft_preprocessing(cfg, data_post_rej);
        
        % 保存处理后的数据
        save('data_post_rej_change_side.mat', 'data_post_rej_change_side')
    end
    
    % 返回到上一级目录
    cd('../')
end