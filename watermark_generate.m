function wr = watermark_generate(c0,row,col,numofwr)
    wr = {};
    c0_vec = reshape(c0,row*col,1);
    wr_tmp = zeros(row,col);
    for i = 1:numofwr
        tmp = 100;
        while tmp>0.01
            wr_tmp = normrnd(0,1,row,col);
            wr_vec = reshape(wr_tmp,row*col,1);
            tmp = abs(c0_vec'*wr_vec/(row*col));
        end
        wr{i} = wr_tmp; 
    end
end