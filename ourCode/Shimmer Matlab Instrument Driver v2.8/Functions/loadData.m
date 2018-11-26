function [rightData, leftData, press, L] = loadData()

A = importdata("right90sec.dat");
B = importdata('left90sec.dat');
press = importdata('DATA.TXT');
rightData = A.data(:,2:4);
leftData = B.data(:,2:4);
press = press(:,2:7);
L(1) = length(rightData(:,1));
L(2) = length(leftData(:,1));
L(3) = length(press(:,1));