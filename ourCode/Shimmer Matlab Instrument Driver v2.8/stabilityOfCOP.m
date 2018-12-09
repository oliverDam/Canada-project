function [score,CData] = stabilityOfCOP(right,left,press)

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
[COP] = findCOP(P);

%Length, max/min and mean values of COP:
l = length(COP);

CMin = min(COP);

CMax = max(COP);

% CMean = mean(COP);
% RMean = mean(COPR);
% LMean = mean(COPL);

%Max span: might be unusable 
% CSpan = abs(sum((CMax-CMin)/(sum(ScCOP)/l)))/10;
% RSpan = abs(sum((RMax-RMin)/(sum(ScCOPR)/l)))/10;
% LSpan = abs(sum((LMax-LMin)/(sum(ScCOPL)/l)))/10;

%CSpan = abs(sum(CMax-CMin))/10;
%RSpan = abs(sum(RMax-RMin))/10;
%LSpan = abs(sum(LMax-LMin))/10;
CSpan = abs(CMax-CMin)/10;

%Length of COP:
CLen = 0;

for i = 1:l-1
% CLen = CLen + sqrt( (COP(i+1,1)-COP(i,1))^2 + (COP(i+1,2)-COP(i,2))^2 );
CLen = CLen + [sqrt( (COP(i+1,1)-COP(i,1))^2),sqrt((COP(i+1,2)-COP(i,2))^2 )];
end

%Length divided by samples/time taken
CLen = (CLen/l)*10;

%FFT of gyro-data:
FFTR = doGyroFFT(R,0);
FFTL = doGyroFFT(L,0);

%Split FFT into low, med and high frequencies (0-2.5 ,2.5-5 and 5-7.5):
% RLow = FFTR(2:58,:);
% RMed = FFTR(117:231,:);
% RHig = FFTR(115:172,:);

RLow = FFTR(2:111,:);
RHig = FFTR(111:171,:);

LLow = FFTL(2:110,:);
LHig = FFTL(111:171,:);

%Finding the distribution of frequencies. High frequency = lower score and
%vice-versa:
RFrqDist = (sum(RLow)-sum(RHig))/(sum(RLow)+sum(RHig));
LFrqDist = (sum(LLow)-sum(LHig))/(sum(LLow)+sum(LHig));

AvgFrqDist = mean([RFrqDist, LFrqDist]);

%Span of COP used to calculate score:
%CScore = (CLen/CSpan)*(1-AvgFrqDist);
%RScore = (RLen/RSpan)*(1-RFrqDist);
%LScore = (LLen/LSpan)*(1-LFrqDist);
Score = sum(CLen/CSpan)*(1-AvgFrqDist);

score = [Score]*10;%,CScore,RScore,LScore]*100;
CData = [sum(CLen),sum(CSpan),AvgFrqDist];
