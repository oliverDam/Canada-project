function [COP] = findCOP(movement, pressure)

%%Go for log in this stuff!

%Normalized pressure on each foot based on initial standstill:
meanPress = mean(pressure(200:451));
normPress = pressure-meanPress;

%Find COP hopefully
for i = 1:length(movement)
    
    COP(i,1) = sum(normPress(i,1:2))-sum(normPress(i,3:4));
    
    %If we have movement the Y-direction depends on both feet:
    if movement == 0
        COP(i,2) = sum(normPress(i,[1 3]))-sum(normPress(i,[2 4]));
    else %Else it is calculated based on the y-load on a single foot:
        if sum(normPress(i,1:2)) >= sum(normPress(i,3:4))
            COP(i,2) = normPress(i,1)-normPress(i,2);
        else
            COP(i,2) = normPress(i,3)-normPress(i,4);
        end
    end
end

