function [COP,COPR,COPL] = findCOP(p)

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
    COP(i,1) = sum(p(i,1:3))-sum(p(i,4:6));
    COP(i,2) = sum(p(i,[1 4]))-sum(p(i,[2:3 5:6]));
    
    %Left and right COP:
    COPR(i,1) = sum(p(i,1))-sum(p(i,2));
    COPR(i,2) = sum(p(i,[1:2]))-sum(p(i,3));
    COPL(i,1) = sum(p(i,4))-sum(p(i,5));
    COPL(i,2) = sum(p(i,[4:5]))-sum(p(i,6));
end