% %% Extract Global power
% clear 
% clc
% Load TFR_all_side_corrected_percentage first

mean_all_side_corrected = mean(TFR_all_side_corrected_percentage, 3);
std_all_side_corrected = std(TFR_all_side_corrected_percentage, 0, 3);

mean_global = sum(mean_all_side_corrected);
std_global = sum(std_all_side_corrected);

% delta
mean_global_delta = sum(mean_global(1:4));
std_global_delta = sum(std_global(1:4));

% theta
mean_global_theta = sum(mean_global(4:8));
std_global_theta = sum(std_global(4:8));

% alpha
mean_global_alpha = sum(mean_global(8:12));
std_global_alpha = sum(std_global(8:12));

% beta
mean_global_beta = sum(mean_global(12:30));
std_global_beta = sum(std_global(12:30));

% gamma
mean_global_gamma = sum(mean_global(30:100));
std_global_gamma = sum(std_global(30:100));

%% Extract hemisphere power

% Load TFR_all_side_corrected_percentage first

mean_all_side_corrected = mean(TFR_all_side_corrected_percentage, 3);
std_all_side_corrected = std(TFR_all_side_corrected_percentage, 0, 3);

mean_left = sum(mean_all_side_corrected(1:8, :));
std_left = sum(std_all_side_corrected(1:8, :));
mean_right = sum(mean_all_side_corrected(9:16, :));
std_right = sum(std_all_side_corrected(9:16, :));

% delta
mean_left_delta = sum(mean_left(1:4));
std_left_delta = sum(std_left(1:4));
mean_right_delta = sum(mean_right(1:4));
std_right_delta = sum(std_right(1:4));

% theta
mean_left_theta = sum(mean_left(4:8));
std_left_theta = sum(std_left(4:8));
mean_right_theta = sum(mean_right(4:8));
std_right_theta = sum(std_right(4:8));

% alpha
mean_left_alpha = sum(mean_left(8:12));
std_left_alpha = sum(std_left(8:12));
mean_right_alpha = sum(mean_right(8:12));
std_right_alpha = sum(std_right(8:12));

% beta
mean_left_beta = sum(mean_left(12:30));
std_left_beta = sum(std_left(12:30));
mean_right_beta = sum(mean_right(12:30));
std_right_beta = sum(std_right(12:30));

% gamma
mean_left_gamma = sum(mean_left(30:100));
std_left_gamma = sum(std_left(30:100));
mean_right_gamma = sum(mean_right(30:100));
std_right_gamma = sum(std_right(30:100));

%% Extract lobe power

% Load TFR_all_side_corrected_percentage first

mean_all_side_corrected = mean(TFR_all_side_corrected_percentage, 3);
std_all_side_corrected = std(TFR_all_side_corrected_percentage, 0, 3);

mean_LF = sum(mean_all_side_corrected(1:3, :));
std_LF = sum(std_all_side_corrected(1:3, :));
mean_LT = sum(mean_all_side_corrected(4:5, :));
std_LT = sum(std_all_side_corrected(4:5, :));
mean_LPO = sum(mean_all_side_corrected(6:7, :));
std_LPO = sum(std_all_side_corrected(6:7, :));

mean_RF = sum(mean_all_side_corrected(9:11, :));
std_RF = sum(std_all_side_corrected(9:11, :));
mean_RT = sum(mean_all_side_corrected(12:13, :));
std_RT = sum(std_all_side_corrected(12:13, :));
mean_RPO = sum(mean_all_side_corrected(14:15, :));
std_RPO = sum(std_all_side_corrected(14:15, :));

mean_CZ = mean_all_side_corrected(8, :) + sum(mean_all_side_corrected(16:19, :));
std_CZ = std_all_side_corrected(8, :) + sum(std_all_side_corrected(16:19, :));

% delta
mean_LF_delta = sum(mean_LF(1:4));
std_LF_delta = sum(std_LF(1:4));
mean_LT_delta = sum(mean_LT(1:4));
std_LT_delta = sum(std_LT(1:4));
mean_LPO_delta = sum(mean_LPO(1:4));
std_LPO_delta = sum(std_LPO(1:4));

