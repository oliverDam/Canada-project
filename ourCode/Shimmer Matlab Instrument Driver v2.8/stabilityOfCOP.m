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

%FFT of gyro-data:
FFTR = doGyroFFT(R,0);
FFTL = doGyroFFT(L,0);

%Split FFT into low, med and high frequencies (0-2.5 ,2.5-5 and 5-7.5):
RLow = FFTR(2:116,:);
RMed = FFTR(117:231,:);
RHig = FFTR(232:346,:);

LLow = FFTL(2:116,:);
LMed = FFTL(117:231,:);
LHig = FFTL(232:346,:);

%Finding the distribution of frequencies. High frequency = lower score and
%vice-versa:
RFrqDist = ((sum(RMed)+sum(RLow)-sum(RHig))/...
    (sum(RMed)+sum(RLow)+sum(RHig)));
LFrqDist = ((sum(LMed)+sum(LLow)-sum(LHig))/...
    (sum(LMed)+sum(LLow)+sum(LHig)));

AvgFrqDist = mean([RFrqDist, LFrqDist]);

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

%Max span: might be unusable 
CSpan = abs(sum((CMax-CMin)/(sum(COP)/L)));
RSpan = abs(sum((RMax-RMin)/(sum(COPR)/L)));
LSpan = abs(sum((LMax-LMin)/(sum(COPL)/L)));

% CSpan = sum(scaleData(CMax-CMin,0,1));
% RSpan = sum(scaleData(RMax-RMin,0,1));
% LSpan = sum(scaleData(LMax-LMin,0,1));

%Rescale for comparability of length:
ScCOP = scaleData(COP,0,1);
ScCOPR = scaleData(COPR,0,1);
ScCOPL = scaleData(COPL,0,1);

%Length of COP:
CLen = 0;
RLen = 0;
LLen = 0;

for i = 1:L-1
CLen = CLen + sqrt( (ScCOP(i+1,1)-ScCOP(i,1))^2 + (ScCOP(i+1,2)-ScCOP(i,2))^2 );
RLen = RLen + sqrt( (ScCOPR(i+1,1)-ScCOPR(i,1))^2 + (ScCOPR(i+1,2)-ScCOPR(i,2))^2 );
LLen = LLen + sqrt( (ScCOPL(i+1,1)-ScCOPL(i,1))^2 + (ScCOPL(i+1,2)-ScCOPL(i,2))^2 );
end

%Length divided by samples/time taken
CLen = CLen/L;
RLen = RLen/L;
LLen = LLen/L;

%Span of COP used to calculate score:
CScore = (CLen/CSpan)*AvgFrqDist;
RScore = (RLen/RSpan)*RFrqDist;
LScore = (LLen/LSpan)*LFrqDist;

score = [CScore,RScore,LScore]*1000;
CData = [CLen,CSpan,AvgFrqDist];
