function [ vout ] = load_image_data( files, varargin )
%LOAD_IMAGE_DATA Summary of this function goes here
%   load images for a dataset
%   load_image_data( files, ...)
%      files is a array of structures for each image in the dataset with
%      fields:
%         .name the human readable name for the image
%         .filepath the path to the image file

    nFiles=length(files);
    data={};
    newsize=[];
    cropsize=[];
    k=1;
    nargs=length(varargin);
    while(nargs>=k)
        if ischar(varargin{k})
            switch(varargin{k})
                case 'list'
                    data=files;
                case 'resize'
                    if nargs>=k+1
                        newsize=varargin{k+1};
                        k=k+1;                        
                    else 
                        error('invalid argument with "resize"')
                    end
                case 'cropsize'
                    if nargs>=k+1
                        cropsize=varargin{k+1};
                        k=k+1;                        
                    else 
                        error('invalid argument with "cropsize"')
                    end
                case 'count'
                    data=nFiles;
                otherwise
                    for i=1:nFiles
                        if strcmpi(varargin{k},files(i).name)
                            data= [data,{loadImage(files(i))}];
                        end
                    end                        
            end
        elseif isnumeric(varargin{k})
            indexes=varargin{k};
            data=cell(length(indexes),1);
            for i=1:length(indexes)
                data{i}=loadImage(files(indexes(i)));
            end
        else
            error('invalid argument %d',k)
        end
        k=k+1;
    end

    if ~isempty(newsize)
        for i=1:length(data)
            data{i}.image=imresize(data{i}.image,newsize);
        end
    end

    if ~isempty(cropsize)
        for i=1:length(data)
            data{i}.image=cropImage(data{i}.image,cropsize);
        end
    end

    
    if iscell(data) && length(data)==1        
        vout=data{1};        
    elseif iscell(data) && length(data)>1  
        for i=numel(data):-1:1
            vout(i)=data{i};
        end
    else
        vout=data;
    end

    function file=loadImage(file)
        file.image=double(imread(file.filepath));        
        if(size(file.image,3)==3)
            file.image=rgb2gray(file.image./255)*255;
        end
    end
    function cropped=cropImage(image, cropsize)
        sz=size(image);
        corner1=(sz(1:2)-cropsize)/2+[1 1];
        corner2=corner1+cropsize-[1 1];
        cropped=image(corner1(1):corner2(1),corner1(2):corner2(2));
    end
end

