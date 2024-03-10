clc;
clear all;
R = 60;S = 30;M = 15; 
Pc = 10;Pd = 10;sigma = 1;
D2DPAR = 0.1:0.1:0.9;

p_c = Pc / (sigma^2);
p_d = D2DPAR * Pd / (sigma^2);
p_j = ((1 - D2DPAR) * Pd) / ((M - 1) * (sigma^2));

R_CL = ErgodicCR(R,p_c); 

R_DL = zeros(size(p_d)); 

for i = 1:numel(p_d)
    R_DL(i) = ErgodicDR(S, p_d(i)); 
end

ERGcrdr = R_CL + R_DL;

% Plot the graph
semilogy(D2DPAR, ERGcrdr,'r*-');
       grid on; hold on;  
xlabel('D2D power allocation'); ylabel('R_C_L+R_D_L');