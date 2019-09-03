% Modified to open lab data format. - 04/10/19 (DY)
<<<<<<< HEAD
% Modified for code improvements. - 16 Aug 19 (CPM)
=======
% Modified: 15 Aug 19 (CPM)
>>>>>>> bcabd4dfe6ae46ccc99a7c5868c032dcce1972b6

if ~exist('calib_name', 'var') || ...
   ~exist('format_image', 'var') || ...
   ~exist('n_ima', 'var') % CPM: This is already done in 'data_calib_lab_data.m'
   data_calib_lab_data
   return
end

% check_directory_lab_data % CPM: May be removeable, since it is already called
% in 'data_calib_lab_data'

check_active_images
images_read = active_images;

if exist('image_numbers', 'var')
   first_num = image_numbers(1); 
end

% Just to fix a minor bug: % This is not a good fix, given if-end immediately preceding.
if ~exist('first_num', 'var')
   first_num = image_numbers(1);
end


image_numbers = first_num:n_ima-1+first_num;

no_image_file = 0;

i = 1;

while (i <= n_ima) % & (~no_image_file),
   
   if active_images(i)
   
   	%fprintf(1,'Loading image %d...\n',i);
   
   	if ~type_numbering
      	number_ext =  num2str(image_numbers(i));
   	else
      	number_ext = sprintf(['%.' num2str(N_slots) 'd'],image_numbers(i));
    end
   	
      ima_name = [calib_name  number_ext '.' format_image];
      
      if i == ind_active(1)
         fprintf(1,'Loading image ');
      end
      
      if exist(ima_name, 'file')
          fprintf(1,'%d...',i);
          switch format_image
              case 'ppm'
                  Ii = double(loadppm(ima_name));
              case 'pgm'
                  Ii = double(loadpgm(ima_name));
              case 'ras'
                  Ii = readras(ima_name);
              case 'dat'
                  Ii = read_lab_data(ima_name);
              otherwise
                  Ii = imread(ima_name); % Covers jpg, bmp, tif, even ras, ppm, and pgm, but I don't know if those image-reading functions are needed for special cases.
          end
         
%          if format_image(1) == 'p'
%             if format_image(2) == 'p'
%                Ii = double(loadppm(ima_name));
%             else
%                Ii = double(loadpgm(ima_name));
%             end
%          else
%             if format_image(1) == 'r'
%                Ii = readras(ima_name);
%             elseif format_image(1) == 't'
%                Ii = imread(ima_name));
%             elseif format_image(1) == 'd'
%                Ii = double(read_lab_data(ima_name));
%             else
%                Ii = double(imread(ima_name));
%             end
%          end

      	
   		if size(Ii,3)>1
            Ii = 0.299 * Ii(:,:,1) + 0.5870 * Ii(:,:,2) + 0.114 * Ii(:,:,3); % CPM: Changing color values of RGB.  Is this necessary?  Related to turning images to grayscale for a specific camera?
        end
   
   		eval(['I_' num2str(i) ' = Ii;']);
         
      else
         
         %fprintf(1,'%d...no image...',i);
	 
	 images_read(i) = 0;
	 
	 %no_image_file = 1;
	 
      end;
      
   end;
   
   i = i+1;   
   
end;


ind_read = find(images_read);




if isempty(ind_read),
   
   fprintf(1,'\nWARNING! No images were read\n');
   
   no_image_file = 1;
   
   
else
   

   %fprintf(1,'\nWARNING! Every exsisting image in the directory is set active.\n');

   
   if no_image_file,
        %fprintf(1,'WARNING! Some images were not read properly\n');
   end;
     
   fprintf(1,'\n');

   if size(I_1,1)~=480,
       small_calib_image = 1;
   else
       small_calib_image = 0;
   end;
   
   [Hcal,Wcal] = size(I_1); 	% size of the calibration image
   
   [ny,nx] = size(I_1);
   
   clickname = [];
   
   map = gray(256);
   
	%string_save = 'save calib_data n_ima type_numbering N_slots image_numbers format_image calib_name Hcal Wcal nx ny map small_calib_image';

	%eval(string_save);

	disp('done');
	%click_calib;

end;

if ~(exist('map')==1), map = gray(256); end;

active_images = images_read;

