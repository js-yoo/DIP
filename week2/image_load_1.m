%% Load an image
Ic=imread('jsyoo.jpg'); % load an image
figure(1); % make a fiqure
imshow(Ic); % display image data on the figure
title('Color Image of Joonsang Yoo','fontsize',16); % attach a figure title

size(Ic) % image size information

Ig=rgb2gray(Ic); % color to gray transform
figure(2);
imshow(Ig);
title('Gray Image of Joonsang Yoo','fontsize',16)

size(Ig)
