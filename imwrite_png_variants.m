%imwrite_png_variants(x_hat, x_original, name)
% create png file variants of file and reference file to handle
% reconstructions that have a different range than the original
% <name>_scaled.png scaled the image from 0 to 255
% <name>_ref_scaled.png scales the reference by the same scale factor
% <name>_bounded.png bounds the x_hat image output from 0 to 255.  
%   The bounded file can use the original file as the reference

function imwrite_png_variants(x_hat, x_original, name)

sz=size(x_hat);
% b=min(x_hat(:));
% a=max(x_hat(:))-b;
range=255;

% x_hat_scaled=(x_hat-b)*(1/a);
% x_original_scaled=(x_original-b)*(1/a);
x_hat_bounded=max(min(x_hat./range,ones(sz)),zeros(sz));
% imwrite(x_hat_scaled,[name '_scaled.png'])
% imwrite(x_original_scaled,[name '_ref_scaled.png'])
imwrite(x_hat_bounded,name)

% save(name, 'x_hat')
