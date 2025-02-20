
load 'wpli_all.mat';
mean_171 = mean(wpli_all,1);

% Delta
sum_freq_delta= sum(mean_171(:,1:4,:),2);
mean_wpli_delta = mean(sum_freq_delta,3);
std_wpli_delta = std(sum_freq_delta,0,3);

% Theta
sum_freq_theta= sum(mean_171(:,4:8,:),2);
mean_wpli_theta= mean(sum_freq_theta,3);
std_wpli_theta = std(sum_freq_theta,0,3);

% Alpha
sum_freq_alpha= sum(mean_171(:,8:12,:),2);
mean_wpli_alpha = mean(sum_freq_alpha,3);
std_wpli_alpha = std(sum_freq_alpha,0,3);

% Beta
sum_freq_beta= sum(mean_171(:,12:30,:),2);
mean_wpli_beta = mean(sum_freq_beta,3);
std_wpli_beta = std(sum_freq_beta,0,3);

% Gamma
sum_freq_gamma= sum(mean_171(:,30:100,:),2);
mean_wpli_gamma = mean(sum_freq_gamma,3);
std_wpli_gamma = std(sum_freq_gamma,0,3);

