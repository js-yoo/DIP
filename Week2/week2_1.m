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

%% Check image value
figure(2); hold on;

plot(100,200,'r+','markersize',15); % column index, row index

Ig(200,100) % intensity at row index, column index

%% Resolution
Ir=imresize(Ig,[240 320]); % resize
figure(3); imshow(Ir);
title('Resized Image of Joonsang Yoo','fontsize',16);
axis on;
size('Ir = ',Ir)

%% Bit resolution
nbit=2; % number of used bits
Ib=round(double(Ir)/(256/2^(nbit))); %quantize image levels
Ib2=uint8(Ib*2^(8-nbit)); % stretch to 0-255 intensity levels
figure(4); imshow(Ib2);
title('Reduced Gray Levels image of Joonsang Yoo','fontsize',16)
