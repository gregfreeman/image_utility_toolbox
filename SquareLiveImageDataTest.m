% function SquareLiveImageDataTest
%SQUARELIVEIMAGEDATATEST Summary of this function goes here
%   Detailed explanation goes here

data2=SquareLiveImageData(1:7);
data3=SquareLiveImageData('list');
n=LiveImageData('count');
data1a=SquareLiveImageData(1,'cropsize',[128 128]);
data1b=SquareLiveImageData(1,'resize',[128 128]);
data1c=SquareLiveImageData(1);

