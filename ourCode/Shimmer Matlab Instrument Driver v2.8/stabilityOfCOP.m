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
[COP,COPR,COPL] = findCOP(P);

%Rescale for comparability of length:
ScCOP = scaleData(COP,0,1);
ScCOPR = scaleData(COPR,0,1);
ScCOPL = scaleData(COPL,0,1);

%Length, max/min and mean values of COP:
l = length(COP);

CMin = min(COP);
RMin = min(COPR);
LMin = min(COPL);

CMax = max(COP);
RMax = max(COPR);
LMax = max(COPL);

% CMean = mean(COP);
% RMean = mean(COPR);
% LMean = mean(COPL);

%Max span: might be unusable 
% CSpan = abs(sum((CMax-CMin)/(sum(ScCOP)/l)))/10;
% RSpan = abs(sum((RMax-RMin)/(sum(ScCOPR)/l)))/10;
% LSpan = abs(sum((LMax-LMin)/(sum(ScCOPL)/l)))/10;

CSpan = abs(sum(CMax-CMin))/10;
RSpan = abs(sum(RMax-RMin))/10;
LSpan = abs(sum(LMax-LMin))/10;

%Length of COP:
CLen = 0;
RLen = 0;
LLen = 0;

for i = 1:l-1
CLen = CLen + sqrt( (COP(i+1,1)-COP(i,1))^2 + (COP(i+1,2)-COP(i,2))^2 );
RLen = RLen + sqrt( (COPR(i+1,1)-COPR(i,1))^2 + (COPR(i+1,2)-COPR(i,2))^2 );
LLen = LLen + sqrt( (COPL(i+1,1)-COPL(i,1))^2 + (COPL(i+1,2)-COPL(i,2))^2 );
end

%Length divided by samples/time taken
CLen = (CLen/l)*10;
RLen = (RLen/l)*10;
LLen = (LLen/l)*10;

%FFT of gyro-data:
FFTR = doGyroFFT(R,0);
FFTL = doGyroFFT(L,0);

%Split FFT into low, med and high frequencies (0-2.5 ,2.5-5 and 5-7.5):
RLow = FFTR(2:116,:);
RMed = FFTR(117:231,:);
RHig = FFTR(232:346,:);

LLow = FFTL(2:101,:);
LMed = FFTL(102:201,:);
LHig = FFTL(202:301,:);

%Finding the distribution of frequencies. High frequency = lower score and
%vice-versa:
RFrqDist = ((sum(RMed)+sum(RLow)-sum(RHig))/...
    (sum(RMed)+sum(RLow)+sum(RHig)));
LFrqDist = ((sum(LMed)+sum(LLow)-sum(LHig))/...
    (sum(LMed)+sum(LLow)+sum(LHig)));

AvgFrqDist = mean([RFrqDist, LFrqDist]);

%Span of COP used to calculate score:
CScore = (CLen/CSpan)*(1-AvgFrqDist);
RScore = (RLen/RSpan)*(1-RFrqDist);
LScore = (LLen/LSpan)*(1-LFrqDist);

score = [CScore,RScore,LScore]*100;
CData = [CLen,CSpan,AvgFrqDist];
