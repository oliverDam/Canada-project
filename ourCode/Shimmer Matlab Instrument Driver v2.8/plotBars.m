function plotBars(data,texts)

M = mean(data);
S = std(data);

figure;
hold on;
bar(1:3,M);
errorbar(1:3,M,S,'.');
smartStuff = title(texts);
smartStuff.FontSize = 20;
xticks([1 2 3]);
xticklabels({'Novice', 'Intermediate', 'Master'});
