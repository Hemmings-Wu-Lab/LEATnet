
load 'wpli_all.mat';
%单个患者wpli
delta_person_wpli = mean(wpli_all(:,1:4,:),2);
theta_person_wpli = mean(wpli_all(:,4:8,:),2);
alpha_person_wpli = mean(wpli_all(:,8:12,:),2);
beta_person_wpli = mean(wpli_all(:,12:30,:),2);
gamma_person_wpli = mean(wpli_all(:,30:100,:),2);


% % 所有患者的wpli
% delta_person_wpli = mean(mean(wpli_all(:,1:4,:),2),3);
% theta_person_wpli = mean(mean(wpli_all(:,4:8,:),2),3);
% alpha_person_wpli = mean(mean(wpli_all(:,8:12,:),2),3);
% beta_person_wpli = mean(mean(wpli_all(:,12:30,:),2),3);
% gamma_person_wpli = mean(mean(wpli_all(:,30:100,:),2),3);


% 计算数组中负数的数量
detla_num_negatives = sum(delta_person_wpli(:) < 0);
disp(['delta中负数的数量为：', num2str(detla_num_negatives)]);

theta_num_negatives = sum(theta_person_wpli(:) < 0);
disp(['theta中负数的数量为：', num2str(theta_num_negatives)]);

alpha_num_negatives = sum(alpha_person_wpli(:) < 0);
disp(['alpha中负数的数量为：', num2str(alpha_num_negatives)]);

beta_num_negatives = sum(beta_person_wpli(:) < 0);
disp(['beta中负数的数量为：', num2str(beta_num_negatives)]);

gamma_num_negatives = sum(gamma_person_wpli(:) < 0);
disp(['gamma中负数的数量为：', num2str(gamma_num_negatives)]);
