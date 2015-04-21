function [c,wr]= E_BLIND(picture,alpha,m)
    c0 = double(picture);    
    row = size(c0,1);
    col = size(c0,2);
    tmp = 10;
    while tmp>0.01        
        wr = normrnd(0,1,row,col);
        tmp = abs(D_CC(c0,wr));
    end
    wa = alpha*(2*m-1)*wr;
    c = c0+wa;
    c = uint8(c);
end