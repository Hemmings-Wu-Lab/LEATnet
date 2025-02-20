% figure;
figure('Units', 'pixels', 'Position', [100, 100, 500, 500]);

hold on;

% 初始化存储AUC的数组
aucs = zeros(1, length(fprs));  % 存储每个患者的AUC

% 逐个画出44条ROC曲线
for i = 1:length(fprs)
    fpr = fprs{i};  % 获取第i个患者的FPR
    tpr = tprs{i};  % 获取第i个患者的TPR
    aucs(i) = trapz(fpr, tpr);  % 计算AUC
    plot(fpr, tpr, '--b', 'LineWidth', 1.5);  % 绘制ROC曲线，设置为虚线蓝色
end

% 计算AUC均值
mean_auc = mean(aucs);

% 画对角线
plot([0, 1], [0, 1], 'k--', 'LineWidth', 1);  % 对角线保持为黑色虚线

% 设置坐标轴的位置，使其填满整个 figure，从而确保绘制出的图是正方形的
set(gca, 'Position', [0.1 0.1 0.8 0.8]);

% 设置轴标签
xlabel('False Positive Rate (FPR)');
ylabel('True Positive Rate (TPR)');

% 设置轴的显示范围
ylim([-0.1, 1.1]);
xlim([-0.1, 1.1]);

% % 开启网格
% grid on;

% 仅显示AUC的均值
legend(['Mean AUC = ', num2str(mean_auc, '%.3f')], 'Location', 'southeast');

% 设置图表标题
title('ROC Curves for 44 Patients');

% 将坐标轴设置为正方形
% axis equal;  % 使坐标轴比例相同
box on;      % 显示所有四条轴线


%%%%%AV_model

% 计算AUC
auc = trapz(fpr, tpr);

% 画ROC曲线
plot(fpr, tpr, 'r-', 'LineWidth', 2);  % 将线条设置为红色实线
hold on;
plot([0, 1], [0, 1], 'k--', 'LineWidth', 1); % 对角线保持黑色虚线
xlabel('False Positive Rate (FPR)');
ylabel('True Positive Rate (TPR)');

% 设置Y轴显示范围
% ylim([-0.1, 1.1]);
% xlim([-0.1, 1.1]);

% grid on;

% 添加legend，仅显示AUC值
% legend(['AUC = ', num2str(auc)], 'Location', 'southeast');
% 
% % 设置图表标题
% title('Receiver Operating Characteristic (ROC) Curve');

% 设置坐标轴为正方形
axis equal;  % 使坐标轴比例相同
box on;      % 显示所有四条轴线
hold off;