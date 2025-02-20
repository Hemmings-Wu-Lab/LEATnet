figure;
hold on;

% 初始化存储AUC的数组
aucs = zeros(1, length(fprs));  % 存储每个患者的AUC

% 逐个画出44条ROC曲线
for i = 1:length(fprs)
    fpr = fprs{i};  % 获取第i个患者的FPR
    tpr = tprs{i};  % 获取第i个患者的TPR
    aucs(i) = trapz(fpr, tpr);  % 计算AUC
    plot(fpr, tpr, 'LineWidth', 1.5);  % 绘制ROC曲线
end

% 计算AUC均值
mean_auc = mean(aucs);

% 画对角线
plot([0, 1], [0, 1], 'k--', 'LineWidth', 1); 

% 设置轴标签
xlabel('False Positive Rate (FPR)');
ylabel('True Positive Rate (TPR)');

% 设置轴的显示范围
ylim([-0.1, 1.1]);
xlim([-0.1, 1.1]);

% 开启网格
grid on;

% 仅显示AUC的均值
legend(['Mean AUC = ', num2str(mean_auc, '%.3f')], 'Location', 'southeast');

% 设置图表标题
title('ROC Curves for 44 Patients');
% hold off;