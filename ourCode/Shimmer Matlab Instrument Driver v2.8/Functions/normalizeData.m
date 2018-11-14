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
    datak = dataInput(:,5);
    datap = dataInput(:,6);
    six = 1;
catch
    six = 0;
end

if mode == 'mea'
    outx = datax-mean(datax);
    outy = datay-mean(datay);
    outz = dataz-mean(dataz);
    if six == 1
        outj = dataj-mean(dataj);
        outk = datak-mean(datak);
        outp = datap-mean(datap);
    end
elseif mode == 'max'
    outx = datax-max(datax);
    outy = datay-max(datay);
    outz = dataz-max(dataz);
    if six == 1
        outj = dataj-max(dataj);
        outk = datak-max(datak);
        outp = datap-max(datap);
    end
end

if six == 0
    output = [abs(outx),abs(outy),abs(outz)];
else 
    output = [abs(outx),abs(outy),abs(outz),abs(outj),abs(outk),abs(outp)];
end