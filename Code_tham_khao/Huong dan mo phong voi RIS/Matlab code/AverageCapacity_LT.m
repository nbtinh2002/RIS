function AC_LT = AverageCapacity_LT(SNR_dB,d,path_loss,FIG)
SNR                  = 10.^(SNR_dB/10);
lamda                = d^path_loss;
gamma                = SNR;
%AC_LT = exp(lamda./gamma).*mfun('GAMMA',0,lamda./gamma)./log(2);
AC_LT = exp(lamda./gamma).*igamma(0,lamda./gamma)./log(2);
    if (FIG==1) 
        AC_LT
        semilogy(SNR_dB, AC_LT,'-b');
        grid on; hold on;      
    end
end