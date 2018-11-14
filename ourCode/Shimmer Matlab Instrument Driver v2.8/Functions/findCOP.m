function [COP] = findCOP(movement, pressure)

%%Go for log in this stuff!
%%Make something that says "if movement is yes and pressure on one foot is
%%higher than other foot, then we only stand on one foot otherwise we are
%%on two footses"

%Normalized pressure on each foot based on initial standstill:
%meanPress = mean(pressure(200:451));
%normPress = pressure-meanPress;
%p = log(pressure);
%p = normalizeData(pressure,'max');
p=pressure;

%Find COP hopefully
for i = 1:length(movement)
    
    
    for k = 1:6
        p(i,k) = p(i,k)/sum(p(i,:));
    end
    
    COP(i,1) = sum(p(i,1:3))-sum(p(i,4:6));
    
    %If we don't have movement the Y-direction depends on both feet:
    %if movement == 0
        COP(i,2) = sum(p(i,[1 4]))-sum(p(i,[2:3 5:6]));
    %else %Else it is calculated based on the y-load on a single foot:
    %    if sum(p(i,1:2)) >= sum(p(i,3:4))
    %        COP(i,2) = (p(i,1)-p(i,2))/sum(p(i,1:2));
    %    else
    %        COP(i,2) = p(i,3)-p(i,4)/sum(p(i,3:4));
    %    end
    %end
end