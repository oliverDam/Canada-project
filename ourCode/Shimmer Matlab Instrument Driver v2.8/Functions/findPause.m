function [movement] = findPause(legData,chestData,press)%,headFile)

%% This takes input from 2 different sensors and splits it up into acitve
%  and passive segments. The input should be in the form of two matrices
%  containing the accelerometer data.

time = (0:1:length(legData)-1)/100;
timeLeg = time;
timeChest = time;

legData = normalizeData(legData,'mea');
chestData = normalizeData(chestData,'mea');
%headData = normalizeData(headData);

[~,moveLeg] = getThreshold2(legData,press,[30,0.4,0.9]);
[~,moveChest] = getThreshold2(chestData,press,[30,0.4,0.9]);
%[~,moveHead] = getThreshold(headData,[15,0.9]);

figure;
subplot(2,2,1)
plot(timeLeg,legData(:,1));
hold on;
plot(timeLeg,legData(:,2));
plot(timeLeg,legData(:,3));
plot(timeLeg,moveLeg*30000);
title('Leg');

subplot(2,2,2)
plot(timeLeg,moveLeg);
hold on;
plot(timeChest,moveChest)
axis([0 timeLeg(end)+10 -0.05 1.05]);
title('Individual Movements');

% subplot(2,2,2)
% plot(timeHead,headData(:,1));
% hold on;
% plot(timeHead,headData(:,2));
% plot(timeHead,headData(:,3));
% plot(timeHead,moveHead*30000);
% title('Head');

subplot(2,2,3)
plot(timeChest,chestData(:,1));
hold on;
plot(timeChest,chestData(:,2));
plot(timeChest,chestData(:,3));
plot(timeChest,moveChest*30000);
title('Chest');

if length(moveLeg) <= length(moveChest)
    L = length(moveLeg)-1;
else
    L = length(moveChest)-1;
end

[~,movement] = getThreshold([moveLeg(1:L),moveLeg(1:L),moveChest(1:L)],[30,0.3]);
%[~,movement] = getThreshold([moveLeg(1:4300),moveHead(1:4300),moveChest(1:4300)],[15,0.5]);

subplot(2,2,4)
plot(timeLeg(1:L),movement*max(legData(:,1)));
hold on;
plot(timeLeg(1:L),legData(1:L,1));
axis([0 timeLeg(end)+10 -0.05 max(legData(:,1))*1.1]);
title('Suspected movement times');