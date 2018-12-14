%%Function to plot test data collected from the Force Sensitive Resistors
%(FSR). Starts by converting input data from table to matrix. If input data
%is on table form (loaded directly from .txt-file) inputIsTable should be 1. 
%If input data is on matrix form, inputIsTable should be 0.
%
% [output] = FSRTestPlot(data, inputIsTable);

function result = FSRTestPlot(data, inputIsTable)
    if inputIsTable == 1
        FTD = table2array(data);
    else
        FTD = data;
    end
figure;
plot(FTD(:,1),FTD(:,2))
hold on;
plot(FTD(:,1),FTD(:,3))
hold on;
plot(FTD(:,1),FTD(:,4))
hold on;
plot(FTD(:,1),FTD(:,5))
hold on;
plot(FTD(:,1),FTD(:,6))
hold on;
plot(FTD(:,1),FTD(:,7))
l = legend('FSR1','FSR2','FSR3','FSR4','FSR5','FSR6');
l.FontSize = 20;
t = title('Test of FSR with 1kg applied force'); %or other weight
t.FontSize = 40;
set(gca,'FontSize',25)
end