function [y,tr,net]=Artificial_Neural_Network(x,t,hiddenLayerSize,epoch)

trainFcn = 'trainbr';

% Create a Fitting Network
net = fitnet(hiddenLayerSize,trainFcn);
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'softmax';
net.trainParam.epochs = epoch;



net.trainParam.max_fail = 6;
net.input.processFcns = {};
net.output.processFcns = {};

% Setup Division of Data for Training, Validation, Testing
% For a list of all data division functions type: help nndivide
net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 10/100;

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net.performFcn = 'crossentropy';  % Mean Squared Error

% Choose Plot Functions
% For a list of all plot functions type: help nnplot
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
    'plotregression', 'plotfit'};

% Train the network
[net,tr]=train(net,x,t);

% Test the Network
y = net(x);

end
