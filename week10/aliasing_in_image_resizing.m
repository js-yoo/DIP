I=imread('zone-plate.png');
figure(1); imshow(I); truesize; % original zone-plate image
title('Original zone-plate image');

% subsampling : direct resizing
samplingInterval=2;
[H W]=size(I);
Ir=[];
for i=1:samplingInterval:H
  for j=1:samplingInterval:W
  
Ir=(floor(i/samplingInterval)+1, floor(j/samplingInterval)+1) = I(i,j);
  end
end

figure(2); imagesc(Ir); colormap gray; truesize;
title('Sampled zone-plate image');

% subsampling : resizing after smoothing
g=fspecial('gaussian', 5, 1); % gaussian
I=imfilter(I,g,'same','replicate');
