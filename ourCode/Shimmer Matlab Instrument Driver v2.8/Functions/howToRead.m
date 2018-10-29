%function [result] = howToRead(data) %kan ikke kalde funktionen fra command windu, men funktionen gør det den skal

fid = fopen('DATA.TXT','rt');%would like to have the 'DATA.TXT' part to be the function input

dataFile=fread(fid,'*char'); %read characters in data file
fclose(fid);                 %be gone!

dt = transpose(dataFile);
pat = {'\s+\n'};             %search match pattern (\s whitespace , \n newline)
s1 = regexp(dt,pat,'split'); %split at whitespaces and newlines
s2 = regexp(s1{1,1},';','split'); %splits at ; character
s2(1) = [];                  %help. pls make gone
s2(length(s2)) = [];         %this also gone. pls. thx. bye.
result = s2;
%needs return argument (??)


%how to access data in results:
%   do like: result{1,y} for the y'th number of timestep cell
%how to access data for specific timesteps
%   do like: result{1,y}{xx,yy}
%x is always =1

