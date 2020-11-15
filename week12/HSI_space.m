%% jsyoo
I=imread('color.png');
% HSI color space
hsi=rgb2hsv(I); % Matlab 2020에서는 rgb2hsi가 rgb2hsv로 바뀐듯
h=hsi(:,:,1);  
figure(2); subplot(1,3,1); imagesc(h); title('hue'); colorbar; axis image;
s=hsi(:,:,2);
figure(2); subplot(1,3,2); imagesc(s); title('saturation'); colorbar; axis image;
i=hsi(:,:,3);
figure(2); subplot(1,3,3); imagesc(i); title('intensity'); colorbar; axis image;
