function Z_cc = mycorrcoef(v,wr)                
         v_vec = reshape(v,64,1);
         v_hat = v_vec - mean(v_vec);
         w_vec = reshape(wr,64,1);
         w_hat = w_vec - mean(w_vec);               
         Z_cc = (v_hat'*w_hat)/(sqrt(w_hat'*w_hat)*sqrt(v_hat'*v_hat));
end                     