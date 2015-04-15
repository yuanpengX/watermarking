function [c,wr]= E_BLIND(picture,alpha,m)
    c0 = double(picture);
    row = size(c0,1);
    col = size(c0,2);
    wr = normrnd(0,1,row,col);
    wa = alpha*(2*m-1)*wr;
    c = c0+wa;
    c = uint8(c);
end