%----------------------------system one-----------------------------------%
clc;clear;
file_name = 'F:\浙大交流课件\信息安全与数字水印\数字水印实验\std_test_images\bank.png';
c0 = imread(file_name);
fn = 0;
fp = 0;
% add 2000 different watermarks to 1 picture
alpha = 1;
m = 0;
Z_lc = test(c0,alpha,m,2000);
ksdensity(Z_lc);
hold on
% add 2000 different watermarks to 1 picture
alpha = 1;
m = 1;
Z_lc = test(c0,alpha,m,2000);
ksdensity(Z_lc);
% add 0 different watermarks to 1 picture
alpha = 0;
m = 0;
Z_lc = test(c0,alpha,m,2000);
ksdensity(Z_lc);