function [COP] = findCOP(movement, pressureFile)

pressure = readPressFile(pressureFile);

%Normalized pressure on each foot based on initial standstill:
meanPress = mean(pressure(200:451));
normPress = pressure-meanPress;

%Find COP hopefully
for i = 1:length(movement)
    
    COP(i,1) = normPress(1:2,i)-normPress(3:4,i);
    
    %If we have movement the Y-direction depends on both feet:
    if movement == 0
        COP(i,2) = normPress([1 3],i)-normPress([2 4],i);
    else %Else it is calculated based on the y-load on a single foot:
        if sum(normPress(1:2,i)) >= sum(normPress(3:4,i))
            COP(i,2) = normPress(1,i)-normPress(2,i);
        else
            COP(i,2) = normPress(3,i)-normPress(4,i);
        end
    end
end