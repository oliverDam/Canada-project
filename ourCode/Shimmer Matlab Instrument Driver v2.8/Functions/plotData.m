function plotData(axis1, press, legData, chestData, slider, checkbox)

cla(axis1);
slider = round(slider);
plot(0,axis1);
hold on;
press = press*6;

for i=1:4
    if (checkbox(i) == 1) && (i ~= 4)
        plot(axis1,legData(slider(1):slider(2),i));
    end
    if (checkbox(i+3) == 1) && (i ~= 4)
        plot(axis1,chestData(slider(3):slider(4),i));
    end
    if checkbox(i+6) == 1
        plot(axis1,press(slider(5):slider(6),i));
    end
end