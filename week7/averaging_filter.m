%% Linear filter : averaging filter
I=imread('pattern.tif');
figure(1); subplot(1,3,1); imshow(I); title('Original Image','fontsize',13);

% Add Gaussian noise
n=randn(size(I))*20; % create gaussian noise(sigma=20)
In=uint8(double(I)+n); % Input image + noise
figure(1); subplot(1,3,2); imshow(In); title('Noisy Image', 'fontsize', 13);

% Averaging filter
w=ones(5,5)/25;
Ir=imfilter(In,w,'same','replicate'); % outputsize : same, padding method : replicate
subplot(1,3,3); imshow(Ir); title('Averaged Image', 'fontsize', 13);
