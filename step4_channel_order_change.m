%% 第四步 更改电极顺序
clc
clear


files = dir;

% Get a logical vector that tells which is a directory.

dirFlags = [files.isdir];

% Extract only those that are directories.

folderlist = files(dirFlags);

for k = 3:length(folderlist)
    
    clearvars -except folderlist k
    
    cd(folderlist(k,:).name)

    channelorder = {'Fp1';'F7';'F3';'T3';'T5';'P3';'O1';'C3';'Fp2';'F8';'F4';'T4';'T6';'P4';'O2';'C4';'Fz';'Cz';'Pz'};

    load 'data_19ch.mat' % load 'data_19ch.mat'

    datanew = data;

    for i = 1:19

        A =data.label;%原始数据的label

        B = channelorder(i);%匹配channelorder的label

        x = find(ismember(A,B,'rows')>0);% x表示从B中每个通道位置寻找在A中的位置序号

        datanew.label(i) = B;

        for j = 1:10 % j = 1:10 有多少tiral就选择多少
 
            datanew.trial{j}(i,:) = data.trial{j}(x,:);%xA中的对应序号的所有数值给B,每个trial都完成一遍

        end

    end

    data = datanew;

    save data_19ch.mat data % save data_19ch.mat data

    cd('../')

end