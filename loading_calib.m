% Modified: 23 Aug 19 (CPM)

camProj = input('[C]amera or [p]rojector calibration: ', 's');
LRcamProj = input('[L]eft or [r]ight camera: ', 's');

switch lower(camProj(1))
    case 'c'
        if strcmpi(LRcamProj(1), 'l')
            pathname = 'cam/v1';
        elseif strcmpi(LRcamProj(1), 'r')
            pathname = 'cam/v2';
        else
            warning('Invalid specification.')
            return
        end
    case 'p'
        if strcmpi(LRcamProj(1), 'l')
            pathname = 'proj/v1';
        elseif strcmpi(LRcamProj(1), 'r')
            pathname = 'proj/v2';
        else
            warning('Invalid specification.')
            return
        end
    otherwise
        disp('Invalid specification')
        return
end

try
    owd = cd(pathname);
catch ME
    clear camProj LRcamProj pathname
    error(ME.message)
end

try
    disp('Loading calibration results from Calib_Results.mat...');
    load Calib_Results
    disp(['Results loaded from ' pathname '.'])
catch ME
    warning(ME.message)
end

cd(owd)
clear pathname camProj LRcamProj owd

% if ~exist('Calib_Results.mat', 'file')
%     fprintf(1,'\nCalibration file Calib_Results.mat not found!\n');
%     cd(owd)
%     return
% end
% 
% clear
% fprintf(1,'\nLoading calibration results from Calib_Results.mat\n');
% 
% load Calib_Results