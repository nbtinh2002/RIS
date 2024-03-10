1%MODEL S - RIS - D
%Paper: Performance Analysis of Reconfigurable Intelligent Surface-Assisted Wireless Systems and Comparison With Relaying
clear all;
clc;
ro_t_dB    = -5:2:5; %
bit_frame = zeros(1,length(ro_t_dB)); 
for ii = 1:length(ro_t_dB)
   bit_frame(ii)   = 10^4;
end
bit_frame
path_loss  = 3;
ro_th    = 1 ; % target data rate
N = 3; %number of metasurface (MS) or RIS elements
d    = 1;
Ohm = 1./d^(path_loss);
FIG = 1;
% 1. Outage Probability
OP_SM(ro_t_dB,ro_th,bit_frame,N,FIG);
OP_LT(ro_t_dB,ro_th,N,FIG);

% 2. BER/SER
%  BER_SM(gamma_dB,bit_frame,d,path_loss,FIG);
% BER_LT(gamma_dB,d,path_loss,FIG);

% 3. Average capacity
% AverageCapacity_SM(gamma_dB,bit_frame,d,path_loss,FIG);
% AverageCapacity_LT(gamma_dB,d,path_loss,FIG);

xlabel('SNR(dB)'); ylabel('Outage Probility');
