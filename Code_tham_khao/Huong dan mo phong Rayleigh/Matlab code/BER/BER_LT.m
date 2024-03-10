function BER_LT = BER_LT(PS_dBm,VarNoise_dBm,Gh,FIG)
SNR                  = 10.^((PS_dBm-VarNoise_dBm)/10);
lamda                = 1/Gh; %d^path_loss;
gamma                = SNR;
% Dieu che BPSK
a = 1;
b = 1; 
BER_LT = (a./2).*(1 - 1./sqrt(1+lamda./(gamma.*b)));
    if (FIG==1) 
        BER_LT
        semilogy(PS_dBm, BER_LT,'-k');
        grid on; hold on;      
    end
end