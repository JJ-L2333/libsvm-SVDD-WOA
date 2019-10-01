function obj = woa_obj(para)
%{ 
% DESCRIPTION
Objective function for SVDD_WOA

      obj = woa_obj(para)

INPUT
  para         'c' and 'g'

OUTPUT
  obj           Error rate of classification

Created on 1st October 2019, by Kepeng Qiu
-------------------------------------------------------------%
%} 

global traindata trainlabel

% cost
c = para(1,1);
% gamma
g = para(1,2);

%
cmd = ['-s 5 -t 2 ', '-c ',num2str(c), ' -g ', num2str(g), ' -q'];

% Train SVDD hypersphere
model = libsvmtrain(trainlabel, traindata, cmd); 
% Test
[~, acc, ~] = libsvmpredict(trainlabel, traindata, model);
% Error rate of classification
obj = 1-acc(1,1)/100;
end

