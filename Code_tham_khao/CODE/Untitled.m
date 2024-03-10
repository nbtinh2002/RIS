clc;
clear all;
p_c = 0:5:30;
R=60;
for i = 1:numel(p_c)
    R_CL(i) = ErgodicCR(R, p_c(i)); 
end
semilogy(p_c, R_CL,'ro-');

       grid on; hold on;     
xlabel('p_c');
ylabel('R_CL');
title('Biểu đồ của R_CL theo p_c');