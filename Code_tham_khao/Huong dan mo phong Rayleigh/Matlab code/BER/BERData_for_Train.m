clear all;
clc;
PS_start_dBm   = -40; % start point
PS_stop_dBm    = 20; %dBm, end point
VarNoise_dBm   = -110 ; %dBm, fixed
VarNoise_value = 10^((VarNoise_dBm)/10)
path_loss    = 3;
deltaA_dB = -30;% 30dB, the power attenuation at d0
deltaA = 10.^(deltaA_dB./10);
d0     = 1; %1m, the reference distance
d      = 150;% 150m
Gh     = deltaA*((d/d0)^(-path_loss)); %the average channel power gain between node X and Y
Ohm    = d^(-path_loss);
M      = 10000; %sample for training
PS_dBm = PS_start_dBm:(PS_stop_dBm - PS_start_dBm)/(M-1):PS_stop_dBm; %Create M sample of PS
lamda                = 1/Gh; %d^path_loss;
SNR                  = 10.^((PS_dBm-VarNoise_dBm)/10);
gamma                = SNR;
% Dieu che BPSK
a = 1;
b = 1; 
BER_LT = (a./2).*(1 - 1./sqrt(1+lamda./(gamma.*b))); %Create M sample of BER by theory analysis
%SNR
PS_dBm
BER_LT;
save('Save_Data\BPSK.vs.SNR.mat','PS_dBm','BER_LT')     

