function BER_NN = BER_NN_DL(PS_dBm,VarNoise_dBm,Gh,FIG)
SNR                  = 10.^((PS_dBm-VarNoise_dBm)/10);
% Dieu che BPSK
BER_NN = myNeuralNetworkFunction10(PS_dBm)
PS_dBm
if (FIG==1) 
        BER_NN
        semilogy(PS_dBm, BER_NN,'-rs');
        grid on; hold on;  
end     
end