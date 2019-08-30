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
    
    switch tokens.format_image
        case {'dat', 'bmp', 'ras', 'ppm', 'pgm', 'tif', 'jpg'}
        otherwise
            clear calDir imageDir images expr tokens
            error('Invalid image format selected.  Use other images or expand ''data_calib.m'' to include other formats.')
    end
    
    calib_name = tokens.calib_name;
    format_image = tokens.format_image;
    clear tokens
    

check_directory;

%string_save = 'save calib_data n_ima type_numbering N_slots image_numbers format_image calib_name first_num';
%eval(string_save);

% if Nima_valid
% Reading images:
    ima_read_calib; % may be launched from the toolbox itself

% Show all the calibration images:
    if ~isempty(ind_read)
        mosaic;
    end

