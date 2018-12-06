%%Plots data from the walk test. For use with data: 'OliverWalkTestDATA2'.
%Change cutting of data in line 6 if not used with test walk data

function [result] = doWalkTestPlot(data)
a = scatter(0,0);
data = table2array(data(1950:5000,2:7)); %change this is not used with test data
                                         %will cut data wrong
dataCOP = findCOP(data);

axis tight manual 
set(gca,'nextplot','replacechildren');


v = VideoWriter('FSRplot.avi'); %file is saved to root of 'Canada-project'
open(v);

figure(1);
ax1 = axes;
ax2 = axes;
set(ax1,'Visible','off')
set(ax2,'Visible','off')

        hold on; %creates background of feet with FSR placement
        I = imread('FSR4plot.png');
        h = image(ax1,xlim,ylim,I);
        uistack(h,'down')

        
    for i = 1:length(dataCOP)
        
        delete(a);
        a = scatter(ax2,dataCOP(i,1),dataCOP(i,2),150,'filled','r');
        xlim([-2.2 -0.6])
        ylim([-1.9 -0.9])
        title(ax1,i)
        set(ax1,'XTickLabel',[]) %removes double numbers on axis
        set(ax1,'YTickLabel',[])
        
        
        frame = getframe(gcf); %saves plottet data to video frame
        writeVideo(v,frame);
        
    end
    close(v);
end
