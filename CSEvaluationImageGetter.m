function [image,settings]=CSEvaluationImageGetter(settings)

if isfield(settings, 'image_options')
    data=SquareLiveImageData(settings.image,settings.image_options{:});
else
    data=SquareLiveImageData(settings.image);
end
image=data.image;
settings.name=data.name;