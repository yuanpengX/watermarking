function [Z_lc,message_restore] = mycorrelation(c,wr,message_length)
%-------------------------------------------------------------------------%
         row = size(c,1);
         col = size(c,2);
         N  = row*col;
         Z_lc = zeros(message_length);
         message_restore = 0;
%------------- ----generate message---------------------------------------%                  
         for i = 1:message_length
             c_vec = reshape(c,N,1);
             w_vec = reshape(wr{i},N,1);
             Z_lc(i) = c_vec'*w_vec/N;
         end
%------------------generate message---------------------------------------%         
         message = Z_lc>0;
         for i = 1 : message_length
             message_restore = message_restore+2^(8-i)*message(i);
         end
end