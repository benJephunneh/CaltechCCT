%----- This small script looks in the direcory and checks if the images are there. -----%
% This works only on Matlab 5.x (otherwise, the dir commands works differently)
% (c) Jean-Yves Bouguet - Dec. 27th, 1999

Nl = size(images, 2);
Nima_valid = size(images, 2);
ind_valid = 1:Nima_valid;
[loc_extension, string_length, indices] = deal(zeros(1, Nima_valid));
length_name = length(calib_name);
expr = [calib_name '.*?\D*?(?<string_num>\d+)\.' format_image '$'];

for ii = 1:Nima_valid
    loc_ext = strfind(images{ii}, format_image);
    tokens = regexpi(images{ii}, expr, 'names');
    string_num = tokens.string_num;
    string_length(ii) = length(string_num);
    indices(ii) = str2double(string_num);
    loc_extension(ii) = loc_ext;
end
    
% Number of images...
first_num = min(indices);
n_ima = max(indices) - first_num + 1; % % CPM: What a strange and seemingly irrelevant number this could be.

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
