% function pre_process_small_test_images

source_path='C:\Data\livedatabaserelease2\refimgs512x512\';
resize_path='C:\Data\livedatabaserelease2\refimgs128x128resize\';
crop_path='C:\Data\livedatabaserelease2\refimgs128x128crop\';

files=dir([source_path '*.bmp']);

for i=1:length(files)
    image=imread([source_path files(i).name]);
    offset=[129+64 129+64];
    image2=image(offset(1):offset(1)+127,offset(2):offset(2)+127,:);
    imwrite(image2, [crop_path files(i).name]);
    image3=imresize(image, 0.25);
    imwrite(image3, [resize_path files(i).name]);
    
end


