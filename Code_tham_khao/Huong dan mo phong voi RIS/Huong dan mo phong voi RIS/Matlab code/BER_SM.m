function BER_SM = BER_SM (SNR_dB,bit_frame,d,path_loss,FIG) 
BER                    = zeros(1,length(SNR_dB));
SNR                    = 10.^(SNR_dB/10);
var                    = 1./(d^path_loss);
for kk=1:length(SNR)
     kk;
     P = SNR(kk);
     for bit_num        = 1:bit_frame(kk)
         xS = 2*randi(2,1)-3;     %tao tinh hieu symbol cho tin hieu goc, lay cac gia tri 1,-1
         %Tao nhieu AWGN voi variance 1
         n_D  = gauss(0,1/2,1,1) +  i*gauss(0,1/2,1,1); 
         %Tao kenh Rayleigh S- D voi variance var= 1./(d^path_loss);
         h    = gauss(0,var/2,1,1)+ i*gauss(0,var/2,1,1);
         % Tin hieu thu duoc o node D
         y_D  = sqrt(P).*h.*xS + n_D;
         % Giai dieu che
         X_D =  conj(h).*y_D; 
         % Tinh do loi kenh tai D
         channel_gain = abs(h)^2; 
         % Khoi phuc du lieu tai D
         data= sign(real(X_D/channel_gain));
         % Tinh BER
         if (data ~= xS)
            BER(kk) = BER(kk) + 1;
         end             
     end
end
BER     
BER_SM = BER./bit_frame;    
if (FIG==1)
        BER_SM
        semilogy(SNR_dB, BER_SM ,'ko');
        grid on; hold on; 
        xlabel('SNR (dB)'); ylabel('BER');  
 end
end