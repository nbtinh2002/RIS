clear all;
clc;
gamma_dB    = 0:5:15; %
bit_frame = zeros(1,length(gamma_dB)) %
for ii = 1:length(gamma_dB)
   bit_frame(ii)   = 10^4;
end
bit_frame
path_loss  = 3;
Rt    = 1 ; % target data rate
d    = 1;
Ohm = 1./d^(path_loss);
FIG=1;
% 1. Outage Probability
% OP_SM(gamma_dB,Rt,bit_frame,d,path_loss,FIG);
% OP_LT(gamma_dB,Rt,d,path_loss,FIG);

% 2. BER/SER
%  BER_SM(gamma_dB,bit_frame,d,path_loss,FIG);
% BER_LT(gamma_dB,d,path_loss,FIG);

% 3. Average capacity
AverageCapacity_SM(gamma_dB,bit_frame,d,path_loss,FIG);
AverageCapacity_LT(gamma_dB,d,path_loss,FIG);

xlabel('SNR(dB)'); ylabel('Outage Probility');
