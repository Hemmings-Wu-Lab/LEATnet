clc
clear

files = dir;

% Get a logical vector that tells which is a directory.

dirFlags = [files.isdir]

% Extract only those that are directories.

subFolders = files(dirFlags)

path_33 = '/Users/mingwenjie/My Document/Matlab/Data collection/Label/Label_NK/label_nikhon_33chan.mat';
path_36 = '/Users/mingwenjie/My Document/Matlab/Data collection/Label/Label_NK/label_nikhon_36chan.mat';
path_44 = '/Users/mingwenjie/My Document/Matlab/Data collection/Label/Label_NK/label_nikhon_44chan.mat';

for i = 3:length(subFolders)
    
    cd(subFolders(i,:).name)
    
    load data.mat
    
    if length(data.label) == 33
        temp_data = load(path_33);
        data.label = temp_data.label;
        clear temp_data
    elseif length(data.label) == 36
        temp_data = load(path_36);
        data.label = temp_data.label;
        clear temp_data
    elseif length(data.label) == 44
        temp_data = load(path_44);
        data.label = temp_data.label;
        clear temp_data
    else
        warning('No matching path found for data.label length %d in folder %s',length(data.label),subFolders(i,:).name);
    end %  显示不符合上述label条件的文件夹名字
    
    save data.mat data
      
    cd('../')
end
