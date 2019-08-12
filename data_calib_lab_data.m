% Modified to open lab data format. - 04/10/19 (DY)
% Modified to improve code: 7 Aug 19 (CPM)

%%% This script lets the user enter the name of the images (base name, numbering scheme,...

      
% Checks that there are some images in the directory:
% addpath(fullfile('J:','Tethers Unlimited','FabLab','Lab Data Functions'))

l_dat = dir('*.dat');
s_dat = size(l_dat,1);
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

s_tot = s_ras + s_bmp + s_tif + s_pgm + s_jpg + s_ppm + s_jpeg + s_dat;

if s_tot < 1
    warning('No images in this directory in ras, bmp, tif, pgm, ppm, jpg or dat format. Change directory and try again.')
%    fprintf(1,'No images in this directory in either ras, bmp, tif, pgm, ppm, jpg or dat format. Change directory and try again.\n');
   return
end

% IF yes, display the directory content:
dir

Nima_valid = 0;

while ~Nima_valid
    calib_name = input('\nBasename camera calibration images (with neither number nor suffix): ','s');
    format_image = '0';
   
    while strcmp(format_image, '0')
        format_image =  input('Image format: (''r''=''ras'', ''b''=''bmp'', ''t''=''tif'', ''p''=''pgm'', ''j''=''jpg'', ''m''=''ppm'', ''d''=''dat'') ', 's');
        
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
                    disp('Invalid or no image format specified.');
                    format_image = '0';
            end
        else
            disp('No format specified')
            format_image = '0';
        end
    end
    
    dir_listing = ls(sprintf('%s*.%s', calib_name, lower(format_image)));
    
    check_directory_lab_data;
%     if ~isempty(dir_listing)
%         Nima_valid = size(dir_listing,1);
%     else
%         disp('No images found.  Basename correct?')
%     end
end

%string_save = 'save calib_data n_ima type_numbering N_slots image_numbers format_image calib_name first_num';

%eval(string_save);

if Nima_valid
    % Reading images:
    ima_read_calib_lab_data % May be launched from the toolbox itself
    % Show all the calibration images:
    if ~isempty(ind_read)
        mosaic;
    end
end

