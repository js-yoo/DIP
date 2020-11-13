clear all; close all;
% load an input image
I=imread('Input.bmp');
Ig=rgb2gray(I);
figure(1); subplot(5,1,1); imshow(Ig); title('Original Image', 'fontsize', 13);

% blurring using gaussian
% fspecial을 사용하여 sigma=1인 5x5 2차원 gaussian filter 생성
w=fspecial('gaussian', [5 5], 1); 
% output size : same(input), padding method : replicate
Ib=imfilter(Ig,w,'same','replicate'); 
subplot(5,1,2); imshow(Ib); title('Blurred Image', 'fontsize', 13);

% unsharp mask = input - blurred
Id=Ig-Ib;
subplot(5,1,3); imagesc(Id); title('Input-blurred', 'fontsize', 13); axis image;

% sharpened = input + (input-blurred)
Is= Ig+(Ig-Ib);
subplot(5,1,4); imshow(Is); title('Sharpened', 'fontsize', 13);

% Highboost : Input + 4.5*(Input-blurred)
Ih=Ig+4.5*(Ig-Ib);
subplot(5,1,5); imshow(Is); title('Highboost', 'fontsize', 13);
