function Z_lc = D_BLK_8(c,wr,message_length)
    v = extract(double(c),size(c,1),size(c,2));
    message_r = message_restore(v,wr,message_length);
    w_re = reencode(wr,message_r);
    Z_lc = mycorrcoef(v,w_re);
end