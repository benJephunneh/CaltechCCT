%%% This script alets the user enter the name of the images (base name, numbering scheme,...

      
% Checks that there are some images in the directory:
addpath(fullfile('J:','Tethers Unlimited','FabLab','Lab Data Functions'))

l_lab = dir('*txt');
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

if s_tot < 1,
   fprintf(1,'No image in this directory in either ras, bmp, tif, pgm, ppm or jpg format. Change directory and try again.\n');
   return;
end;


% IF yes, display the directory content:

dir;

Nima_valid = 0;

while (Nima_valid==0),

   fprintf(1,'\n');
   calib_name = input('Basename camera calibration images (without number nor suffix): ','s');
   
   format_image = '0';
   
	while format_image == '0',
   
   	format_image =  input('Image format: ([]=''r''=''ras'', ''b''=''bmp'', ''t''=''tif'', ''p''=''pgm'', ''j''=''jpeg'',''g''=''jpeg'', ''m''=''ppm'', ''l''=''lab data'') ','s');
		
		if isempty(format_image),
   		format_image = 'ras';
		end;
      
      if lower(format_image(1)) == 'm',
         format_image = 'ppm';
      else
         if lower(format_image(1)) == 'b',
            format_image = 'bmp';
         else
            if lower(format_image(1)) == 't',
               format_image = 'tif';
            else
               if lower(format_image(1)) == 'p',
                  format_image = 'pgm';
               else
                  if lower(format_image(1)) == 'j',
                     format_image = 'jpg';
                  else
                     if lower(format_image(1)) == 'r',
                        format_image = 'ras';
                     else
                         if lower(format_image(1)) == 'g',
                             format_image = 'jpeg';
                         else
                             if lower(format_image(1)) == 'l',
                                 format_image = 'txt';
                             else
                             disp('Invalid image format');
                            format_image = '0'; % Ask for format once again
                         end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;
    end;
    

      
   check_directory;
   
end;



if (Nima_valid~=0),
   % Reading images:
   
   ima_read_calib_no_read; % may be launched from the toolbox itself
   
   
   fprintf(1,'\n');
   
   fprintf(1,'To display the thumbnail images of all the calibration images, you may run mosaic_no_read (may be slow)\n');
   
end;
