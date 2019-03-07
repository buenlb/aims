function [data,x,y,z] = read3DAims(filename,plots)

if nargin == 1
    plots = 1;
end

if ~strcmp(filename(end-2:end),'snq')
    disp('INFO: Appending .snq')
    filename = [filename,'.snq'];
end

%% Figure out if there is a directory path in filename
if contains(filename,'/') || contains(filename, '\')
    idx = strfind(filename,'/');
    idx2 = strfind(filename, '\');
    idx = max([idx,idx2]);
    fileDir = filename(1:idx);
    filename = filename((idx+1):end);
else
    fileDir = pwd;
end

%% Find z-axis
% Strangely, the AIMS header does not give information on the third axis in
% the scan so we have to pull that information from the filenames.
files = dir([fileDir,filename(1:end-4),'*']);

curIdx = 1;
for ii = 1:length(files)
    if strcmp(files(ii).name, filename)
        continue
    end
    z(curIdx) = str2double(files(ii).name(end-9:end-4));
    plane{curIdx} = files(ii).name;
    curIdx = curIdx+1;
end

%% Read the header to find x y parameters
text = fileread([fileDir,filename]);
p = regexp(text, 'First Points');
nx = findNextNumber(text,p);
p = regexp(text, 'First Start Position');
sx = findNextNumber(text,p);
p = regexp(text, 'First End Position');
ex = findNextNumber(text,p);

p = regexp(text, 'Second Points');
ny = findNextNumber(text,p);
p = regexp(text, 'Second Start Position');
sy = findNextNumber(text,p);
p = regexp(text, 'Second End Position');
ey = findNextNumber(text,p);

x = linspace(sx,ex,nx);
y = linspace(sy,ey,ny);

%% Loop through each plane and load the corresponding scan data
data = zeros(length(y),length(x),length(z));
for ii = 1:length(plane)
    disp(['Reading file ', plane{ii}]);
    data(:,:,ii) = readAIMS(plane{ii},0,fileDir);
end

if plots
    cols = floor(sqrt(length(plane)));
    rows = ceil(sqrt(length(plane)));
    if cols*rows < length(plane)
        cols = cols+1;
    end
    h = figure;
    for ii = 1:length(plane)
        subplot(rows,cols,ii)
        imagesc(x,y,data(:,:,ii))
        title(['z=',num2str(z(ii)),'mm'])
    end
end

