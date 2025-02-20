%% 按照各个频段数值大小来判定需要什么单位
addpath '/Users/mingwenjie/My Document/Matlab/MATLAB tools/fieldtrip/fieldtrip-20210311/'
ft_defaults

%% making a "fake TFRhann variable

%Percentage
TFRhann.powspctrm = TFR_all_side_corrected_percentage;
TFRhann.label = TFRhann.label(1:19);
label = load ('/Users/mingwenjie/My Document/Matlab/label.mat');
label=label.label;%从任意患者中load TFRhann，提取label
TFRhann.time = TFRhann.time(1:size(TFR_all_side_corrected_percentage,3));

% %Absolute
% TFRhann.powspctrm = TFR_all_side_corrected;
% TFRhann.label = TFRhann.label(1:19);
% TFRhann.time = TFRhann.time(1:size(TFR_all_side_corrected,3));

%每个频段单独看刻度到底选多少，
%% Delta-----------band
cfg = [];
% cfg.xlim = [0.9 1.3];
cfg.ylim = [1 4];
cfg.zlim = [500 4000];
% cfg.baseline = [-0.5 -0.1];
% cfg.baselinetype = 'absolute';
cfg.layout = 'ZEYY_21.mat';
figure;
% 设置整个图片坐标轴的位置和大小
set(gca, 'Position', [-0.09, 0, 1.0, 1.0]);

ft_topoplotTFR(cfg, TFRhann); 

% 显示 colorbar及其坐标位置
h = colorbar;
set(h,'Location', 'east', 'Position', [0.83, 0.1, 0.03, 0.8]); % 调整 'Position' 参数

% 设置 colorbar 的刻度
ticks = [500 4000];
set(h, 'Ticks', ticks);

% % 设置刻度标签格式，保留两位小数
 tickLabels = arrayfun(@(x) sprintf('%.2f', x), ticks, 'UniformOutput', false);
set(h, 'TickLabels', tickLabels);

% 设置刻度字体大小
set(h, 'FontSize', 25); % 这里的数字可以根据需要调整

% 设置 colorbar 刻度的格式
xtickformat('%.2f');  % 或者 ytickformat('%.2f');
% title('Delta');
%% Theta------------band
cfg = [];
% cfg.xlim = [0.9 1.3];
cfg.ylim = [4 8];
cfg.zlim = [0.02 0.04];
% cfg.baseline = [-0.5 -0.1];
% cfg.baselinetype = 'absolute';
cfg.layout = 'ZEYY_21.mat';
figure;
% 设置整个图片坐标轴的位置和大小
set(gca, 'Position', [-0.09, 0, 1.0, 1.0]);

ft_topoplotTFR(cfg, TFRhann); 

% 显示 colorbar及其坐标位置
h = colorbar;
set(h,'Location', 'east', 'Position', [0.83, 0.1, 0.03, 0.8]); % 调整 'Position' 参数

% 设置 colorbar 的刻度
ticks = [0.02 0.04];
set(h, 'Ticks', ticks);

% % 设置刻度标签格式，保留两位小数
 tickLabels = arrayfun(@(x) sprintf('%.2f', x), ticks, 'UniformOutput', false);
set(h, 'TickLabels', tickLabels);

% 设置刻度字体大小
set(h, 'FontSize', 25); % 这里的数字可以根据需要调整

% 设置 colorbar 刻度的格式
xtickformat('%.2f');  % 或者 ytickformat('%.2f');
% title('Delta');

%% Alpha-----------band
cfg = [];
% cfg.xlim = [0.9 1.3];
cfg.ylim = [8 12];
cfg.zlim = [0.01 0.04];
% cfg.baseline = [-0.5 -0.1];
% cfg.baselinetype = 'absolute';
cfg.layout = 'ZEYY_21.mat';
figure;
% 设置整个图片坐标轴的位置和大小
set(gca, 'Position', [-0.09, 0, 1.0, 1.0]);

ft_topoplotTFR(cfg, TFRhann); 

% 显示 colorbar及其坐标位置
h = colorbar;
set(h,'Location', 'east', 'Position', [0.83, 0.1, 0.03, 0.8]); % 调整 'Position' 参数

% 设置 colorbar 的刻度
ticks = [0.01 0.04];
set(h, 'Ticks', ticks);

% % 设置刻度标签格式，保留两位小数
 tickLabels = arrayfun(@(x) sprintf('%.2f', x), ticks, 'UniformOutput', false);
set(h, 'TickLabels', tickLabels);

% 设置刻度字体大小
set(h, 'FontSize', 25); % 这里的数字可以根据需要调整

% 设置 colorbar 刻度的格式
xtickformat('%.2f');  % 或者 ytickformat('%.2f');
% title('Delta');

%% Beta-----------band
cfg = [];
% cfg.xlim = [0.9 1.3];
cfg.ylim = [12 30];
cfg.zlim = [4e-3 9e-3];
% cfg.baseline = [-0.5 -0.1];
% cfg.baselinetype = 'absolute';
cfg.layout = 'ZEYY_21.mat';
figure;
% 设置整个图片坐标轴的位置和大小
set(gca, 'Position', [-0.09, 0, 1.0, 1.0]);

ft_topoplotTFR(cfg, TFRhann); 

% 显示 colorbar及其坐标位置
h = colorbar;
set(h,'Location', 'east', 'Position', [0.83, 0.1, 0.03, 0.8]); % 调整 'Position' 参数

% 设置 colorbar 的刻度
ticks = [4e-3 9e-3];
set(h, 'Ticks', ticks);

% % 设置刻度标签格式，保留两位小数
 tickLabels = arrayfun(@(x) sprintf('%.0e', x), ticks, 'UniformOutput', false);
set(h, 'TickLabels', tickLabels);

% 设置刻度字体大小
set(h, 'FontSize', 25); % 这里的数字可以根据需要调整

% 设置 colorbar 刻度的格式
xtickformat('%.0e');  % 或者 ytickformat('%.2f');
% title('Delta');

%% Gamma-----------band
cfg = [];
% cfg.xlim = [0.9 1.3];
cfg.ylim = [30 100];
cfg.zlim = [1e-5 9e-5];
% cfg.baseline = [-0.5 -0.1];
% cfg.baselinetype = 'absolute';
cfg.layout = 'ZEYY_21.mat';
figure;
% subplot(2,3,1);
ft_topoplotTFR(cfg, TFRhann); 

% 显示 colorbar
h = colorbar;

% 设置 colorbar 的刻度
ticks = [1.0e-5, 9.0e-5];
set(h, 'Ticks', ticks);

% % 设置刻度标签格式，保留两位小数
 tickLabels = arrayfun(@(x) sprintf('%.0e', x), ticks, 'UniformOutput', false);
set(h, 'TickLabels', tickLabels);

% 设置刻度字体大小
set(h, 'FontSize', 20); % 这里的数字可以根据需要调整

% 设置 colorbar 刻度的格式
xtickformat('%.0e');  % 或者 ytickformat('%.2f');
% title('Gamma');

