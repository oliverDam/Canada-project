function syncData(len)

[right, left, press, ~] = loadData();

len = round(len);

right = right(len(1):len(2),:);
left = left(len(3):len(4),:);
press = press(len(5):len(6),:);

L1 = length(right);
L2 = length(left);
L3 = length(press);

if (L1 <= L2) && (L1 <= L3)
    LF = L1;
elseif (L2 <= L1) && (L2 <= L3)
    LF = L2;
else
    LF = L3
end

right = right(1:LF,:);
left = left(1:LF,:);
press = press(1:LF,:);

save('right.mat','right');
save('left.mat','left');
save('press.mat','press');