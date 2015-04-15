function code = hamming_code(message,hamming_distance)
    message_length = length(message);
    % illegal input detect
    if( (2^hamming_distance<hamming_distance+message_length)| (2^hamming_distance>2*(message_length+hamming_distance)))
        fprintf('distance exceed\n');
        return;
    end
    % insert info code
    code = [0 message];
    for i = 2:hamming_distance
        code = [code(1,1:2^(i-1)-1) 0 code(1,2^(i-1):end)];  %尼玛，数学差就是硬伤啊
    end
    % get detect code
    position = hamming_detect(code);
    position = conv_message(position,hamming_distance);
    % insert detect code
    for i = 1:hamming_distance
        code(2^(i-1)) = position(hamming_distance-i+1);
    end
    % 海明码只能校验一位是因为嵌入了位置信息
    % 换句话说，海明码是一种基于位置的奇偶校验码
end