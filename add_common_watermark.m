function c = add_common_watermark(c0,wr,message,message_length,alpha)
    row = size(c0,1);
    col = size(c0,2);
    wm = zeros(row,col);
    for i = 1:message_length
        wm = wm + (2*message(i)-1)*wr{i};
    end
    c = c0+alpha*wm;
end