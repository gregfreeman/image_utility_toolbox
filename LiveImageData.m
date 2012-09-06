function [ vout ] = LiveImageData(varargin)
%DATASET Summary of this function goes here
%   Detailed explanation goes here

    global DATA_PATH___;
    imageDir=[fullfile(DATA_PATH___,'livedatabaserelease2\refimgs') filesep];
    files=dir(sprintf('%s*.bmp',imageDir));


    for k=1:length(files)
        files(k).filename=files(k).name;           
        [path,files(k).name,ext]=fileparts(files(k).filename);
        files(k).filepath=sprintf('%s%s',imageDir,files(k).filename);
    end
    
    vout=load_image_data(files,varargin{:});
end

