% Modified to look for lab data format. - 04/10/19 (DY)
% Modified: 18 Aug 19 (CPM)

% This small script looks in the directory and checks if the images are there. % CPM: Why, since that was already done?
% This works only on Matlab 5.x (otherwise, the dir commands works differently)

% (c) Jean-Yves Bouguet - Dec. 27th, 1999

% Nima_valid = 0;
% ind_valid = [];
% loc_extension = []; % This is too easy to calculate for a given file extension (i.e. strfind(filename, format_image))
indices = [];
string_length = [];

% CPM: Let's demand 'calib_name' come at the beginning of the filename, which reduces a lot of filename testing:
% l = dir(sprintf('%s*.%s', calib_name, format_image));

% CPM: Already done in 'data_calib_lab_data':
% if isempty(l)
%     disp('ERROR: No images of that filename prefix and format were found.')
%     return
% end
% l = {l(:).name}; % CPM: Removes everything but '.names' from directory listing

% CPM: Expression for regex-finding and splitting up '[\D]*\d*\.' in filename.
%      '[\D]*' is assigned to token.preNumb, '\d*' is assigned to token.numb.
% expr = '(^?<preNumb>\D*)(?<numb>\d+)\.';
expr = ['^' calib_name '(?<preNumb>.*?)(?<numb>\d*)\.']; % Tokens of 'col01_rect001.dat' are 'col01_rect' and '001'
for ii = 1:length(l)
    tokens = regexpi(l{ii}, expr, 'names'); % Searches for and tokenizes expression in a filename.
    if isempty(tokens) || ...
       isempty(tokens.numb)
           l{ii} = {};
           continue
    elseif isempty(calib_name) && any(tokens.preNumb) % tokens.preNumb isn't empty but should be
        l{ii} = {};
        continue
%        ~strcmpi(calib_name, tokens.preNumb) % Search expression not found in filename
%         l{ii} = {};
%         continue
    else
<<<<<<< HEAD
        Nima_valid = Nima_valid + 1
        indices = [indices ii]
        string_length = [string_length length(tokens.numb)];
    end
end

%     elseif strcmpi(tokens.preNumb, calib_name) % Test match, for example, of '[rect_d]001.dat' to calib_name.  Blank 'calib_name' fails strcmpi to 'rect_d'.
%         Nima_valid = Nima_valid + 1;
%         ind_valid = [ind_valid ii];
%         string_num = tokens.numb; % Never empty, according to regex search.
%         string_length = [string_length length(string_num)];
%         indices(ii) = str2num(string_num);
%         length_name = length(calib_name); % CPM: try to remove dependence.  I believe the variable is used in only this script.
%         iii = 1; % CPM: Try to remove dependence on this variable.  Irrelevant if calib_name is required to head the filename.
% %         loc_ext = strfind(l{ii}, '.') + 1; % CPM: Try to remove dependence on this variable.  For a given file extension, it's always known (i.e. end-length(format_image)), and the variable doesn't seem to be used for anything.
%         loc_ext = length(l{ii}) - length(format_image) + 1; % CPM: E.g. filename is 23 characters long, - length of 'jpeg' + 1 to index of 'j'.
%     end

% Nl = numel(l); % size(l,1);  For 'l=dir...', numel is OK.  For 'l=ls...', numel will not work.
% ind_valid = [];
% loc_extension = [];
% length_name = length(calib_name); % size(calib_name,2);
% iii = []; % Index to [nnnn] of calib_name[nnnn].format_image

% if Nl % > 0 % If the directory has calib_name* files... Unnecessary if you just do the 'dir' listing for 'calib_name*.format_image'
%     for pp = 1:Nl % for 1:# of 'calib_name*' files in directory
%         
%         filenamepp =  l{pp}; % Get a filename.
%         if isempty(calib_name) % If no basename specified...
%             iii = 1;
%         else
%             iii = strfind(filenamepp,calib_name); % Index to calib_name within filename. % CPM: Assumes calib_name can exist at some place other than at the beginning of the filename.  This creates some coding difficulty, though.
%         end
% 
%         
%         
%         [string_num, ~] = regexpi(filenamepp, '\d*\.', 'match', 'split'); % Looks for only numbers before '.' in filename
%         string_num = string_num{1}(1:end-1) % Remove '.'
% 
%         loc_ext = strfind(filenamepp, '.')+1; % format_image); % Index to '.file_extension' within filename.
% %         
% %         string_num = filenamepp(length_name+1:loc_ext - 1); % Leaves 'nnnn' of 'calib_name[nnnn].bmp'.
%         
%         if isempty(str2num(string_num))
%             iii = [];
%         end
%         
%         
%         if ~isempty(iii)
%             if iii(1) ~= 1 % This is where files such as 'c3.dat' get thrown out if 'calib_name' is empty.  An empty 'calib_name' implies the filename is all numeric.
%                 iii = [];
%             end
%         end
%             
%         if ~isempty(iii) % & ~isempty(loc_ext) % 'loc_ext' will never be empty if there are matching directory contents, and if there are no matching directory contents, the script will have already returned.
%             
%             Nima_valid = Nima_valid + 1;
%             ind_valid = [ind_valid pp];
%             loc_extension = [loc_extension loc_ext(1)];
%             
%         end
%         
%     end
%     
%     if ~Nima_valid % ==0)
%         
%         % try the upper case format:
%         
%         format_image = upper(format_image);
%         
%         
%         
%         for pp = 1:Nl
%             
%             filenamepp =  l(pp).name;
%             
%             if isempty(calib_name) % No basename specified
%                 iii = 1;
%             else
%                 iii = findstr(filenamepp,calib_name);
%             end
%             
%             loc_ext = findstr(filenamepp,format_image);
%             
%             
%             string_num = filenamepp(length_name+1:loc_ext - 2);
%             
%             if isempty(str2num(string_num))
%                 iii = [];
%             end
%             
%             
%             if ~isempty(iii)
%                 if (iii(1) ~= 1)
%                     iii = [];
%                 end
%             end
%             
%             
%             
%             if ~isempty(iii) & ~isempty(loc_ext)
%                 
%                 Nima_valid = Nima_valid + 1;
%                 ind_valid = [ind_valid pp];
%                 loc_extension = [loc_extension loc_ext(1)];
%                 
%             end
%             
%         end
%         
% end

