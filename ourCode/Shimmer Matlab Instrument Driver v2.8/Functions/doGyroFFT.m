%fft of gyroscopes
function [result] = doGyroFFT(data)

% data(1) = data1;
% data(2) = data2;
% data(3) = data3;
[L,S] = size(data);
Fs = 100;
T = 1/Fs;
t = (0:L-1)*T;

for i = 1:S
    
    Y(:,i) = fft(data(:,i));
    P2 = abs(Y(:,i)/L);
    P1(:,i) = P2(1:L/2+1);
    P1(2:end-1,i) = 2*P1(2:end-1,i);
    
end
    f = Fs*(0:(L/2))/L;
    
    xlimits = [0 15];
    ylimits = [0 3000];
    
    figure;
    subplot(S,1,1)
    plot(f,P1(:,1),'b')
    legend('X')
    xlim(xlimits)
    ylim(ylimits)
    subplot(S,1,2)
    plot(f,P1(:,2),'r')
    legend('Y')
    xlim(xlimits)
    ylim(ylimits)
    try
        subplot(S,1,3)
        plot(f,P1(:,3),'g')
        legend('Z')
        xlim(xlimits)
        ylim(ylimits)
    catch
        lol = 420;
    end