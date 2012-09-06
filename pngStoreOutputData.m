function  pngStoreOutputData(outputData, inputData, links)
%pngStoreOutputData writes png output for an experiment StoreOutputData
%event

imwrite_png_variants(outputData, inputData, links.add('image_bounded','png'));

end

