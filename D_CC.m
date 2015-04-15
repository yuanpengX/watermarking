function Z_cc  = D_CC(c,wr)
    c = double(c);
    row = size(c,1);
    col = size(c,1);
    N = row*col;
    wr_vec = reshape(wr,N,1);
    wr_vec = wr_vec - mean(wr_vec);
    c_vec = reshape(c,N,1);
    c_vec = c_vec-mean(c_vec);
    Z_cc = (wr_vec'*c_vec)/(sqrt(c_vec'*c_vec)*sqrt(wr_vec'*wr_vec));
end