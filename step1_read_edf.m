%第一步：导入edf数据

clear
clc

folderlist = dir; %展示当前文件夹里的内容，包括文件名，日期，路径，字节等
folderlist = {folderlist(:).name}; % 展示调用文件名

for i = 4:length(folderlist) %注意文件夹的个数从第几个开始有效文件名
    
    cd(folderlist{i})  %进入到第几个文件夹
    
restoredefaultpath  % 恢复默认路径
clearvars -except folderlist   %清除folderlist之外的所有变量

%% load edf (biologic)

flist = dir('*.edf');  %只展示 ".edf" 格式的文件夹内容
flist = struct2cell(flist);  %展示文件内容
flist = flist(1,:);  %选择文件名，调用第一行的所有列

%% read edf via eeglab   通过eeglab抓取脑电信号

addpath(genpath('/Users/mingwenjie/My Document/Matlab/MATLAB tools/eeglab/eeglab2019_1'))

n = size(flist,2); %flist 里面有多少列；size（flist,1）表示有多少行。

for i = 1:n
    [tempdataeeglab{i},tempheadereeglab(i)] = readedf(flist{i});
    fs = tempheadereeglab(1).samplerate(1);
    temptimeeeglab{i} = 0:1/fs:((length(tempdataeeglab{i})-1)/fs);
end

restoredefaultpath

%% parse edf into fieldtrip format
addpath '/Users/mingwenjie/My Document/Matlab/MATLAB tools/fieldtrip/fieldtrip-20210311/'
ft_defaults

cfg            = [];
cfg.continuous = 'yes';
cfg.channel    = 'all';
cfg.dataset = flist{1};
data = ft_preprocessing(cfg); %just setting up a template for ft

for i = 1:n
    data.trial{i} = tempdataeeglab{i};
    data.time{i} = temptimeeeglab{i};
end

save data.mat data  %得出每个患者的时间信号序列

%clc
%clearvars -except data

cd('../')

end
