function [pp,p] = bonferonnni(data)

[pp,~,stats] = anova1(data);

results = multcompare(stats,'CType','hsd');

p = results(:,end);