% Input image
I=imread('rectangle.tif');
figure(1); subplot(2,2,1); imshow(I); title('Input Image', 'fontsize', 13);

% Original Spectrum
F=fft2(I);
absF=abs(F); subplot(2,2,2); imagesc(absF); axis image; 
title('Original Spectrum', 'fontsize', 13);

% Centered Specturm
centerF=fftshift(F); % Center FFT
absCenterF=abs(centerF); subplot(2,2,3); imagesc(absCenterF); axis image;
title('Centered Spectrum', 'fontsize', 13);

% Contrast enhancement using log intensity transformation
logF=log(1+absCenterF); subplot(2,2,4); imagesc(logF); axis image;
title('Log of Centered Spectrum', 'fontsize', 13)

% Phase plot
phase=angle(double(centerF));
figure(2); imagesc(phase); colormap gray; truesize;
title('Phase'); colorbar;
