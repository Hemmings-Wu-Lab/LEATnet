%先创造五个频段矩阵，后从excel中导入171x1的wpli矩阵，创造相对矩阵
Delta=[];Theta=[];Alpha=[];Beta=[];Gamma=[];gloabl = [];
%从excel中导入171x1的wpli矩阵
delta_brainnet_data = [];
delta_mean_wpli = mean(mean(wpli_all,3),2); %可替换delta；theta；beta；alpha;global
for i = 1:19
delta_brainnet_data(i,i) = 0;
end
delta_brainnet_data(2:19,1) = delta_mean_wpli(1:18);
delta_brainnet_data(3:19,2) = delta_mean_wpli(19:35);
delta_brainnet_data(4:19,3) = delta_mean_wpli(36:51);
delta_brainnet_data(5:19,4) = delta_mean_wpli(52:66);
delta_brainnet_data(6:19,5) = delta_mean_wpli(67:80);
delta_brainnet_data(7:19,6) = delta_mean_wpli(81:93);
delta_brainnet_data(8:19,7) = delta_mean_wpli(94:105);
delta_brainnet_data(9:19,8) = delta_mean_wpli(106:116);
delta_brainnet_data(10:19,9) = delta_mean_wpli(117:126);
delta_brainnet_data(11:19,10) = delta_mean_wpli(127:135);
delta_brainnet_data(12:19,11) = delta_mean_wpli(136:143);
delta_brainnet_data(13:19,12) = delta_mean_wpli(144:150);
delta_brainnet_data(14:19,13) = delta_mean_wpli(151:156);
delta_brainnet_data(15:19,14) = delta_mean_wpli(157:161);
delta_brainnet_data(16:19,15) = delta_mean_wpli(162:165);
delta_brainnet_data(17:19,16) = delta_mean_wpli(166:168);
delta_brainnet_data(18:19,17) = delta_mean_wpli(169:170);
delta_brainnet_data(19,18) = delta_mean_wpli(171);

delta_brainnet_data(1,2:19) = delta_mean_wpli(1:18);
delta_brainnet_data(2,3:19) = delta_mean_wpli(19:35);
delta_brainnet_data(3,4:19) = delta_mean_wpli(36:51);
delta_brainnet_data(4,5:19) = delta_mean_wpli(52:66);
delta_brainnet_data(5,6:19) = delta_mean_wpli(67:80);
delta_brainnet_data(6,7:19) = delta_mean_wpli(81:93);
delta_brainnet_data(7,8:19) = delta_mean_wpli(94:105);
delta_brainnet_data(8,9:19) = delta_mean_wpli(106:116);
delta_brainnet_data(9,10:19) = delta_mean_wpli(117:126);
delta_brainnet_data(10,11:19) = delta_mean_wpli(127:135);
delta_brainnet_data(11,12:19) = delta_mean_wpli(136:143);
delta_brainnet_data(12,13:19) = delta_mean_wpli(144:150);
delta_brainnet_data(13,14:19) = delta_mean_wpli(151:156);
delta_brainnet_data(14,15:19) = delta_mean_wpli(157:161);
delta_brainnet_data(15,16:19) = delta_mean_wpli(162:165);
delta_brainnet_data(16,17:19) = delta_mean_wpli(166:168);
delta_brainnet_data(17,18:19) = delta_mean_wpli(169:170);
delta_brainnet_data(18,19) = delta_mean_wpli(171);

save global.mat delta_brainnet_data %delta；theta；beta；alpha;global.mat