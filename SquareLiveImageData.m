function [ vout ] = SquareLiveImageData(varargin)
%DATASET Summary of this function goes here
%   Detailed explanation goes here

 global DATA_PATH___;
    imageDir=[fullfile(DATA_PATH___,'refimgs512x512') filesep];
    files=dir(sprintf('%s*.bmp',imageDir));
        
    for j=1:length(files)
        files(j).filename=files(j).name;           
        [path,files(j).name,ext]=fileparts(files(j).filename);
        files(j).filepath=sprintf('%s%s',imageDir,files(j).filename);
    end
    
    vout=load_image_data(files,varargin{:});

end

