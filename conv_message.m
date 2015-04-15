function message = conv_message(m,message_length)
    if m>256 fprintf('wrong number!\n');
        message = -1;
        return;
    end
    message = dec2bin(m); % get a bin string
    message = message=='1';
    message = [zeros(1,message_length-length(message)),message];
end

