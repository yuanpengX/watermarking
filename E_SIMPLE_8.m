%----------------set parameter--------------------------------------------%
clear;clc;
hold on
%get image list
file_path = 'F:\浙大交流课件\信息安全与数字水印\数字水印实验\std_test_images\';
file_list = dir(strcat(file_path,'*.png'));
numofpic = length(file_list);
%set parameter
alpha = 2;
%set message to be added 
m = 43;
message_length = 8;
message = conv_message(m,message_length);
%----------------main part------------------------------------------------%
wrong_num = 0;
for pic = 1:numofpic
    %get picture
            file_name = strcat(file_path,file_list(pic).name);
            [c0,row,col] = get_picture(file_name);
            N = row*col;
            %generate watermarking
            wr = watermark_generate(row,col,message_length);  %            
            %E_blind
            c = add_common_watermark(c0,wr,message,message_length,alpha);
            %D_LC      
            [Z_lc,message_restore]= mycorrelation(c,wr,message_length);            
            %fprintf('message is %d, message_restore is : %d\n',m,message_restore);
            if(message_restore~=m)
                wrong_num = wrong_num+1;
            end
end
fprintf('there are %d case(s) went wrong in %d case(s)\n',wrong_num,numofpic);