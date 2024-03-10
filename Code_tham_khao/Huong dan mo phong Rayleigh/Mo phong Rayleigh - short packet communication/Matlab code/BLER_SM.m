function BLER_SM = BLER_SM(gamma_dB,bit_frame,d,path_loss,delta,m,FIG)
Q_function          = zeros(1,length(gamma_dB));
SNR                = 10.^(gamma_dB/10);
gamma              = SNR;
Ohm = 1./d^(path_loss);
r = delta/m;
for kk=1:length(gamma_dB)
     kk;  
     for bit_num = 1:bit_frame(kk)
        h         = gauss(0,Ohm/2,1,1)+ i*gauss(0,Ohm/2,1,1); % Rayleigh fading channel efficiency 
        g         = abs(h)^2; % channel gain        
        gamma_SD      = gamma(kk)*g; %SNR tai D
        C_gamma_SD = log2(1+gamma_SD);
        V_gamma_SD = (1 - 1/(1+gamma_SD)^2)*(log2(exp(1)))^2;
        Value = (C_gamma_SD - r)/sqrt(V_gamma_SD/m);
        Q_function(kk) = Q_function(kk) +  qfunc(Value);             
      end
end
 BLER_SM    =   Q_function./bit_frame; 
 
 if (FIG==1) 
       BLER_SM
       semilogy(gamma_dB, BLER_SM,'sr');
       grid on; hold on;      
 end
end