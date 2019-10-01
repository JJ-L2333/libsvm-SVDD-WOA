%%%%%%%%%%      SVDD_WOA (libsvm-3.23)               %%%%%%%%%%%%%%%
% Demo: industrial process data
% Created on 1st October 2019, by Kepeng Qiu.
% ---------------------------------------------------------------------%

clc 
clear all
addpath(genpath(pwd))

global traindata trainlabel

% Industrial process data
load ('.\data\data_2.mat')

% Parameter setting of WOA
agent = 10;            % Number of search agents
iteration = 30;        % Maximum numbef of iterations
lb = [10^-3,2^-7];     % Lower bound of 'c' and 'g'
ub = [10^0,2^7];       % Upper bound of 'c' and 'g'
dim = 2;               % Number of Parameter
fobj = @woa_obj;       % Objective function

% Parameter optimization using WOA
[Best_score, Best_pos, ~] = WOA(agent, iteration, lb, ub, dim, fobj);


% Train SVDD hypersphere using the optimal parameters
cmd = ['-s 5 -t 2 ', '-c ', num2str(Best_pos(1,1)), ' -g ', ...
    num2str(Best_pos(1,2)), ' -q'];
model = libsvmtrain(trainlabel, traindata, cmd);

% Test 
[predictlabel, accuracy, ~] = libsvmpredict(testlabel, testdata, model);

% Visualize the results
plotResult(testlabel,predictlabel)



