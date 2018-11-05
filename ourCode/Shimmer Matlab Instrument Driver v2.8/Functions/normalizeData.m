function output = normalizeData(dataInput, mode)

%% Normalizes data - mean will be the new zero and the absolute value of
%  the signal is a part of the output. The input should be a mx3 matrix
%  containing data from accelerometers. Mode determines if it should be
%  'meanabs' or 'maxabs'.

datax = dataInput(:,1);
datay = dataInput(:,2);
dataz = dataInput(:,3);
try
    dataj = dataInput(:,4);
    four = 1;
catch
    four = 0;
end

if mode == 'mean'
    outx = datax-mean(datax);
    outy = datay-mean(datay);
    outz = dataz-mean(dataz);
    if four == 1
        outj = dataj-mean(dataj);
    end
elseif mode == 'max'
    outx = datax-max(datax);
    outy = datay-max(datay);
    outz = dataz-max(dataz);
    if four == 1
        outj = dataj-max(dataj);
    end
end

if four == 0
    output = [abs(outx),abs(outy),abs(outz)];
else 
    output = [abs(outx),abs(outy),abs(outz),abs(outj)];
end