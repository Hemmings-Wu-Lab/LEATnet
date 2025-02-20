load 'wpli_all.mat';%创造indices
%单个患者wpli
delta_group_wpli = mean(mean(wpli_all(:,1:4,:),3),2);
theta_group_wpli = mean(mean(wpli_all(:,4:8,:),3),2);
alpha_group_wpli = mean(mean(wpli_all(:,8:12,:),3),2);
beta_group_wpli = mean(mean(wpli_all(:,12:30,:),3),2);
gamma_group_wpli = mean(mean(wpli_all(:,30:100,:),3),2);