% indices = ind_valid;
n_ima = Nima_valid;
image_numbers = indices;

if ~Nima_valid % ==0)
    fprintf(1,'No images found, as specified.\n');
    return % Added by CPM: Don't we want to quit the script at this point?
end

%     % Collect all the string numbers:
%     string_length = zeros(1,Nima_valid); % Zeros as long as 'Nima_valid'.
%     indices =  zeros(1,Nima_valid);
%             
%             
%             for ppp = 1:Nima_valid
%                 
%                 name = l(ind_valid(ppp));
%                 string_num = name(length_name+1:loc_extension(ppp) - 2); % Again?!
%                 string_length(ppp) = size(string_num,2);
%                 indices(ppp) = str2num(string_num);
%                 
%             end
%             
%             % Number of images...
%             first_num = min(indices);
%             n_ima = max(indices) - first_num + 1;
%             
if min(string_length) == max(string_length)
    N_slots = min(string_length);
    type_numbering = 1; % e.g. '001', '002', ...
else
    N_slots = 1;
    type_numbering = 0; % e.g. '1', ..., '10', '11', ...
end
%             
%             image_numbers = first_num:n_ima-1+first_num;
%             
%             %%% By default, all the images are active for calibration:
%             
%             active_images = ones(1,n_ima);
%             
%             
%             
% %         end
%         
% %     else
%         
%         % Get all the string numbers:
%         
%         string_length = zeros(1,Nima_valid);
%         indices =  zeros(1,Nima_valid);
%         
%         
%         for ppp = 1:Nima_valid
%             
%             name = l(ind_valid(ppp)).name;
%             string_num = name(length_name+1:loc_extension(ppp) - 2);
%             string_length(ppp) = size(string_num,2);
%             indices(ppp) = str2num(string_num);
%             
%         end
%         
%         % Number of images...
%         first_num = min(indices);
%         n_ima = max(indices) - first_num + 1;
%         
%         if min(string_length) == max(string_length)
%             
%             N_slots = min(string_length);
%             type_numbering = 1;
%             
%         else
%             
%             N_slots = 1;
%             type_numbering = 0;
%             
%         end
%         
%         image_numbers = first_num:n_ima-1+first_num;
%         
%         %%% By default, all the images are active for calibration:
%         
%         active_images = ones(1,n_ima);
%         
% %     end
%     
% % else
%     
% %     fprintf(1,'No image found. Basename may be wrong.\n');
%     
% end
% 
=======
        
        % Get all the string numbers:
        
        string_length = zeros(1,Nima_valid);
        indices =  zeros(1,Nima_valid);
        
        
        for ppp = 1:Nima_valid
            
            name = l(ind_valid(ppp)).name;
            string_num = name(length_name+1:loc_extension(ppp) - 2);
            string_length(ppp) = size(string_num,2);
            indices(ppp) = str2num(string_num);
            
        end
        
        % Number of images...
        first_num = min(indices);
        n_ima = max(indices) - first_num + 1;
        
        if min(string_length) == max(string_length)
            
            N_slots = min(string_length);
            type_numbering = 1;
            
        else
            
            N_slots = 1;
            type_numbering = 0;
            
        end
        
        image_numbers = first_num:n_ima-1+first_num;
        
        %%% By default, all the images are active for calibration:
        
        active_images = ones(1,n_ima);
        
    end
    
else
    
    fprintf(1,'No image found. Basename may be wrong.\n');
    
end
>>>>>>> bcabd4dfe6ae46ccc99a7c5868c032dcce1972b6

clear string_length string_num loc_extension expr tokens
% cd(owd)