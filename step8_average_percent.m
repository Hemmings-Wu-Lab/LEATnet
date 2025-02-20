% load TFR_all_side_corrected.mat

for i = 1:size(TFR_all_side_corrected,3)
    TFR_all_side_corrected_percentage(:,:,i) = TFR_all_side_corrected(:,:,i);
    for j = 1:19
        TFR_all_side_corrected_percentage(j,:,i) = TFR_all_side_corrected_percentage(j,:,i)/sum(TFR_all_side_corrected_percentage(j,:,i));
    end  %每一个通道的某个/段 能量值除以该段频率能量值的总和
end

save TFR_all_side_corrected_percentage.mat TFR_all_side_corrected_percentage
%将所有患者的绝对能量标准化成百分比