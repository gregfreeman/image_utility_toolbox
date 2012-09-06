function [image,settings]=FoveatedImageDataGetter(settings)

data=FoveatedImageData(settings.image);
image=data.image;
settings.fovea=data.fovea;
settings.name=data.name;