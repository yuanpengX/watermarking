function [c wr] = E_BLK_8(file_name,alpha,m)
message = conv_message(m,8);
if message == -1 return; end
[c0 row col]= get_picture(file_name);
hamming_distance = 4; %allow 2-bits error
message_module = hamming_code(message,hamming_distance);
v = extract(c0,row,col);
wr = watermark_generate(v,8,8,length(message_module));%
M = reencode(wr,message_module);   % how to reencode modulation?
M = alpha*M;
c = add_blk_watermark(c0,M);
c = uint8(c);
end