clear;clc;
%% set parameter 
message_group = [0 255 101 154 128 127];
file_name  = 'F:\浙大交流课件\信息安全与数字水印\数字水印实验\std_test_images\bank.png';
tao = 0.65;

%% set 2000 watermark
for alpha = [0 2]
%alpha = 2;
%for message = message_group
message = 255;
    for i = 1:1000
    [c wr] = E_BLK_8(file_name,alpha,message);   
    Z_lc(i) = D_BLK_8(c,wr,12);
    end
    ecdf(Z_lc);
    hold on;
end