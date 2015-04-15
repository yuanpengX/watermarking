clear;clc;
hold on
file_path = 'C:\Users\¾õÐÑµÄ³æ\Desktop\std_test_images\';
file_list = dir(strcat(file_path,'*.png'));
numofpic = length(file_list);
%set parameter
fp = 0;
fn = 0;
beta = 0.3;
tao = 0.7;
Z_lc = zeros(numofpic,3);

for pic = 1:numofpic
    %get picture
            file_name = strcat(file_path,file_list(pic).name);
            c0 = imread(file_name);
            if numel(size(c0))>2
                c0 = rgb2gray(c0);
            end
            c0 = double(c0); 
            row = size(c0,1);
            col = size(c0,2);
            N = row*col;
            c0_vec = reshape(c0,N,1);
            %generate watermarking
            wr = normrnd(0,1,row,col);           
            num_0 = 1; %calculate watermaring 
            for m = 0:1
                wm = (2*m-1)*wr;
                w_vec = double(reshape(wm,N,1));  
                alpha = (N*(tao+beta)-c0_vec'*w_vec)/(w_vec'*w_vec);                           
                wn = alpha*wm;
                c = c0+wn;
                c_vec = double(reshape(c,N,1));
                Z_lc(pic,num_0) = (c_vec'*w_vec)/N;
                if(abs(Z_lc(pic,num_0))<tao) 
                %fprintf('Watermarking added\n')
                    fn = fn+1;
            %else fprintf('\n')
                end
                num_0 = num_0+1;
            end
            Z_lc(pic,3) = c0_vec'*reshape(wr,N,1)/N;
            if(abs(Z_lc(pic,3))>tao)
                fp = fp+1;
            end
end

for o = 1:num_0
    figure
    ksdensity(Z_lc(:,o));
    if(o==3)
        title('unwatermarked');
    else
        title(strcat('M = ',int2str(o-1)));
    end
end
fprintf('flase positive rate is :%f\n',fp/(4*numofpic));
fprintf('flase negtive rate is :%f\n',fn/(4*numofpic));