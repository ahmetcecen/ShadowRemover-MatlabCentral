function post = RemoveShadow(image,imagetype)
%   Remove unwanted intensity gradients from image. A by-product of ongoing computational
%   materials science research at MINED@Gatech.(http://mined.gatech.edu/)
%
%   post = RemoveShadow(image,imagetype) takes in the matrix "image" of type "imagetype"
%   either 'rgb' or 'gray', and returns the cleaned image "post".
%
%   Can definitely use more functionality, but won't work on it unless it comes up as an issue later.
%   Check ShadowRemover for an attempt at a GUI.
%
%   Copyright (c) 2015, Ahmet Cecen  -  All rights reserved.


CIM=class(image);
image=double(image);

if strcmp(imagetype,'rgb')
    image=rgb2gray(image);
elseif strcmp(imagetype,'gray')
    image=round(255*image./range(image(:)));
end

length=100;

imlow=imresize(image,[round(size(image,1)*(length/size(image,2))) length]);
[x,y]=find(imlow);
R=imlow(:);
reg=MultiPolyRegress([x y],double(R),2);
surflow=reg.yhat;
surflow=reshape(surflow,[round(size(image,1)*(length/size(image,2))) length]);
surf=imresize(surflow,size(image));
surf=round(surf);
surf=surf-min(surf(:));
post=image-surf;
eval(strcat('post=',CIM,'(post);'));