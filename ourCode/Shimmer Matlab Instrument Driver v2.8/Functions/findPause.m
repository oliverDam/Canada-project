function [movement] = findPause(legFile,chestFile)%,headFile)

%% This takes input from 3 different sensors and splits it up into acitve
%  and passive segments. The input should be in the form of three strings
%  containing the names of the data files with accelerometer data.

A = importdata(legFile);
legData = A.data(:,2:4);
timeLeg = getTime(A.data(:,1));
A = importdata(chestFile);
chestData = A.data(:,2:4);
timeChest = getTime(A.data(:,1));
% A = importdata(headFile);
% headData = A.data(:,2:4);
% timeHead = getTime(A.data(:,1));

legData = normalizeData(legData);
chestData = normalizeData(chestData);
%headData = normalizeData(headData);

[~,moveLeg] = getThreshold(legData,[20,0.8]);
[~,moveChest] = getThreshold(chestData,[25,0.9]);
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
axis([0 timeLeg(end)+10 -0.5 1.5]);
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

[~,movement] = getThreshold([moveLeg(1:4300),moveLeg(1:4300),moveChest(1:4300)],[15,0.5]);
%[~,movement] = getThreshold([moveLeg(1:4300),moveHead(1:4300),moveChest(1:4300)],[15,0.5]);

subplot(2,2,4)
plot(timeLeg(1:4300),movement);
hold on;
axis([0 timeLeg(end)+10 -0.5 1.5]);
title('Suspected movement times');