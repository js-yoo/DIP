%% jsyoo
Ic=imread('bone.bmp');
I=rgb2gray(Ic);
figure(1); imshow(I); colorbar; % intensity value
figure(2); imshow(I); colormap jet; colorbar; % pseudocoloring
% colormap spring, summer, autumn, winter ...

% my own colormap
mycmap=[0 0 0
    1 0 0
    0 1 0
    0 0 1
    1 1 1];
figure(4); imshow(I); colormap(mycmap); colorbar;

cmap=colormap(2); % display color mapping function
figure(3); imagesc(cmap); colormap gray; ylabel('Intensity level');
