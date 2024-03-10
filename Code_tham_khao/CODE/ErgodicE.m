function [RCE, RDE] = ErgodicE(p_c, p_d, p_j, R, S, M)
    
    E_U1 = zeros(size(p_d));
    E_U2 = zeros(size(p_d));
    E_U3 = zeros(size(p_d));
    V_U1 = zeros(size(p_d));
    V_U2 = zeros(size(p_d));
    V_U3 = zeros(size(p_d));


    for i = 1:numel(p_d)
        E_U1(i) = p_c/(R+1) + p_d(i)(i)/S + p_j(i)/(M-1);
        V_U1(i) = (p_c/(R+1))^2 + (p_d(i)/S)^2 + (p_j(i)/(M-1))^2;

        E_U2(i) = p_d(i)/S + p_j(i)/(M-1);
        V_U2(i) = (p_d(i)/S)^2 + (p_j(i)/(M-1))^2;

        E_U3(i) = p_c/(R+1) + p_j(i)/(M-1);
        V_U3(i) = (p_c/(R+1))^2 + (p_j(i)/(M-1))^2;

        RCE = 1*log(2)*...
            (log((1 + E_U1)/(1 + E_U2)) - V_U1/(2*(1 + E_U1)^2) + V_U2/(2*(1 + E_U2)^2));
        RDE = 1*log(2)*...
            (log((1 + E_U1)/(1 + E_U3)) - V_U1/(2*(1 + E_U1)^2) + V_U3/(2*(1 + E_U3)^2));
    end
end