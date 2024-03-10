function Out_LT = OP_LT(ro_t_dB,ro_th,N,FIG)
SNR                = 10.^(ro_t_dB/10);
ro_s               = SNR;
var = 2; %mean =0
deta = var;
%ts = gammainc(2.*pi.*sqrt(ro_th./ro_s)./(16 - pi^2),N.*pi^2./(16 - pi^2));
ms = gamma(N.*pi^2./(16 - pi^2));
ts  = ms - igamma(N.*pi^2./(16 - pi^2),2.*pi.*sqrt(ro_th./ro_s)./(16 - pi^2));

Out_LT = ts./ms;
    if (FIG==1) 
        Out_LT
        semilogy(ro_t_dB, Out_LT,'-r');
        grid on; hold on;      
    end
end