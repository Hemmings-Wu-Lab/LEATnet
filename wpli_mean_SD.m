% 假设 indices 是一个 19x2 的 cell 数组，每行包含一个电极名称和对应的索引数组
% 假设 wpli_values 是一个 171xN 的矩阵，每列包含一个患者的所有电极的 WPLI 值
load 'wpli_all.mat';%创造indices

%单个患者不同频段wpli

delta_group_wpli = squeeze(mean(wpli_all(:,1:4,:),2));
theta_group_wpli = squeeze(mean(wpli_all(:,4:8,:),2));
alpha_group_wpli = squeeze(mean(wpli_all(:,8:12,:),2));
beta_group_wpli = squeeze(mean(wpli_all(:,12:30,:),2));
gamma_group_wpli = squeeze(mean(wpli_all(:,30:100,:),2));


% load indices.mat;
load indices.mat;
wpli_values = alpha_group_wpli; % 提取group或者某个患者的171xN的wpli矩阵

% 获取电极数量和患者数量
num_electrodes = size(indices, 1);
num_patients = size(wpli_values, 2);

% 初始化一个空的 cell 数组，用于存储每个电极的均值、标准差和名称
mean_std_wpli = cell(num_electrodes, 3);

% 遍历每个电极的索引数组
for i = 1:num_electrodes
    % 获取当前电极的名称和索引数组
    current_electrode_name = indices{i, 1};
    electrode_indices = indices{i, 2};
    
    % 存储电极名称
    mean_std_wpli{i, 1} = current_electrode_name;
    
    % 提取当前电极的所有患者的 WPLI 值
    all_patients_wpli = wpli_values(electrode_indices, :);
    
    % 展平数组以包含所有患者的所有样本的 WPLI 值
    all_patients_wpli_flat = all_patients_wpli(:);
    
    % 计算当前电极的 WPLI 均值
    electrode_mean_wpli = mean(all_patients_wpli_flat);
    
    % 计算当前电极的 WPLI 标准差
    electrode_std_wpli = std(all_patients_wpli_flat);
    
    % 存储均值和标准差
    mean_std_wpli{i, 2} = electrode_mean_wpli;
    mean_std_wpli{i, 3} = electrode_std_wpli;
end

% 显示结果
for i = 1:num_electrodes
    disp(['电极名称： ' mean_std_wpli{i, 1}]);
    disp('电极的 WPLI 均值：');
    disp(mean_std_wpli{i, 2});%注意mean_std_wpli两列，一列均值，一列标准差。
    disp('电极的 WPLI 标准差：');
    disp(mean_std_wpli{i, 3});
end

% 保存结果
save('mean_std_wpli_poor_alpha.mat', 'mean_std_wpli'); % 保存结果到文件
