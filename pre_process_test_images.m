% function pre_process_test_images

source_path='C:\Data\livedatabaserelease2\refimgs512x512\source\';
dest_path='C:\Data\livedatabaserelease2\refimgs512x512\';

files=dir([source_path '*.bmp']);

for i=1:length(files)
    image=imread([source_path files(i).name]);
    image2=image(1:512,1:512,:);
    imwrite(image2, [dest_path files(i).name]);
    
end


