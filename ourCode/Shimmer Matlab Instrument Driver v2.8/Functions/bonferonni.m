function [pp,p] = bonferonni(data)

[pp,~,stats] = kruskalwallis(data);

results = multcompare(stats,'CType','hsd');

p = results(:,end);