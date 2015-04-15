function wa = generate_wa(wr,message,message_length,alpha)    
    row = size(wr{1},1);
    col = size(wr{1},2);
    wa = zeros(row,col);
    for i = 1:message_length
        wa = alpha*(2*message(i)-1)*wr{i};
    end
end