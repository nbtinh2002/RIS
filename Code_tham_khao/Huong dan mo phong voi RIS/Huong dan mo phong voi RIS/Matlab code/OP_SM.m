function Out_SM = OP_SM(ro_t_dB,ro_th,bit_frame,N,FIG)
CDF_SM             = zeros(1,length(ro_t_dB));
SNR                = 10.^(ro_t_dB/10);
ro_s               = SNR;
%Ohm = 1./d^(path_loss);
var = 2; %mean =0
for kk=1:length(ro_t_dB)
     kk;  
     for bit_num = 1:bit_frame(kk)
         A = 0;
         for ii = 1:N 
            %h     = gauss(0,Ohm/2,1,1)+ i*gauss(0,Ohm/2,1,1); % Rayleigh fading channel efficiency 
            hi     = gauss(0,var/2,1,1)+ i*gauss(0,var/2,1,1); % Rayleigh fading channel efficiency S-RIS
            gi     = gauss(0,var/2,1,1)+ i*gauss(0,var/2,1,1); % Rayleigh fading channel efficiency RIS-D
            abs_hi = abs(hi);
            abs_gi = abs(gi);        
            A = A + abs_hi*abs_gi; % fomula (6)
         end
         ro = ro_s(kk)*A^2;            
        if (ro < ro_th) % check to calculate Probability 
            CDF_SM(kk)  = CDF_SM(kk) + 1;            
        end         
      end
end
 CDF_SM    =   CDF_SM./bit_frame; % output Probability
 Out_SM    = CDF_SM;
 if (FIG==1) 
       Out_SM
       semilogy(ro_t_dB, CDF_SM,'sr');
       grid on; hold on;      
 end
end