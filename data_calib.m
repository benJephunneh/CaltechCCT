<<<<<<< HEAD
%%%----- This script requests the user to specify which images to use -----%%%
% Use GUIs to get images:
    calDir = uigetdir('c:/FABLAB/MATLAB/Brown', 'Select the desired ''calib'' directory');
    [images, imageDir] = uigetfile({'*.dat;*.bmp;*.ras;*.ppm;*.pgm;*.tif;*.jpg', 'All image files (*.dat, *.bmp, *.ras, *.ppm, *.pgm, *.tif, *.jpg)'; ...
                                       '*.dat', 'Lab data (*.dat)'; ...
                                       '*.bmp', 'Bitmap (*.bmp)'; ...
                                       '*.ras', 'Raster (*.ras)'; ...
                                       '*.ppm', 'Portable PixMap (*.ppm)'; ...
                                       '*.pgm', 'Portable GrayMap (*.pgm)'; ...
                                       '*.tif', 'Tiff (*.tif)'; ...
                                       '*.jpg', 'JPEG (*.jpg)'}, ...
                                       'Select consecutively numbered images for calibration', ...
                                       calDir, ...
                                       'MultiSelect', 'on');

    if isa(images, 'double') && ~images
        clear calDir imageDir images
        error('No images selected')
    end

% Extract 'calib_name' and 'format_image' variables:
    expr = '(?<calib_name>\D*?\w*?\D*?)\d+\.(?<format_image>\w+$)';
    tokens = regexpi(images{1}, expr, 'names');
=======
%%% This script alets the user enter the name of the images (base name, numbering scheme,...

      
% Checks that there are some images in the directory:
addpath(fullfile('J:','Tethers Unlimited','FabLab','Lab Data Functions'))

l_lab = dir('*');
s_lab = size(l_lab,1);
l_ras = dir('*ras');
s_ras = size(l_ras,1);
l_bmp = dir('*bmp');
s_bmp = size(l_bmp,1);
l_tif = dir('*tif');
s_tif = size(l_tif,1);
l_pgm = dir('*pgm');
s_pgm = size(l_pgm,1);
l_ppm = dir('*ppm');
s_ppm = size(l_ppm,1);
l_jpg = dir('*jpg');
s_jpg = size(l_jpg,1);
l_jpeg = dir('*jpeg');
s_jpeg = size(l_jpeg,1);

s_tot = s_ras + s_bmp + s_tif + s_pgm + s_jpg + s_ppm + s_jpeg + s_lab;

if s_tot < 1
   fprintf(1,'No image in this directory in either ras, bmp, tif, pgm, ppm or jpg format. Change directory and try again.\n');
   return
end


% IF yes, display the directory content:

dir

Nima_valid = 0;

while ~Nima_valid % == 0
  
    fprintf(1,'\n');
    calib_name = input('Basename camera calibration images (without number nor suffix): ','s');
    
    format_image = '0';
    
    while strcmpi(format_image, '0')
   
        format_image =  input('Image format: ([]=''r''=''ras'', ''b''=''bmp'', ''t''=''tif'', ''p''=''pgm'', ''j''=''jpg'', ''m''=''ppm'', ''l''=''lab data'') ','s');
		
        if isempty(format_image)
            disp('No format selected.')
            format_image = '0';
            pause(0.5)
        else
            switch lower(format_image)
                case 'm'
                    format_image = 'ppm';
                case 'p'
                    format_image = 'pgm';
                case 'b'
                    format_image = 'bmp';
                case 't'
                    format_image = 'tif';
                case 'j'
                    format_image = 'jpg';
                case 'r'
                    format_image = 'ras';
                case 'g'
                    format_image = 'jpeg';
                otherwise
                    disp('Invalid format specified.')
                    format_image = '0';
                    pause(0.5)
            end
        end
%       else
%          if lower(format_image(1)) == 'b',
%             format_image = 'bmp';
%          else
%             if lower(format_image(1)) == 't',
%                format_image = 'tif';
%             else
%                if lower(format_image(1)) == 'p',
%                   format_image = 'pgm';
%                else
%                   if lower(format_image(1)) == 'j',
%                      format_image = 'jpg';
%                   else
%                      if lower(format_image(1)) == 'r',
%                         format_image = 'ras';
%                      else
%                          if lower(format_image(1)) == 'g',
%                              format_image = 'jpeg';
%                          else
%                              if lower(format_image(1)) == 'l',
%                                  format_image = 'txt';
%                              else
%                                 disp('Invalid image format');  %format_image = '0'; % Ask for format once again 
%                                 format_image = '0';
%                             end;
%                        end;
%                     end;
%                 end;
%               end;
%             end;
%          end;
%      end;
>>>>>>> bcabd4dfe6ae46ccc99a7c5868c032dcce1972b6
    
    switch tokens.format_image
        case {'dat', 'bmp', 'ras', 'ppm', 'pgm', 'tif', 'jpg'}
        otherwise
            clear calDir imageDir images expr tokens
            error('Invalid image format selected.  Use other images or expand ''data_calib.m'' to include other formats.')
    end
    
    calib_name = tokens.calib_name;
    format_image = tokens.format_image;
    clear tokens
    
<<<<<<< HEAD
=======
      
        check_directory;
    end
end
>>>>>>> bcabd4dfe6ae46ccc99a7c5868c032dcce1972b6

check_directory;

%string_save = 'save calib_data n_ima type_numbering N_slots image_numbers format_image calib_name first_num';
%eval(string_save);

<<<<<<< HEAD
% if Nima_valid
% Reading images:
    ima_read_calib; % may be launched from the toolbox itself

% Show all the calibration images:
    if ~isempty(ind_read)
        mosaic;
    end
=======


if Nima_valid % ~=0
    % Reading images:
    ima_read_calib % may be launched from the toolbox itself
    % Show all the calibration images:
    if ~isempty(ind_read)
        mosaic;
    end
end
>>>>>>> bcabd4dfe6ae46ccc99a7c5868c032dcce1972b6

