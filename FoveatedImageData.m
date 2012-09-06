function [ vout ] = FoveatedImageData(varargin)
%DATASET Summary of this function goes here
%   Detailed explanation goes here
    files = [];

    t.filename = 'Airplane.BMP';
    t.name = 'Airplane';
    t.fovea = [251 280];
    files = [files,t];

    t.filename = 'Boat.BMP';
    t.name = 'Boat';
    t.fovea = [256 256];
    files = [files,t];

    t.filename = 'Bridge.BMP';
    t.name = 'Bridge';
    t.fovea = [165 256];
    files = [files,t];

    t.filename = 'Cameraman.BMP';
    t.name = 'Cameraman';
    t.fovea = [180 256];
    files = [files,t];

    t.filename = 'CarAPC.BMP';
    t.name = 'CarAPC';
    t.fovea = [283 286];
    files = [files,t];

    t.filename = 'Lena.bmp';
    t.name = 'Lena';
    t.fovea = [265 265];
    files = [files,t];

    t.filename = 'Man.BMP';
    t.name = 'RenaissanceFair';
    t.fovea = [125 240];
    files = [files,t];

    t.filename = 'mandril_gray.tif';
    t.name = 'Mandrill';
    t.fovea = [200 256];
    files = [files,t];

    t.filename = 'Mondrian.BMP';
    t.name = 'Mondrian';
    t.fovea = [256 256];
    files = [files,t];

    t.filename = 'Tank.BMP';
    t.name = 'Tank';
    t.fovea = [198 226];
    files = [files,t];

    global DATA_PATH___;
    imageDir=[fullfile(DATA_PATH___,'FovCompTestData') filesep];

    for k=1:length(files)
        files(k).filepath=sprintf('%s%s',imageDir,files(k).filename);
    end
    
    vout=load_image_data(files,varargin{:});
end

