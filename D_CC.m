function Z_lc  = D_CC(c,wr)
    c = double(c);
    row = size(c,1);
    col = size(c,1);
    N = row*col;
    wr_vec = reshape(wr,N,1);    
    c_vec = reshape(c,N,1);
    Z_lc = (c_vec'*wr_vec)/(row*col);
end
