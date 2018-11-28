function [score] = stabilityOfCOP(right,left,press)

%%Gives a score to describe the stability of COP while taking the max
% deviations and time taken to perform the movements into consideration.
% Input should be 3 matrices, where left and right are nx3 gyroscope
% readings, and press is a nx6 pressure reading matrix.
%
% [score] = stabilityOfCOP(right,left,press)

%Filtering signals:
fc = 25;
fs = 100;
R = doButter(right,3,fc,fs);
L = doButter(left,3,fc,fs);
P = doButter(press,3,fc,fs);

%Finding the COP:
[COP,COPR,COPL] = findCOP(P);

%Length, max/min and mean values of COP:
L = length(COP);

CMin = min(COP);
RMin = min(COPR);
LMin = min(COPL);

CMax = max(COP);
RMax = max(COPR);
LMax = max(COPL);

CMean = mean(COP);
RMean = mean(COPR);
LMean = mean(COPL);

%Max span divided by mean:
CSpan = sum((CMax-CMin));
RSpan = sum((RMax-RMin));
LSpan = sum((LMax-LMin));

%Length of COP divided by samples/time taken:
CLen = 0;
RLen = 0;
LLen = 0;

for i = 1:L-1
CLen = CLen + sqrt( (COP(i+1,1)-COP(i,1))^2 + (COP(i+1,2)-COP(i,2))^2 );
RLen = RLen + sqrt( (COPR(i+1,1)-COPR(i,1))^2 + (COPR(i+1,2)-COPR(i,2))^2 );
LLen = LLen + sqrt( (COPL(i+1,1)-COPL(i,1))^2 + (COPL(i+1,2)-COPL(i,2))^2 );
end

CLen = CLen/L;
RLen = RLen/L;
LLen = LLen/L;

CScore = CLen*CSpan;
RScore = RLen*RSpan;
LScore = LLen*LSpan;

score = [CScore,RScore,LScore];
