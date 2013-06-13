% MSRCImageDBv2Getter  gets files from the MSRC Image Database
%  uses experiment settings structure
%   settings.image : image number
%   settings.image_category : image category number
%   settings.image_options : cell array of image options
%
%
function [image,settings]=MSRCImageDBv2Getter(settings)

    if ~isfield(settings,'image_category')
        settings.image_category=1;
        warning('image_category not specified')
    end
    
    if isfield(settings, 'image_options')
        data=MSRCImageDBv2(settings.image_category,settings.image,settings.image_options{:});
    else
        data=MSRCImageDBv2(settings.image_category,settings.image);
    end
    image=data.image;
    settings.name=data.name;

end

function [ vout ] = MSRCImageDBv2(category,varargin)
% collects files for a cateogry in the MSRC Image Database
 global DATA_PATH___;
    imageDir=[fullfile(DATA_PATH___,'MSRC_ObjCategImageDatabase_v2','Images') filesep];
    files=dir(sprintf('%s%d_*_s.bmp',imageDir,category));
        
    for j=1:length(files)
        files(j).filename=files(j).name;           
        [path,files(j).name,ext]=fileparts(files(j).filename);
        files(j).filepath=sprintf('%s%s',imageDir,files(j).filename);
    end
    
    vout=load_image_data(files,varargin{:});

end

