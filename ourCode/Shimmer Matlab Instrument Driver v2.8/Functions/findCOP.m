function [COP] = findCOP(p)

%% Function finds COP for entire body, plus the COP for each foot. Input is
%  a nx6 pressure reading matrix.
%
% [COP,COPR,COPL] = findCOP(p)

%Find COP hopefully
for i = 1:length(p)
    
    
    for k = 1:6
        p(i,k) = p(i,k)/sum(p(i,:));
    end
    
    %COP for both feet:
%     COP(i,1) = sum(p(i,1:3).*[0.6 0.4 1])-sum(p(i,4:6).*[0.6 0.4 1]);
%     COP(i,2) = sum(p(i,[1:2 4:5]).*[0.6 0.4 0.6 0.4])-sum(p(i,[3 6]));
    COP(i,1) = sum(p(i,1:3).*[1.1 0.9 2])-sum(p(i,4:6).*[1.1 0.9 2]);
    COP(i,2) = sum(p(i,[1:2 4:5]).*[1.1 0.9 1.1 0.9])-sum(p(i,[3 6])*2);
    
end

COP = [COP(:,1)-mean(COP(:,1)),COP(:,2)-mean(COP(:,2))];