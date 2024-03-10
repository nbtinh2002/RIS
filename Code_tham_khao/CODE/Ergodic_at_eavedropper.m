clc;
clear all;
R = 60;S = 30;M = 15; 
Pc = 10;Pd = 10;sigma = 1;
D2DPAR = 0.1:0.1:0.9;

p_c = Pc / (sigma^2);
p_d = D2DPAR * Pd / (sigma^2);
p_j = ((1 - D2DPAR) * Pd) / ((M - 1) * (sigma^2));

RCE = zeros(size(p_d)); 
RDE = zeros(size(p_d)); 
for i = 1:numel(p_d)
    RCE(i) = ErgodicE(p_c, p_d, p_j, R, S, M);
    RDE(i) = ErgodicE(p_c, p_d, p_j, R, S, M);
end

ERG_E = RCE + RDE;

% Plot the graph
semilogy(D2DPAR, ERG_E,'r*-');
       grid on; hold on;  
xlabel('D2D power allocation'); ylabel('R_C_L+R_D_L');