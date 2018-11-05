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


% If gyroscope data is lower than threshold -> no movement
for i=1:length(dataInput)
    if xthres >= dataInput(i,1) && ythres >= dataInput(i,2) && zthres ...
            >= dataInput(i,3)
        moveMatrix = [moveMatrix; 0];
    else
        moveMatrix = [moveMatrix; 1];
    end
end

% Checks to see if the surrounding recordings also correspond to a movement
% and compares the average value to a previously defined threshold. Sens(2)
% defines the percentage of movements within the sens(1) area that has to
% be a movement.
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