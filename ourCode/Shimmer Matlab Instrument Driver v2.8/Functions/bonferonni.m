function [pp,p] = bonferonni(data,lol)

[pp,~,stats] = friedman(data,lol);

results = multcompare(stats,'CType','hsd');

p = results(:,end);