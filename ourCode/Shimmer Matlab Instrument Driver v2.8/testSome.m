function [COPM, COPS] = testSome(chest, leg, press)

m = findPause(leg,chest);

COP = findCOP(m,press);

COPM = [];
COPS = [];
for i=1:length(m)
    if m(i) == 1
        COPM = [COPM;COP(i,:)];
    else
        COPS = [COPS;COP(i,:)];
    end
end

figure;
subplot(2,1,1);
plot(COPM(:,1),COPM(:,2));
subplot(2,1,2);
plot(COPS(:,1),COPS(:,2));