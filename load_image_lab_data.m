% Modified to open lab data format. - 04/01/19


function I = load_image_lab_data(kk , calib_name , type_numbering , image_numbers , N_slots),


if ~type_numbering,   
    number_ext =  num2str(image_numbers(kk));
else
    number_ext = sprintf(['%.' num2str(N_slots) 'd.dat'],image_numbers(kk));
end;


% ima_name = [calib_name  number_ext '.' format_image];
ima_name = [calib_name  number_ext];

if ~exist(ima_name),
    
    fprintf(1,'Image %s not found!!!\n',ima_name);
    I = NaN;
    
else
    
    fprintf(1,'Loading image %s...\n',ima_name);
    
%     if format_image(1) == 'p',
%         if format_image(2) == 'p',
%             I = double(loadppm(ima_name));
%         else
%             I = double(loadpgm(ima_name));
%         end;
%     else
%         if format_image(1) == 'r',
%             I = readras(ima_name);
%         else
%             I = double(imread(ima_name));
%         end;
%     end;
    
    I = double(read_lab_data(ima_name));
    
    
    if size(I,3)>1,
        I = 0.299 * I(:,:,1) + 0.5870 * I(:,:,2) + 0.114 * I(:,:,3);
    end;
    
end;
