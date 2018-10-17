function result = getTime(time)

%% Returns time between samples - also works when counting up to a certain
%  value and restarting the counter from zero. Input should be a 1xm
%  matrix.

startTime = time(1);
newTime = time;
marker = 0;
markerval = 0;
realTime = 0;

for i=2:length(time)
    if time(i) <= time(i-1)
        markerval = markerval+1;
        marker = [marker; markerval];
    else
        marker = [marker; 0];
    end
end

for i=2:length(marker)
    if marker(i) >= 1
        newTime = time+time(i-1)*marker(i)+(time(i-1)-time(i-2));
    end
    realTime = [realTime; newTime(i)-startTime];
end

result = realTime/100000*3; 