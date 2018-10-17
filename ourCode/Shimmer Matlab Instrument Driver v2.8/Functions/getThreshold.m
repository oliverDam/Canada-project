function [threshold, output] = getThreshold(dataInput, sens)

%% Simple function so far - gonna be a lot more complex to find the actual
%  threshold of the signal between movement and standstill. Takes the data
%  as input and outputs three threshold values for x, y and z and outputs
%  a matrix with 0 for standstill and 1 for movement. Sens is a 2x1 matrix
%  with size and threshold to adjust when movement is detected.

moveMatrix = [];
moveMatrixCorrected = [];

xthres = mean(dataInput(:,1));
ythres = mean(dataInput(:,2));
zthres = mean(dataInput(:,3));

for i=1:length(dataInput)
    if xthres >= dataInput(i,1) && ythres >= dataInput(i,2) && zthres ...
            >= dataInput(i,3)
        moveMatrix = [moveMatrix; 0];
    else
        moveMatrix = [moveMatrix; 1];
    end
end

for i=sens(1)+1:length(moveMatrix)-sens(1)
    if mean(moveMatrix(i-sens(1):i+sens(1))) >= sens(2)
        moveMatrixCorrected = [moveMatrixCorrected; 1];
    else 
        moveMatrixCorrected = [moveMatrixCorrected; 0];
    end
end

moveMatrixCorrected = [zeros(sens(1),1);moveMatrixCorrected;zeros(sens(1),1)];

threshold = [xthres, ythres, zthres];
output = moveMatrixCorrected;