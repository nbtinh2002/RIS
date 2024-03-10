function Out_SM = OP_SM(gamma_dB,Rt,bit_frame,d,path_loss,FIG)
CDF_SM             = zeros(1,length(gamma_dB));
SNR                = 10.^(gamma_dB/10);
gamma              = SNR;
Ohm = 1./d^(path_loss);
for kk=1:length(gamma_dB)
     kk;  
     for bit_num = 1:bit_frame(kk)
        h         = gauss(0,Ohm/2,1,1)+ i*gauss(0,Ohm/2,1,1); % Rayleigh fading channel efficiency 
        g         = abs(h)^2; % channel gain        
        gamma_D      = gamma(kk)*g; %SNR tai D
        R_SD         = log2(1+gamma_D); % Achievable rate at D        
        if (R_SD < Rt) % check to calculate Probability 
            CDF_SM(kk)  = CDF_SM(kk) + 1;            
        end         
      end
end
 CDF_SM    =   CDF_SM./bit_frame; % output Probability
 Out_SM    = CDF_SM;
 if (FIG==1) 
       Out_SM
       semilogy(gamma_dB, CDF_SM,'sr');
       grid on; hold on;      
 end
end