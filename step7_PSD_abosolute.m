

%% create folder list, assuming each folder has a data.m file

clear
clc

files = dir;
% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir];
% Extract only those that are directories.
folderlist = files(dirFlags);

addpath '/Users/mingwenjie/My Document/Matlab/MATLAB tools/fieldtrip/fieldtrip-20210311/'
ft_defaults

%% frequency analysis

for i = 3:length(folderlist)

    cd(folderlist(i,:).name)
    
clearvars -except folderlist TFR_all_side_corrected i

load 'TFRhann21-Oct-2023.mat'

TFR_all_side_corrected (:,:,:,i-2) = TFRhann.powspctrm(1:19,:,:);

cd('../')

end

TFR_all_side_corrected = mean(TFR_all_side_corrected,4); 

save TFR_all_side_corrected.mat TFR_all_side_corrected

