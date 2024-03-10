clear all;
clc;
PS_dBm    = -35:5:15; % 50dBm
bit_frame = zeros(1,length(PS_dBm)); %
for ii = 1:length(PS_dBm)
   bit_frame(ii)   = 10^5;
end
bit_frame;
path_loss  = 3;
Rt    = 1 ; % bits/s/Hz, target data rate
VarNoise_dBm = -110 ; %dBm
% The channel coefficient is modeled as h = √Ghh˜, The small-scale channel, h˜, is modeled as Rayleigh
%fading such that the channel gain |h|2 follows an exponential distribution with parameter λh. The large-scale path loss is modeled as
%Gh  σPL(d/d0)−PL, where d, PL, d0, and σA denote the distance
%between two nodes, the path loss exponent, reference distance, and the power attenuation at d0, respectively
deltaA_dB = -30;% 30dB, the power attenuation at d0
deltaA = 10.^(deltaA_dB./10);
d0     = 1; %1m, the reference distance
d      = 150;% 150m
Gh     = deltaA*((d/d0)^(-path_loss)); %the average channel power gain between node X and Y
Ohm    = d^(-path_loss);
FIG=1;
% 1. Outage Probability
% OP_SM(PS_dBm,VarNoise_dBm,Rt,bit_frame,Gh,FIG);
% OP_LT(PS_dBm,VarNoise_dBm,Rt,Gh,FIG);

% 2. BER/SER
BER_SM(PS_dBm,VarNoise_dBm,bit_frame,Gh,FIG);
BER_LT(PS_dBm,VarNoise_dBm,Gh,FIG);
%BER_LT_DL(VarNoise_dBm,Gh,FIG); % to save data for train
BER_NN_DL(PS_dBm,VarNoise_dBm,Gh,FIG); % to draw BER vs PS_dBm vs NN

% 3. Average capacity
% AverageCapacity_SM(PS_dBm,VarNoise_dBm,bit_frame,Gh,FIG);
% AverageCapacity_LT(PS_dBm,VarNoise_dBm,Gh,FIG);