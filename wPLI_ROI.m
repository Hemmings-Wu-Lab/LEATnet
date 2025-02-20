% 假设 indices 是一个 19x2 的 cell 数组，每行包含一个电极名称和对应的索引数组
% 假设 wpli_values 是一个 171x1 的数组，每行包含一个样本的所有电极的 WPLI 值

% 初始化一个空的单元数组，用于存储每个电极的均值和名称

% wpli_values指的是某个电极对应的wpli值所处的位置，在171个值中的序号
wpli_values = alpha_group_wpli % 提取group或者某个患者的171X1的wpli矩阵;

% load indices.mat;
load indices.mat;

mean_wpli = cell(size(indices, 1), 2);

% 遍历每个电极的索引数组
for i = 1:size(indices, 1)
    % 获取当前电极的名称和索引数组
    current_electrode_name = indices{i, 1};
    electrode_indices = indices{i, 2};
    
    % 提取当前电极的所有样本的 WPLI 值
    electrode_wpli = wpli_values(electrode_indices);
    
    % 计算当前电极的 WPLI 均值
    electrode_mean_wpli = mean(electrode_wpli);
    
    % 存储结果
    mean_wpli{i, 1} = current_electrode_name;
    mean_wpli{i, 2} = electrode_mean_wpli;
end

% 显示结果
for i = 1:length(mean_wpli)
    disp(['电极名称： ' mean_wpli{i, 1}]);
    disp(['电极的 WPLI 均值：']);
    disp(mean_wpli{i, 2});
end

% 保存结果
save('mean_wpli_poor_alpha.mat', 'mean_wpli');%mean_wpli_poor_beta/theta/delta/gamma.mat
