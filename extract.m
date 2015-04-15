function v = extract(c,row,col)
    v = zeros(8,8);
    row_n = floor(row/8);
    col_n = floor(col/8);
    for x = 0:row_n-1
        for y = 0:col_n-1
            v = v + c(8*x+1:8*x+8,y*8+1:y*8+8);
        end
    end
    v = v/(row_n*col_n);
end