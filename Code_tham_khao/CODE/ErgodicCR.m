function R_CL = ErgodicCR(R, p_c)
    R_CL = zeros(size(p_c));
    
    for i = 1:numel(p_c)
        E_c = 1 + R*(16-pi^2)/16 +(R*pi/4)^2 + (R*pi*sqrt(pi)/4);
        
        E_c2 = (R*pi/4)^2 + 6*((R*pi/4)^2)*(R*(16-pi^2)/16) ...
             + 3*((R*(16-pi^2)/16)^2) + 2*sqrt(pi)*((R*pi/4)^3) ...
             + 3*(R*(16-pi^2)/16)*(R*pi/4) + 6*((R*(16-pi^2)/16)+(R*pi/4)^2) ...
             + 3*R*pi*sqrt(pi) + 2;
         
        k_c = (E_c^2)/(E_c2 - (E_c^2));
        theta_c = (E_c2 - (E_c^2))/E_c;
        
        R_CL(i) = 1*log(2)*(log(1+k_c*p_c(i)*theta_c) ...
             - (k_c*(p_c(i)*theta_c)^2)/(2*(1+k_c*p_c(i)*theta_c)^2));
    end
end