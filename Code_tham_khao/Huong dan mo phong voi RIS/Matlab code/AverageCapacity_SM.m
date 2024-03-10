function AC_SM = AverageCapacity_SM(SNR_dB,bit_frame,d,path_loss,FIG)
AvgC_SM             = zeros(1,length(SNR_dB)); 
SNR                = 10.^(SNR_dB/10);
gamma              = SNR;
for kk=1:length(SNR_dB)
     kk;  
     for bit_num = 1:bit_frame(kk)
        h         = gauss(0,1/d^path_loss/2,1,1)+ i*gauss(0,1/d^path_loss/2,1,1);
        g         = abs(h)^2;        
        gamma_D      = gamma(kk)*g;
        R_SD         = log2(1+gamma_D);        
        AvgC_SM(kk)  = AvgC_SM(kk) + R_SD;                
     end
end
 AvgC_SM    =   AvgC_SM./bit_frame;
 AC_SM      = AvgC_SM;
 if (FIG==1) 
       AC_SM
       semilogy(SNR_dB, AvgC_SM,'sb');
       grid on; hold on;      
 end
end