%% jsyoo
% Original Image
I=imread('jsyoo.png');
I=rgb2gray(I);
I=imresize(I,[512,512]);
figure(1); subplot(2,3,1); imshow(I);
title('Original Image');

% Phase
F=fft2(I); 
phaseF=angle(double(F));
subplot(2,3,2); imagesc(phaseF); colormap gray;
title('Phase'); 

% Phase based reconstruction
Ip=ifft2(exp(1i*angle(F)));
subplot(2,3,3); imagesc(real(Ip)); colormap gray;
title('Phase based reconstruction');

% Spectrum based reconstruction
absF=abs(F);  % phase=0인 Original Spectrum 만들기
% Spectrum based로 reconstruction한 후 
% 중앙으로 재배열 하는 과정
Is=ifftshift(ifft2(absF));
subplot(2,3,4); imagesc(real(Is)); colormap gray;
title('Spectrum based reconstruction');

% Rectangle
R=imread('rectangle.tif');
F2=fft2(R); absR=abs(F2); phaseR2=exp(1i*angle(F2));

% Reconstruction by jsyoo phase + rectangle spectrum
j=absR.*exp(1i*angle(F)); Ij=ifft2(j);
subplot(2,3,5); imagesc(real(Ij)); colormap gray;
title('Reconstruction by jsyoo phase + rectangle spectrum');

% Recontruction by Rectangle phase + jsyoo spectrum
r=absF.*phaseR2; Ir=ifft2(r);
subplot(2,3,6); imagesc(real(Ir)); colormap gray;
title('Recontruction by Rectangle phase + jsyoo spectrum');
