%% jsyoo
function out = my_psnr(I,ref)
% I : Interpolation 이미지, ref : 기준(Ground Truth) 이미지
[H,W,D] = size(I); 

% MSE 계산
R_diff = (double(I(:,:,1))-double(ref(:,:,1))).^2; 
G_diff = (double(I(:,:,2))-double(ref(:,:,2))).^2; 
B_diff = (double(I(:,:,3))-double(ref(:,:,3))).^2; 

% RGB 각각의 MSE
R_mse = sum(sum(R_diff)) / (H * W); % R에대한 mse값
G_mse = sum(sum(G_diff)) / (H * W); % G에대한 mse값
B_mse = sum(sum(B_diff)) / (H * W); % B에대한 mse값

% R, G, B 에대한 MSE 평균값
MSE = (R_mse + G_mse + B_mse) / 3; 
% PSNR 계산 식 / MAX_I = 255(8bit image)
out = 10*log10(255^2/MSE); 