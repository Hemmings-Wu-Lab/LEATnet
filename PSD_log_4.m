%% 按照各个频段数值大小来判定需要什么单位
addpath '/Users/mingwenjie/My Document/Matlab/MATLAB tools/fieldtrip/fieldtrip-20210311/'
ft_defaults

%% making a "fake TFRhann variable
% load TFR_all_side_corrected.mat
%Percentage
TFRhann.powspctrm = TFR_all_side_corrected;
TFRhann.label = TFRhann.label(1:19);
label = load ('/Users/mingwenjie/My Document/Matlab/label.mat');
label=label.label;%从任意患者中load TFRhann，提取label
TFRhann.time = TFRhann.time(1:size(TFR_all_side_corrected,3));

% %Absolute
% TFRhann.powspctrm = TFR_all_side_corrected;
% TFRhann.label = TFRhann.label(1:19);
% TFRhann.time = TFRhann.time(1:size(TFR_all_side_corrected,3));

%每个频段单独看刻度到底选多少，
%% Delta-----------band
cfg = [];
cfg.ylim = [1 4];
cfg.zlim = [400,4000];
cfg.layout = 'ZEYY_21.mat';
cfg.colormap = '*RdBu';
figure;
set(gca, 'Position', [-0.09, 0, 1.0, 1.0]);
h = ft_topoplotTFR(cfg, TFRhann);
colorbar;
% 获取color bar对象
h_cb = findobj(gcf, 'Type', 'ColorBar');
set(h_cb,'Location', 'east', 'Position', [0.83, 0.1, 0.03, 0.8]); % 调整 'Position' 参数

% 获取color bar的刻度
ticks = h_cb.Ticks;

% 对刻度进行对数转换并将PSD转换为dB单位刻度:公式为dB = 10*log10(PSD) 
logTicks = 10*log10(ticks);

% % 设置刻度标签格式，仅显示log值
 tickLabels = arrayfun(@(x) sprintf('%.1f', x), logTicks, 'UniformOutput', false);
 set(h_cb, 'TickLabels', tickLabels);

% 设置刻度字体大小
set(h_cb, 'FontSize',40); % 这里的数字可以根据需要调整
% title('Delta');
%% Theta------------band
cfg = [];
cfg.ylim = [4 8];
cfg.zlim = [24,500];
cfg.layout = 'ZEYY_21.mat';
cfg.colormap = '*RdBu';
figure;
set(gca, 'Position', [-0.09, 0, 1.0, 1.0]);
h = ft_topoplotTFR(cfg, TFRhann);
colorbar;
% 获取color bar对象
h_cb = findobj(gcf, 'Type', 'ColorBar');
set(h_cb,'Location', 'east', 'Position', [0.83, 0.1, 0.03, 0.8]); % 调整 'Position' 参数

% 获取color bar的刻度
ticks = h_cb.Ticks;

% 对刻度进行对数转换并将PSD转换为dB单位刻度:公式为dB = 10*log10(PSD) 
logTicks = 10*log10(ticks);

% % 设置刻度标签格式，仅显示log值
 tickLabels = arrayfun(@(x) sprintf('%.1f', x), logTicks, 'UniformOutput', false);
 set(h_cb, 'TickLabels', tickLabels);

% 设置刻度字体大小
set(h_cb, 'FontSize',40); % 这里的数字可以根据需要调整

% title('Theta');

%% Alpha-----------band
cfg = [];
cfg.ylim = [8 12];
cfg.zlim = [15,150];
cfg.layout = 'ZEYY_21.mat';
cfg.colormap = '*RdBu';
figure;
set(gca, 'Position', [-0.09, 0, 1.0, 1.0]);
h = ft_topoplotTFR(cfg, TFRhann);
colorbar;
% 获取color bar对象
h_cb = findobj(gcf, 'Type', 'ColorBar');
set(h_cb,'Location', 'east', 'Position', [0.83, 0.1, 0.03, 0.8]); % 调整 'Position' 参数

% 获取color bar的刻度
ticks = h_cb.Ticks;

