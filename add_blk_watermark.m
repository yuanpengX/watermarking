function c = add_blk_watermark(c0,wa)
    c = zeros(size(c0,1),size(c0,2));
    row = floor(size(c,1)/8);
    col = floor(size(c,2)/8);
    for x = 0:row-1
        for y = 0:col-1
          c(8*x+1:8*x+8,8*y+1:y*8+8) = c0(8*x+1:8*x+8,y*8+1:y*8+8) + wa;
        end
    end
end