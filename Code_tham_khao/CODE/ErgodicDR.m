function R_DL = ErgodicDR(S, p_d)
    R_DL = zeros(size(p_d));
    
    for i = 1:numel(p_d)
        E_d = (S*pi/4)^2 + S*((16-pi)^2)/16;

        E_d2 = (S*pi/4)^4 + 6*((S*pi/4)^2)*(S*(16-pi^2)/16) ...
             + 3*((S*(16-pi^2)/16)^2);

        k_d = (E_d^2)/(E_d2 - (E_d^2));
        theta_d = (E_d2 - (E_d^2))/E_d;
        
        R_DL(i) = 1*log(2)*(log(1+k_d*p_d(i)*theta_d) ...
             - (k_d*(p_d(i)*theta_d)^2)/(2*(1+k_d*p_d(i)*theta_d)^2));
    end
end