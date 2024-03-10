function [y1] = Model_1L10(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 29-Oct-2022 14:02:32.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = 1xQ matrix, input #1
% and returns:
%   y = 1xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = -40;
x1_step1.gain = 0.0333333333333333;
x1_step1.ymin = -1;

% Layer 1
b1 = [13.999537957889634399;9.80393253427285849;5.7960978072811375483;-2.5389916350106331855;0.057087187986053597455;-0.72170740487301043853;-1.7801718636831880271;3.0044666737682441671;-6.1378329255972028378;-8.4620813376002246287];
IW1_1 = [-13.914052009831854306;-14.053322002829505166;-11.715617564674262852;8.2403918989952398277;6.1596580818661728074;-3.3699694144149741071;-4.0075736247762208109;4.4962755665024687346;-7.3122678013202477842;-8.5650082118563393152];

% Layer 2
b2 = 0.021083989914112397784;
LW2_1 = [-0.00010360086142701435317 -0.0001219820715327482835 -0.00021650531251044354995 0.00028524299378352227508 -0.0032280456497943989767 0.71995149485954423874 0.16440665523091158029 -0.092556886368570179258 0.020691681154049759023 0.021240587359620512198];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 4.23066136842531;
y1_step1.xoffset = 8.43536485831131e-05;

% ===== SIMULATION ========

% Dimensions
Q = size(x1,2); % samples

% Input 1
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end
