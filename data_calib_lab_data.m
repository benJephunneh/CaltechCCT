% Modified to open lab data format. - 04/10/19 (DY)
% Modified to improve code: 7 Aug 19 (CPM)

%%% This script lets the user enter the name of the images (base name, numbering scheme,...

      
% Checks that there are some images in the directory:
% addpath(fullfile('J:','Tethers Unlimited','FabLab','Lab Data Functions'))

<<<<<<< HEAD
%-----Which directory?-----%
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
=======
owd = cd('cam/v'+string(camIndex));

l_ras = dir('*.ras');
s_ras = size(l_ras,1);
l_bmp = dir('*.bmp');
s_bmp = size(l_bmp,1);
l_tif = dir('*.tif');
s_tif = size(l_tif,1);
l_pgm = dir('*.pgm');
s_pgm = size(l_pgm,1);
l_ppm = dir('*.ppm');
s_ppm = size(l_ppm,1);
l_jpg = dir('*.jpg');
s_jpg = size(l_jpg,1);
l_jpeg = dir('*.jpeg');
s_jpeg = size(l_jpeg,1);
l_dat = dir('*.dat');
s_dat = size(l_dat,1);
>>>>>>> bcabd4dfe6ae46ccc99a7c5868c032dcce1972b6

try
    owd = cd(pathname);
catch ME
    clear camProj LRcamProj pathname owd
    error(ME.message)
end

%-----Are there image files?-----%
formats = {'dat'; 'ras'; 'bmp'; 'tif'; 'pgm'; 'ppm'; 'jpg'; 'jpeg'};
s_tot = 0;
for ii = 1:size(formats, 1)
    s_tot = s_tot + length(dir(['*.' formats{ii}]));
end
if s_tot < 1
<<<<<<< HEAD
    warning('No valid images found in this directory. Change directory and try again.')
    cd(owd)
    clear s_tot pathname camProj LRcamProj owd formats
    return
=======
    warning('No images in this directory in ras, bmp, tif, pgm, ppm, jp*g or dat format.')
%    fprintf(1,'No images in this directory in either ras, bmp, tif, pgm, ppm, jpg or dat format.\n');
   return
>>>>>>> bcabd4dfe6ae46ccc99a7c5868c032dcce1972b6
end
clear s_tot pathname camProj LRcamProj formats

%-----Which image files?-----%
dir
Nima_valid = 0;
% while ~Nima_valid % CPM: Prefer to quit script if nothing found.  It's easy enough to click the button again in the GUI.
calib_name = input('Prefix of file numbering (e.g. ''color01.dat'' is ''color'', ''c'', ''col'', etc.; ''001.dat'' is blank):  ', 's');
%     format_image = '0';
%     while strcmp(format_image, '0')
format_image =  input('Image format: (''r''=''ras'', ''b''=''bmp'', ''t''=''tif'', ''p''=''pgm'', ''j''=''jpg'', ''m''=''ppm'', ''d''=''dat'') ', 's');
switch lower(format_image)
    case 'm'
        format_image = 'ppm';
    case 'b'
        format_image = 'bmp';
    case 't'
        format_image = 'tif';
    case 'p'
        format_image = 'pgm';
    case 'j'
        format_image = 'jpg';
    case 'r'
        format_image = 'ras';
    case 'g'
        format_image = 'jpeg';
    case 'd'
        format_image = 'dat';
    otherwise
        fprintf('\nInvalid image format specified.\n');
        cd(owd)
        clear calib_name format_image owd
        return
end

<<<<<<< HEAD
%-----Find image files-----%
% CPM: Demand 'calib_name' come at beginning of filename:
l = dir([calib_name '*.' format_image]);
if isempty(l)
    fprintf('\nNo images found matching those specifications.\n')
    cd(owd)
    clear calib_name format_image owd l
    return
=======
while ~Nima_valid
    calib_name = input('\nBasename camera calibration images (with neither number nor suffix): ','s');
    format_image = '0';
   
    while strcmp(format_image, '0')
        format_image =  input('\nImage format: (''r''=''ras'', ''b''=''bmp'', ''t''=''tif'', ''p''=''pgm'', ''j''=''jpg'', ''m''=''ppm'', ''d''=''dat'') ', 's');
        
        if ~isempty(format_image)
            switch lower(format_image)
                case 'm'
                    format_image = 'ppm';
                case 'b'
                    format_image = 'bmp';
                case 't'
                    format_image = 'tif';
                case 'p'
                    format_image = 'pgm';
                case 'j'
                    format_image = 'jpg';
                case 'r'
                    format_image = 'ras';
                case 'g'
                    format_image = 'jpeg';
                case 'd'
                    format_image = 'dat';
                otherwise
                    disp('Invalid image format specified.');
                    format_image = '0';
            end
        else
            disp('No format specified')
            format_image = '0';
        end
    end
    
    dir_listing = ls(sprintf('%s*.%s', calib_name, lower(format_image)));
    
    check_directory_lab_data; % The source of the legendary 'n_ima' variable.
    
>>>>>>> bcabd4dfe6ae46ccc99a7c5868c032dcce1972b6
end
l = {l(:).name}; % CPM: Strip 'dir' listing. Only the filenames are important.

check_directory_lab_data
%string_save = 'save calib_data n_ima type_numbering N_slots image_numbers format_image calib_name first_num';
%eval(string_save);
if Nima_valid
    % Reading images:
    ima_read_calib_lab_data % May be launched from the toolbox itself
    % Show all the calibration images:
    if ~isempty(ind_read)
        mosaic
    end
end

cd(owd)
<<<<<<< HEAD
=======

>>>>>>> bcabd4dfe6ae46ccc99a7c5868c032dcce1972b6
