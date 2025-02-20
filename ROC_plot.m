
% 计算AUC
auc = trapz(fpr, tpr);

% 画ROC曲线
figure;
plot(fpr, tpr, 'm-', 'LineWidth', 2);
hold on;
plot([0, 1], [0, 1], 'k--', 'LineWidth', 1); % 对角线
xlabel('False Positive Rate (FPR)');
ylabel('True Positive Rate (TPR)');

% 设置Y轴显示范围
ylim([-0.1, 1.1]);
xlim([-0.1, 1.1]);

grid on;

% 添加legend，仅显示AUC值
legend(['AUC = ', num2str(auc)], 'Location', 'southeast');

title('Receiver Operating Characteristic (ROC) Curve');
hold off;

