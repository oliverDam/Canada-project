function syncData(len)

[leg, chest, press, ~] = loadData();

len = round(len);

leg = leg(len(1):len(2),:);
chest = chest(len(3):len(4),:);
press = press(len(5):len(6),:);

L1 = length(leg);
L2 = length(chest);
L3 = length(press);

if (L1 <= L2) && (L1 <= L3)
    LF = L1;
elseif (L2 <= L1) && (L2 <= L3)
    LF = L2;
else
    LF = L3
end

leg = leg(1:LF,:);
chest = chest(1:LF,:);
press = press(1:LF,:);

save('leg.mat','leg');
save('chest.mat','chest');
save('press.mat','press');