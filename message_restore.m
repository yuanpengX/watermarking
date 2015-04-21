function message_restore= message_restore(v,wr,message_length)  
    message_restore = zeros(1,message_length);
    for i = 1:message_length
        Z_lc =  mycorrcoef(v,wr{i});
        if Z_lc >=0 message_restore(i) = 1;
        else
           message_restore(i) = 0;
        end         
    end
    position = hamming_detect(message_restore);
    if position ~=0 && position <= message_length
           message_restore(position) = ~message_restore(position);
    end
end