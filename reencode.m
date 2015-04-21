function M = reencode(wr,message)
     M = zeros(size(wr{1},1),size(wr{1},2));
    for i = 1:length(message)
        M = M+(2*message(i)-1)*wr{i};
    end
    M = M;
end