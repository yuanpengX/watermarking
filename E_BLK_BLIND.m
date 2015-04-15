clear;clc;
hold on
file_path = 'C:\Users\¾õÐÑµÄ³æ\Desktop\std_test_images\';
file_list = dir(strcat(file_path,'*.png'));
numofpic = length(file_list);
%set parameter
fp_rate = 0;
fn_rate = 0;
Z_cc = zeros(numofpic,3);
alpha = 1;
tao = 0.7;
for pic = 1:numofpic
    %get picture
            file_name = strcat(file_path,file_list(pic).name);
            [c0,row,col] = get_picture(file_name);
            N = row*col;
            %generate watermarking
            wr = watermark_generate(8,8,1);
            num_0 = 1; %calculate watermaring 
            for m = 0:1
                message = m;
                message_length = 1;
                wa = generate_wa(wr,message,message_length,alpha);
                c = add_blk_watermark(c0,wa);
                v = extract(c,row,col);
                Z_cc(pic,num_0) = mycorrcoef(v,wr);
                if(abs(Z_cc(pic,num_0))<tao) 
                %fprintf('Watermarking added\n')
                    fn_rate = fn_rate+1;
            %else fprintf('\n')
                end
                num_0 = num_0+1;
            end
            Z_cc(pic,3) = mycorrcoef(v0,wr);
            if(abs(Z_cc(pic,3))>tao)
                fp_rate = fp_rate+1;
            end
end

for o = 1:num_0
    figure
    ksdensity(Z_cc(:,o));
    %hold on
    if(o==3)
        title('unwatermarked');
    else
        title(strcat('M = ',int2str(o-1)));
    end
end
fprintf('flase positive rate is :%f\n',fp_rate/(4*numofpic));
fprintf('flase negtive rate is :%f\n',fn_rate/(4*numofpic));