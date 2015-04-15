function c = E_BLK_8(seed,alpha,m)
message = conv_message(m,8);
if message == -1 return;
[c0 row col]= get_picture(file_name);
%----------hamming code--------------%
hamming_distance = 4; %allow 2-bits error
message_module = hammingcode(message,hamming_distance);
wr = watermark_generate(8,8,2^(length(message_module)));%
M = reencode(message_module);   % how to reencode modulation?
wa = alpha*wr{M};
c = add_blk_watermark(c0,wa);
c = uint8(c);
end