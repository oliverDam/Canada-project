function [butteredData] = doButter(data,order,cutoff)

%%Function filters data input with a Butterworth lowpass filter based on a
% specified order and cutoff frequency. If a bandpass filter is required,
% the cutoff value should be specified as a 1x2 matrix eg. [2 50]. 

[b,a] = butter(order,cutoff);
butteredData = filter(b,a,data);