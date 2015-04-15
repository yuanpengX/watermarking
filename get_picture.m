function [c0,row,col]=get_picture(file_name)
            c0 = imread(file_name);
            if numel(size(c0))>2
                c0 = rgb2gray(c0);
            end
            c0 = double(c0);  
            row = size(c0,1);
            col = size(c0,2);
end