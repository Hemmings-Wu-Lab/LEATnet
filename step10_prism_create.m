%Create prism sheet
% clear;clc;
%Load band_power_percentage.mat first 后面数字代表电极个数

LT = [];
LT(1,1) = mean_LT_delta/2;
LT(2,1) = mean_LT_theta/2;
LT(3,1) = mean_LT_alpha/2;
LT(4,1) = mean_LT_beta/2;
LT(5,1) = mean_LT_gamma/2;

LT(1,2) = std_LT_delta/2;
LT(2,2) = std_LT_theta/2;
LT(3,2) = std_LT_alpha/2;
LT(4,2) = std_LT_beta/2;
LT(5,2) = std_LT_gamma/2;

RT = [];
RT(1,1) = mean_RT_delta/2;
RT(2,1) = mean_RT_theta/2;
RT(3,1) = mean_RT_alpha/2;
RT(4,1) = mean_RT_beta/2;
RT(5,1) = mean_RT_gamma/2;

RT(1,2) = std_RT_delta/2;
RT(2,2) = std_RT_theta/2;
RT(3,2) = std_RT_alpha/2;
RT(4,2) = std_RT_beta/2;
RT(5,2) = std_RT_gamma/2;

LF = [];
LF(1,1) = mean_LF_delta/3;
LF(2,1) = mean_LF_theta/3;
LF(3,1) = mean_LF_alpha/3;
LF(4,1) = mean_LF_beta/3;
LF(5,1) = mean_LF_gamma/3;

LF(1,2) = std_LF_delta/3;
LF(2,2) = std_LF_theta/3;
LF(3,2) = std_LF_alpha/3;
LF(4,2) = std_LF_beta/3;
LF(5,2) = std_LF_gamma/3;

RF = [];
RF(1,1) = mean_RF_delta/3;
RF(2,1) = mean_RF_theta/3;
RF(3,1) = mean_RF_alpha/3;
RF(4,1) = mean_RF_beta/3;
RF(5,1) = mean_RF_gamma/3;

RF(1,2) = std_RF_delta/3;
RF(2,2) = std_RF_theta/3;
RF(3,2) = std_RF_alpha/3;
RF(4,2) = std_RF_beta/3;
RF(5,2) = std_RF_gamma/3;

LPO = [];
LPO(1,1) = mean_LPO_delta/2;
LPO(2,1) = mean_LPO_theta/2;
LPO(3,1) = mean_LPO_alpha/2;
LPO(4,1) = mean_LPO_beta/2;
LPO(5,1) = mean_LPO_gamma/2;

LPO(1,2) = std_LPO_delta/2;
LPO(2,2) = std_LPO_theta/2;
LPO(3,2) = std_LPO_alpha/2;
LPO(4,2) = std_LPO_beta/2;
LPO(5,2) = std_LPO_gamma/2;

RPO = [];
RPO(1,1) = mean_RPO_delta/2;
RPO(2,1) = mean_RPO_theta/2;
RPO(3,1) = mean_RPO_alpha/2;
RPO(4,1) = mean_RPO_beta/2;
RPO(5,1) = mean_RPO_gamma/2;

RPO(1,2) = std_RPO_delta/2;
RPO(2,2) = std_RPO_theta/2;
RPO(3,2) = std_RPO_alpha/2;
RPO(4,2) = std_RPO_beta/2;
RPO(5,2) = std_RPO_gamma/2;

CZ = [];
CZ(1,1) = mean_CZ_delta/5;
CZ(2,1) = mean_CZ_theta/5;
CZ(3,1) = mean_CZ_alpha/5;
CZ(4,1) = mean_CZ_beta/5;
CZ(5,1) = mean_CZ_gamma/5;

CZ(1,2) = std_CZ_delta/5;
CZ(2,2) = std_CZ_theta/5;
CZ(3,2) = std_CZ_alpha/5;
CZ(4,2) = std_CZ_beta/5;
CZ(5,2) = std_CZ_gamma/5;

Global = [];
Global(1,1) = mean_global_delta/19;
Global(2,1) = mean_global_theta/19;
Global(3,1) = mean_global_alpha/19;
Global(4,1) = mean_global_beta/19;
Global(5,1) = mean_global_gamma/19;

Global(1,2) = std_global_delta/19;
Global(2,2) = std_global_theta/19;
Global(3,2) = std_global_alpha/19;
Global(4,2) = std_global_beta/19;
Global(5,2) = std_global_gamma/19;

% Hemisphere
% Left_Hemi
Left_Hemi = [];
Left_Hemi(1,1) = mean_left_delta/8;
Left_Hemi(2,1) = mean_left_theta/8;
Left_Hemi(3,1) = mean_left_alpha/8;
Left_Hemi(4,1) = mean_left_beta/8;
Left_Hemi(5,1) = mean_left_gamma/8;

Left_Hemi(1,2) = std_left_delta/8;
Left_Hemi(2,2) = std_left_theta/8;
Left_Hemi(3,2) = std_left_alpha/8;
Left_Hemi(4,2) = std_left_beta/8;
Left_Hemi(5,2) = std_left_gamma/8;


% Right_Hemi
Right_Hemi = [];
Right_Hemi(1,1) = mean_right_delta/8;
Right_Hemi(2,1) = mean_right_theta/8;
Right_Hemi(3,1) = mean_right_alpha/8;
Right_Hemi(4,1) = mean_right_beta/8;
Right_Hemi(5,1) = mean_right_gamma/8;

Right_Hemi(1,2) = std_right_delta/8;
Right_Hemi(2,2) = std_right_theta/8;
Right_Hemi(3,2) = std_right_alpha/8;
Right_Hemi(4,2) = std_right_beta/8;
Right_Hemi(5,2) = std_right_gamma/8;


clearvars -except LT CZ RPO LPO RF LF RT LT Global Left_Hemi Right_Hemi  

save group_ROI_band_power