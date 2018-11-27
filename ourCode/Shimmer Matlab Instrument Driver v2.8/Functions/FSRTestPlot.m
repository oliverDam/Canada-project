%load the FSRTestDATA
function result = FSRTestPlot(data)
FTD = table2array(data); %loading data directly from the .TXT file will make data a table
figure(1)
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
l.FontSize = 18;
t = title('Test of FSR with 1KG applied force'); %or other weight
t.FontSize = 20;
set(gca,'FontSize',18)