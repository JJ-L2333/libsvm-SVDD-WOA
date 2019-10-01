function [traindata, testdata, trainlabel, testlabel] = prepareData
%{ 
% DESCRIPTION
Prepare the data for SVDD_WOA

      [traindata, testdata, trainlabel, testlabel] = prepareData

OUTPUT
  traindata           Training data
  testdata            Testing data
  trainlabel          Training label
  trainlabel          Training label


Created on 1st October 2019, by Kepeng Qiu
-------------------------------------------------------------%
%} 

load .\data\heart_scale.mat

heart_scale_inst = zscore(heart_scale_inst);
p_index = find(heart_scale_label == 1);
n_index = setdiff(1:size(heart_scale_label,1), p_index);

traindata = heart_scale_inst(p_index,:);
testdata = heart_scale_inst(n_index,:);
trainlabel = ones(size(traindata,1),1);
testlabel = -ones(size(testdata,1),1);
end