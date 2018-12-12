function [score,CData] = stabilityOfCOP(right,left,press)

%%Gives a score to describe the stability of COP while taking the max
% deviations and time taken to perform the movements into consideration.
% Input should be 3 matrices, where left and right are nx3 gyroscope
% readings, and press is a nx6 pressure reading matrix.
%
% [score] = stabilityOfCOP(right,left,press)

%Filtering signals:
fc = 1.25;
fs = 100;
R = doButter(right,3,fc,fs);
L = doButter(left,3,fc,fs);
fc = 2.5;
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

%Intensity of movements:
%intense = mean([sum(abs(right))/l,sum(abs(left))/l])/10000;

highIntensity = 0;
meen = [mean(abs(right)),mean(abs(left))];
eigil = [abs(right),abs(left)];
for i=1:l
    for j=1:6
        if meen(j) <= eigil(i,j)
            highIntensity(i,j) = 1;
        else
            highIntensity(i,j) = 0;
        end
    end
end

highIntensity = mean(sum(highIntensity.*[abs(right),abs(left)])./sum([abs(right),abs(left)]));

%highIntensity = mean(mean(highIntensity));

%Split FFT into low, med and high frequencies (0-2.5 ,2.5-5 and 5-7.5):
% RLow = FFTR(2:110,:);
% RHig = FFTR(111:171,:);
% Small movements = high frequencies and big movements = low frequencies.

RLow = FFTR(2:19,:);
RHig = FFTR(20:39,:);

LLow = FFTL(2:19,:);
LHig = FFTL(20:39,:);

%Finding the distribution of frequencies. High frequency = lower score and
%vice-versa:
RFrqDist = (sum(RLow)-sum(RHig))/(sum(RLow)+sum(RHig));
LFrqDist = (sum(LLow)-sum(LHig))/(sum(LLow)+sum(LHig));

AvgFrqDist = mean([RFrqDist, LFrqDist]);

%Span of COP used to calculate score:
%CScore = (CLen/CSpan)*(1-AvgFrqDist);
%RScore = (RLen/RSpan)*(1-RFrqDist);
%LScore = (LLen/LSpan)*(1-LFrqDist);
Score = sum((1-CLen)/CSpan)*(1-AvgFrqDist)*(1-highIntensity);
score = [Score]*10;%,CScore,RScore,LScore]*100;
CData = [sum(CLen),sum(CSpan),AvgFrqDist,highIntensity];
