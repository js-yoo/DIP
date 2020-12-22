%% jsyoo
%% Load input image & ground truth image
clear; close all; clc;
% 확대할 입력 이미지 불러오기
image='woman';
I=imread(['./small/[크기변환]',image,'.png']);
figure(1); subplot(1,2,1); imshow(I); title('Input image');
% 이미지 저장할 경로 지정
folderResult = 'result_figure';
if ~exist(folderResult,'file') % results 폴더가 있는지 확인하고 없으면
    mkdir(folderResult); % 폴더 만들기
end
% Ground Truth 이미지 불러오기
Igt=imread(['./gt/',image,'.png']);
subplot(1,2,2); imshow(Igt); title('Ground Truth');
disp('===========================');
%% Nearest Neighbor
disp('NN 구현 함수');
tic % Resizing 시간 측정 - 시작
INN=NN(I,4); 
toc % Resizing 시간 측정 - 정지
figure(2); imshow(INN); title('NN 구현 함수');
imwrite(INN,fullfile(folderResult,[image,'_NN_구현.png']));% save results
% calculate psnr
i=imread(['./result_figure/',image,'_NN_구현.png']);
my_psnr_value=my_psnr(i,Igt);
psnr_value=psnr(i,Igt);
fprintf('Implementation PSNR %0.4f.\n',my_psnr_value);
fprintf('Built-in PSNR %0.4f.\n',psnr_value);
disp('NN 내장 함수');
tic
Inn=imresize(I,4,'nearest'); 
toc
figure(3); imshow(Inn); title('NN 내장 함수');
imwrite(Inn,fullfile(folderResult,[image,'_NN_내장.png']));% save results
% calculate psnr
i=imread(['./result_figure/',image,'_NN_내장.png']);
my_psnr_value=my_psnr(i,Igt);
psnr_value=psnr(i,Igt);
fprintf('Implementation PSNR %0.4f.\n',my_psnr_value);
fprintf('Built-in PSNR %0.4f.\n',psnr_value);
disp('===========================');
%% Bilinear
disp('Bilinear 구현 함수');
tic
IBB=Bilinear(I,4);
toc
figure(4); imshow(IBB); title('Bilinear 구현 함수');
imwrite(IBB,fullfile(folderResult,[image,'_Bil_구현.png']));% save results
% calculate psnr
i=imread(['./result_figure/',image,'_Bil_구현.png']);
my_psnr_value=my_psnr(i,Igt);
psnr_value=psnr(i,Igt);
fprintf('Implementation PSNR %0.4f.\n',my_psnr_value);
fprintf('Built-in PSNR %0.4f.\n',psnr_value);
disp('Bilinear 내장 함수');
tic
Ibb=imresize(I,4,'bilinear');
toc
figure(5); imshow(Ibb); title('Bilinear 내장 함수');
imwrite(Ibb,fullfile(folderResult,[image,'_Bil_내장.png']));% save results
% calculate psnr
i=imread(['./result_figure/',image,'_Bil_내장.png']);
my_psnr_value=my_psnr(i,Igt);
psnr_value=psnr(i,Igt);
fprintf('Implementation PSNR %0.4f.\n',my_psnr_value);
fprintf('Built-in PSNR %0.4f.\n',psnr_value);
disp('===========================');
%% Bicubic
disp('Bicubic 구현 함수');
tic
ICC=Bicubic(I,4);
toc
figure(6); imshow(ICC); title('Bicubic 구현 함수')
imwrite(ICC,fullfile(folderResult,[image,'_Bic_구현.png']));% save results
% calculate psnr
i=imread(['./result_figure/',image,'_Bic_구현.png']);
my_psnr_value=my_psnr(i,Igt);
psnr_value=psnr(i,Igt);
fprintf('Implementation PSNR %0.4f.\n',my_psnr_value);
fprintf('Built-in PSNR %0.4f.\n',psnr_value);
disp('Bicubic 내장 함수');
tic
Icc=imresize(I,4);
toc
figure(7); imshow(Icc); title('Bicubic 내장 함수');
imwrite(Icc,fullfile(folderResult,[image,'_Bic_내장.png']));% save results
% calculate psnr
i=imread(['./result_figure/',image,'_Bic_내장.png']);
my_psnr_value=my_psnr(i,Igt);
psnr_value=psnr(i,Igt);
fprintf('Implementation PSNR %0.4f.\n',my_psnr_value);
fprintf('Built-in PSNR %0.4f.\n',psnr_value);
disp('===========================');