

% 添加混淆矩阵的显示
% 假设你有真实标签和预测标签s
true_labels = [1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0];  % 实际标签
predicted_labels = [0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1];  % 预测标签

% figure for confusion matrix
figure('Units', 'pixels', 'Position', [600, 100, 500, 500]);

% 使用confusionchart函数绘制混淆矩阵
confusionchart(true_labels, predicted_labels);
title('Confusion Matrix');