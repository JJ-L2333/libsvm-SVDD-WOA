function plotResult(yt,yfit)
%{ 
DESCRIPTION
Plot the results 

   plotResult(yt,yfit)

INPUT
  yt           testing label
  yfit         prediction

Created on 1st October 2019, by Kepeng Qiu
-------------------------------------------------------------%
%} 

figure 
plot(yt, 'ok:', 'LineWidth', 1, 'MarkerSize', 6, ... 
    'MarkerEdgeColor', 'k', 'MarkerFaceColor', [254, 67, 101]/255)
hold on
plot(yfit, 'ok:', 'LineWidth', 1, 'MarkerSize', 6, ... 
    'MarkerEdgeColor', 'k', 'MarkerFaceColor', [29, 191, 151]/255)
legend('Real value', 'Predicted value')
xlabel('Observation');
ylabel('Prediction');
ylim([-1.5,1.5])