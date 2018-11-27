function [COP,COPR,COPL] = findCOP(movement, p)

%%Go for log in this stuff!
%%Make something that says "if movement is yes and pressure on one foot is
%%higher than other foot, then we only stand on one foot otherwise we are
%%on two footses" or maybe not

%Find COP hopefully
for i = 1:length(movement)
    
    
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