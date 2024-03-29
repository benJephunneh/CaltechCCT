% Modified to improve code: 8 Aut 19 (CPM)

%if exist('images_read');
%   active_images = active_images & images_read;
%end;

% var2fix = 'dX_default';
% fixvariable;
% var2fix = 'dY_default';
% fixvariable;
% var2fix = 'map';
% fixvariable;

fixvariable('dX_default')
fixvariable('dY_default')
fixvariable('map')


if ~exist('n_ima')
    data_calib_lab_data;
end

check_active_images;

if ~exist(['I_' num2str(ind_active(1))], 'var')
    ima_read_calib_lab_data;
    if isempty(ind_read)
        disp('Cannot extract corners without images');
        return
    end
end


fprintf(1,'\nExtraction of the grid corners on the images\n');


if (~exist('map', 'var')), map = gray(256); end


if exist('dX', 'var')
    dX_default = dX;
end

if exist('dY', 'var')
    dY_default = dY;
end

if exist('n_sq_x', 'var')
    n_sq_x_default = n_sq_x;
end

if exist('n_sq_y', 'var')
    n_sq_y_default = n_sq_y;
end


if ~exist('dX_default', 'var') | ~exist('dY_default', 'var')
    
    % Setup of JY - 3D calibration rig at Intel (new at Intel) - use units in mm to match Zhang
    dX_default = 30;
    dY_default = 30;
    
    % Setup of JY - 3D calibration rig at Google - use units in mm to match Zhang
%     dX_default = 100;
%     dY_default = 100;
    
end


if ~exist('n_sq_x_default', 'var') | ~exist('n_sq_y_default', 'var')
    n_sq_x_default = 10;
    n_sq_y_default = 10;
end

if ~exist('wintx_default', 'var') | ~exist('winty_default', 'var')
    wintx_default = max(round(nx/128),round(ny/96));
    winty_default = wintx_default;
    clear wintx winty
end


if ~exist('wintx', 'var') | ~exist('winty', 'var')
    clear_windows; % Clear all the window sizes (to re-initiate)
end



if ~exist('dont_ask', 'var')
    dont_ask = 0;
end


if ~dont_ask
    ima_numbers = input('Number(s) of image(s) to process ([] = all images) = ');
else
    ima_numbers = [];
end

if isempty(ima_numbers)
    ima_proc = 1:n_ima;
else
    ima_proc = ima_numbers;
end


% Useful option to add images:
kk_first = ima_proc(1); %input('Start image number ([]=1=first): ');


if exist(['wintx_' num2str(kk_first)], 'var')
    
    eval(['wintxkk = wintx_' num2str(kk_first) ';']);
    
    if isempty(wintxkk) | isnan(wintxkk)
        
        disp('Window size for corner finder (wintx and winty):');
        wintx = input(['wintx ([] = ' num2str(wintx_default) ') = ']);
        if isempty(wintx), wintx = wintx_default; end
        wintx = round(wintx);
        winty = input(['winty ([] = ' num2str(winty_default) ') = ']);
        if isempty(winty), winty = winty_default; end
        winty = round(winty);
        
        fprintf(1,'Window size = %dx%d\n',2*wintx+1,2*winty+1);
        
    end
    
else
    
    disp('Window size for corner finder (wintx and winty):');
    wintx = input(['wintx ([] = ' num2str(wintx_default) ') = ']);
    if isempty(wintx), wintx = wintx_default; end
    wintx = round(wintx);
    winty = input(['winty ([] = ' num2str(winty_default) ') = ']);
    if isempty(winty), winty = winty_default; end
    winty = round(winty);
    
    fprintf(1,'Window size = %dx%d\n',2*wintx+1,2*winty+1);
    
end


if ~dont_ask
    fprintf(1,'Do you want to use the automatic square counting mechanism (0=[]=default)\n');
    manual_squares = input('  or do you always want to enter the number of squares manually (1,other)? ');
    if isempty(manual_squares)
        manual_squares = 0;
    else
        manual_squares = ~~manual_squares;
    end
else
    manual_squares = 0;
end


for kk = ima_proc
    if exist(['I_' num2str(kk)])
        click_ima_calib;
        active_images(kk) = 1;
    else
        eval(['dX_' num2str(kk) ' = NaN;']);
        eval(['dY_' num2str(kk) ' = NaN;']);  
        
        eval(['wintx_' num2str(kk) ' = NaN;']);
        eval(['winty_' num2str(kk) ' = NaN;']);
        
        eval(['x_' num2str(kk) ' = NaN*ones(2,1);']);
        eval(['X_' num2str(kk) ' = NaN*ones(3,1);']);
        
        eval(['n_sq_x_' num2str(kk) ' = NaN;']);
        eval(['n_sq_y_' num2str(kk) ' = NaN;']);
    end
end


check_active_images;



% Fix potential non-existing variables:

for kk = 1:n_ima
    if ~exist(['x_' num2str(kk)])
        eval(['dX_' num2str(kk) ' = NaN;']);
        eval(['dY_' num2str(kk) ' = NaN;']);  
        
        eval(['x_' num2str(kk) ' = NaN*ones(2,1);']);
        eval(['X_' num2str(kk) ' = NaN*ones(3,1);']);
        
        eval(['n_sq_x_' num2str(kk) ' = NaN;']);
        eval(['n_sq_y_' num2str(kk) ' = NaN;']);
    end
    
    if ~exist(['wintx_' num2str(kk)]) | ~exist(['winty_' num2str(kk)])
        
        eval(['wintx_' num2str(kk) ' = NaN;']);
        eval(['winty_' num2str(kk) ' = NaN;']);
        
    end
end

string_save = 'save calib_data active_images ind_active wintx winty n_ima type_numbering N_slots first_num image_numbers format_image calib_name Hcal Wcal nx ny map dX_default dY_default dX dY wintx_default winty_default';

for kk = 1:n_ima
    string_save = [string_save ' X_' num2str(kk) ' x_' num2str(kk) ' n_sq_x_' num2str(kk) ' n_sq_y_' num2str(kk) ' wintx_' num2str(kk) ' winty_' num2str(kk) ' dX_' num2str(kk) ' dY_' num2str(kk)];
end

eval(string_save);

disp('done');

return;

go_calib_optim;

