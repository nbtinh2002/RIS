function BLER_ASYM = BLER_ASYM(gamma_dB,d,path_loss,delta,m,FIG)
SNR                = 10.^(gamma_dB/10);
gamma              = SNR;
Ohm = 1./d^(path_loss);
r = delta/m;
v = 1./(2.*pi.*sqrt(2^(2*r)-1));
theta = 2^r - 1;
ro_L = theta - 1./(2.*v.*sqrt(m));
ro_H = theta + 1./(2.*v.*sqrt(m));

BLER_ASYM = v.*sqrt(m).*(ro_H.^2 - ro_L.^2)./(2.*gamma./Ohm);
 
 if (FIG==1) 
       BLER_ASYM
       semilogy(gamma_dB, BLER_ASYM,'-r');
       grid on; hold on;      
 end
end