mean_RF_delta = sum(mean_RF(1:4));
std_RF_delta = sum(std_RF(1:4));
mean_RT_delta = sum(mean_RT(1:4));
std_RT_delta = sum(std_RT(1:4));
mean_RPO_delta = sum(mean_RPO(1:4));
std_RPO_delta = sum(std_RPO(1:4));

mean_CZ_delta = sum(mean_CZ(1:4));
std_CZ_delta = sum(std_CZ(1:4));

% theta
mean_LF_theta = sum(mean_LF(4:8));
std_LF_theta = sum(std_LF(4:8));
mean_LT_theta = sum(mean_LT(4:8));
std_LT_theta = sum(std_LT(4:8));
mean_LPO_theta = sum(mean_LPO(4:8));
std_LPO_theta = sum(std_LPO(4:8));

mean_RF_theta = sum(mean_RF(4:8));
std_RF_theta = sum(std_RF(4:8));
mean_RT_theta = sum(mean_RT(4:8));
std_RT_theta = sum(std_RT(4:8));
mean_RPO_theta = sum(mean_RPO(4:8));
std_RPO_theta = sum(std_RPO(4:8));

mean_CZ_theta = sum(mean_CZ(4:8));
std_CZ_theta = sum(std_CZ(4:8));

% alpha
mean_LF_alpha = sum(mean_LF(8:12));
std_LF_alpha = sum(std_LF(8:12));
mean_LT_alpha = sum(mean_LT(8:12));
std_LT_alpha = sum(std_LT(8:12));
mean_LPO_alpha = sum(mean_LPO(8:12));
std_LPO_alpha = sum(std_LPO(8:12));

mean_RF_alpha = sum(mean_RF(8:12));
std_RF_alpha = sum(std_RF(8:12));
mean_RT_alpha = sum(mean_RT(8:12));
std_RT_alpha = sum(std_RT(8:12));
mean_RPO_alpha = sum(mean_RPO(8:12));
std_RPO_alpha = sum(std_RPO(8:12));

mean_CZ_alpha = sum(mean_CZ(8:12));
std_CZ_alpha = sum(std_CZ(8:12));

% beta
mean_LF_beta = sum(mean_LF(12:30));
std_LF_beta = sum(std_LF(12:30));
mean_LT_beta = sum(mean_LT(12:30));
std_LT_beta = sum(std_LT(12:30));
mean_LPO_beta = sum(mean_LPO(12:30));
std_LPO_beta = sum(std_LPO(12:30));

mean_RF_beta = sum(mean_RF(12:30));
std_RF_beta = sum(std_RF(12:30));
mean_RT_beta = sum(mean_RT(12:30));
std_RT_beta = sum(std_RT(12:30));
mean_RPO_beta = sum(mean_RPO(12:30));
std_RPO_beta = sum(std_RPO(12:30));

mean_CZ_beta = sum(mean_CZ(12:30));
std_CZ_beta = sum(std_CZ(12:30));

% gamma
mean_LF_gamma = sum(mean_LF(30:100));
std_LF_gamma = sum(std_LF(30:100));
mean_LT_gamma = sum(mean_LT(30:100));
std_LT_gamma = sum(std_LT(30:100));
mean_LPO_gamma = sum(mean_LPO(30:100));
std_LPO_gamma = sum(std_LPO(30:100));

mean_RF_gamma = sum(mean_RF(30:100));
std_RF_gamma = sum(std_RF(30:100));
mean_RT_gamma = sum(mean_RT(30:100));
std_RT_gamma = sum(std_RT(30:100));
mean_RPO_gamma = sum(mean_RPO(30:100));
std_RPO_gamma = sum(std_RPO(30:100));

mean_CZ_gamma = sum(mean_CZ(30:100));
std_CZ_gamma = sum(std_CZ(30:100));

% Save the data
save band_power_percentage.mat
