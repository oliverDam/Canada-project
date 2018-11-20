function [legData, chestData, press, L] = loadData()

A = importdata("legg90sec.dat");
B = importdata('chestg90sec.dat');
press = importdata('DATA.TXT');
legData = A.data(:,2:4);
chestData = B.data(:,2:4);
press = press(:,2:7);
L(1) = length(legData(:,1));
L(2) = length(chestData(:,1));
L(3) = length(press(:,1));