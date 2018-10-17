function output = normalizeData(dataInput)

%% Normalizes data - mean will be the new zero and the absolute value of
%  the signal is a part of the output. The input should be a mx3 matrix
%  containing data from accelerometers.

datax = dataInput(:,1);
datay = dataInput(:,2);
dataz = dataInput(:,3);

meanx = datax-mean(datax);
meany = datay-mean(datay);
meanz = dataz-mean(dataz);

output = [abs(meanx),abs(meany),abs(meanz)];