function Out_LT = OP_LT(gamma_dB,Rt,d,path_loss,FIG)
SNR                  = 10.^(gamma_dB/10);
lamda                = d^path_loss;
Ohm = 1/d^path_loss;
gamma                = SNR;
Out_LT = 1 - exp(-(2^Rt-1)./(gamma*Ohm));
    if (FIG==1) 
        Out_LT
        semilogy(gamma_dB, Out_LT,'-r');
        grid on; hold on;      
    end
end