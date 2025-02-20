% 计算第一组数据的AUC
auc1 = trapz(fpr1, tpr1);

% 计算第二组数据的AUC
auc2 = trapz(fpr2, tpr2);

% 创建一个正方形的图形窗口
figure('Units', 'pixels', 'Position', [100, 100, 500, 500]);

% 画ROC曲线
plot(fpr1, tpr1, 'r-', 'LineWidth', 2); % 绘制第一组曲线，使用红色
hold on;
plot(fpr2, tpr2, 'g-', 'LineWidth', 2); % 绘制第二组曲线，使用绿色
plot([0, 1], [0, 1], 'k--', 'LineWidth', 1); % 对角线表示随机分类的预测效果
xlabel('False Positive Rate (FPR)');
ylabel('True Positive Rate (TPR)');

% 设置Y轴显示范围
ylim([-0.1, 1.1]);
xlim([-0.1, 1.1]);

grid on;

% 设置坐标轴的位置，使其填满整个 figure，从而确保绘制出的图是正方形的
set(gca, 'Position', [0.1 0.1 0.8 0.8]);

% 添加legend，显示两组数据的AUC值
legend(['AUC1 = ', num2str(auc1)], ['AUC2 = ', num2str(auc2)], 'Chance Level', 'Location', 'southeast');

title('Receiver Operating Characteristic (ROC) Curve');
hold off;
