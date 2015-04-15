function wr = watermark_generate(row,col,numofwr)
    wr = {};
    for i = 1:numofwr
        wr{i} = normrnd(0,1,row,col);
    end
end