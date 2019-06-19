% readOndaCal reads the calibration data from Onda in file and returns a
% set of frequency/calibration value pairs. 
% 
% @INPUTS
%   file: Onda calibration txt file to read
% 
% @OUTPUTS
%   f: Frequency (MHz) of calibration values
%   cal: calibration values in V/Pa
% 
% Taylor Webb
% University of Utah

function [f,cal] = readOndaCal(file)

fid = fopen(file,'r');
notFound = 1;
while notFound
    curLine = fgetl(fid);
    if contains(curLine,'HEADER_END')
        notFound = 0;
    end
end

idx = 1;
while ~feof(fid)
    curLine = fgetl(fid);
    a = sscanf(curLine,'%f',4);
    f(idx) = a(1);
    cal(idx) = a(3);
    idx = idx+1;
end

fclose(fid);