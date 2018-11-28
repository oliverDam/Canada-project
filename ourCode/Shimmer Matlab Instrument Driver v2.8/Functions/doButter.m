function [butteredData] = doButter(data,order,cutoff,sampleRate)

%%Function filters data input with a Butterworth lowpass filter based on a
% specified order and cutoff frequency. If a bandpass filter is required,
% the cutoff value should be specified as a 1x2 matrix eg. [2 50].
% Samplerate specifies the sample frequency of the recorded signal.
%
% [output] = doButter(data,order,cutoff,sampleRate);

[b,a] = butter(order,cutoff/(sampleRate/2));
butteredData = filter(b,a,data);