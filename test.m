function Z_lc = test(c0,alpha,m,N)    
Z_lc = zeros(N,1);
for i = 1:N
    [c,wr] = E_BLIND(c0,alpha,m);
    Z_lc(i) = D_CC(c,wr);
end
end