% 对刻度进行对数转换并将PSD转换为dB单位刻度:公式为dB = 10*log10(PSD) 
logTicks = 10*log10(ticks);

% % 设置刻度标签格式，仅显示log值
 tickLabels = arrayfun(@(x) sprintf('%.1f', x), logTicks, 'UniformOutput', false);
 set(h_cb, 'TickLabels', tickLabels);

% 设置刻度字体大小
set(h_cb, 'FontSize',40); % 这里的数字可以根据需要调整

% title('Alpha');

%% Beta-----------band
cfg = [];
cfg.ylim = [12 30];
cfg.zlim = [2,100];
% cfg.zlim = [20,60];
cfg.layout = 'ZEYY_21.mat';
cfg.colormap = '*RdBu';
figure;
set(gca, 'Position', [-0.09, 0, 1.0, 1.0]);
h = ft_topoplotTFR(cfg, TFRhann);
colorbar;
% 获取color bar对象
h_cb = findobj(gcf, 'Type', 'ColorBar');
set(h_cb,'Location', 'east', 'Position', [0.83, 0.1, 0.03, 0.8]); % 调整 'Position' 参数

% 获取color bar的刻度
ticks = h_cb.Ticks;

% 对刻度进行对数转换并将PSD转换为dB单位刻度:公式为dB = 10*log10(PSD) 
logTicks = 10*log10(ticks);

% % 设置刻度标签格式，仅显示log值
 tickLabels = arrayfun(@(x) sprintf('%.1f', x), logTicks, 'UniformOutput', false);
 set(h_cb, 'TickLabels', tickLabels);

% 设置刻度字体大小
set(h_cb, 'FontSize',40); % 这里的数字可以根据需要调整

% title('Beta');

%% Gamma-----------band
cfg = [];
cfg.ylim = [30 100];
cfg.zlim = [0.3,10];
% cfg.zlim = [1.1,5];
cfg.layout = 'ZEYY_21.mat';
cfg.colormap = '*RdBu';
figure;
set(gca, 'Position', [-0.09, 0, 1.0, 1.0]);
h = ft_topoplotTFR(cfg, TFRhann);
colorbar;
% 获取color bar对象
h_cb = findobj(gcf, 'Type', 'ColorBar');
set(h_cb,'Location', 'east', 'Position', [0.83, 0.1, 0.03, 0.8]); % 调整 'Position' 参数

% 获取color bar的刻度
ticks = h_cb.Ticks;

% 对刻度进行对数转换并将PSD转换为dB单位刻度:公式为dB = 10*log10(PSD) 
logTicks = 10*log10(ticks);

% % 设置刻度标签格式，仅显示log值
 tickLabels = arrayfun(@(x) sprintf('%.1f', x), logTicks, 'UniformOutput', false);
 set(h_cb, 'TickLabels', tickLabels);

% 设置刻度字体大小
set(h_cb, 'FontSize',40); % 这里的数字可以根据需要调整

% title('Gamma');

%% Gamma-----------gloabl
cfg = [];
cfg.ylim = [1 100];
cfg.zlim = [12,220];
% cfg.zlim = [1.1,5];
cfg.layout = 'ZEYY_21.mat';
cfg.colormap = '*RdBu';
figure;
set(gca, 'Position', [-0.09, 0, 1.0, 1.0]);
h = ft_topoplotTFR(cfg, TFRhann);
colorbar;
% 获取color bar对象
h_cb = findobj(gcf, 'Type', 'ColorBar');
set(h_cb,'Location', 'east', 'Position', [0.83, 0.1, 0.03, 0.8]); % 调整 'Position' 参数

% 获取color bar的刻度
ticks = h_cb.Ticks;

% 对刻度进行对数转换并将PSD转换为dB单位刻度:公式为dB = 10*log10(PSD) 
logTicks = 10*log10(ticks);

% % 设置刻度标签格式，仅显示log值
 tickLabels = arrayfun(@(x) sprintf('%.1f', x), logTicks, 'UniformOutput', false);
 set(h_cb, 'TickLabels', tickLabels);

% 设置刻度字体大小
set(h_cb, 'FontSize',40); % 这里的数字可以根据需要调整

% title('Global');