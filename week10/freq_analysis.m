% load an Image
I=imread('rectangle.tif');
figure(1); imshow(I); axis on; % 가로가 x축, 세로가 y축
xlabel('x','fontsize',13); ylabel('y','fontsize',13);
% 밝기 변화 작으면 저주파, 밝기 변화 크면 고주파
% image -> freq.
F=fft2(I); % real+imaginary, 한 픽셀에 두개값이라서 출력 불가
absF=abs(F); figure(2); imagesc(absF); colormap gray; colorbar

% shift freq. to center image in freq. domain
% (1,1)의 저주파 성분을 가운데로 옮기기
centerF=fftshift(F); absCenterF=abs(centerF);
figure(3); imagesc(absCenterF); colormap gray;
xlabel('u','fontsize',13); ylabel('v','fontsize',13);

% intensity Tr.
logF=log(1+absCenterF);
figure(4); imagesc(logF); colormap gray;

% phase
phase=angle(double(centerF));
figure(5); imagesc(phase); colormap gray;
