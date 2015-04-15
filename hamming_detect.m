function position = hamming_detect(code)
    position = 0;
    for i = 1:length(code)
        if code(i)==1 
            position = bitxor(position,i);
        end       
    end
end