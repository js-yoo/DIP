I=imread('color.png');
fig1=figure(1); fig1.set('color','w'); % Figure 1의 배경을 하얀색으로 정하기
subplot(2,3,1); imshow(I); title('RGB input image');

% Make an RGB color space
% R=I(:,:,1); Red 채널에서의 밝기값
R=uint8(zeros(size(I))); R(:,:,1)=I(:,:,1); % 밝기값을 Red로 나타내기
subplot(2,3,2); imshow(R); title('Red'); 

G=uint8(zeros(size(I))); G(:,:,2)=I(:,:,2); % 밝기값을 Green으로 나타내기
subplot(2,3,3); imshow(G); title('Green'); 

B=uint8(zeros(size(I))); B(:,:,3)=I(:,:,3); % 밝기값을 Blue로 나타내기
subplot(2,3,4); imshow(B); title('Blue');
