function BER_LT = BER_LT(SNR_dB,d,path_loss,FIG)
SNR                  = 10.^(SNR_dB/10);
lamda                = d^path_loss;
gamma                = SNR;
% Dieu che BPSK
a = 1;
b = 1; 
BER_LT = (a./2).*(1 - 1./sqrt(1+lamda./(gamma.*b)));
    if (FIG==1) 
        BER_LT
        semilogy(SNR_dB, BER_LT,'-k');
        grid on; hold on;      
    end
end