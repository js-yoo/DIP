%% jsyoo // 2020-11-14
%% Summary: Steps for Filtering in the Frequency Domain
% 1. Given an input image f(x,y) of size MxN, obtain the padding parameters
% P and Q. Typically, P = 2M and Q = 2N
f=imread('circuit.png'); f=rgb2gray(f); 
figure(1); subplot(3,3,1); imshow(f); title('Input (f), MxN'); axis image; 

% 2. Form a padded image, f_p(x,y) of size PxQ by appending the necessary
% number of zeros to f(x,y).
% 기본 이미지의 가로,세로 2배 크기로 빈 이미지 생성
[M, N]=size(f); padded=zeros(2*M,2*N); 
for i=1:M
    for j=1:N
        padded(i,j)=f(i,j); % 빈 이미지에 할당된 곳에 입력 이미지 할당
    end
end
subplot(3,3,2); imshow(uint8(padded)); title('Padded image (f_p), 2Mx2N'); 
axis image; 

% 3. Multiply f_p(x,y) by (-1)^x+y to center its transform.
center=zeros(2*M,2*N);
for x=1:2*M
    for y=1:2*N
        center(x,y)=(padded(x,y)*(-1).^(x+y)); % 저주파 대역으로 나타내기
    end
end
subplot(3,3,3); imshow(uint8(center)); title('Multiplying by (-1)^x^+^y');
axis image; 

% 4. Compute the DFT, F(u,v) of the image from step 3.
F=fft2(center); magF=abs(F); % spectrum of centered F
subplot(3,3,4); imagesc(log(1+magF)); title('F_p'); colormap gray; axis image; 

% 5. Generate a real, symmetric filter function, H(u,v), of size PxQ with
% center at coordinate.
% making an ideal LPF
[P,Q]=size(F);
u=0:(P-1); u=u-P/2;
v=0:(Q-1); v=v-Q/2;
[V,U]=meshgrid(v,u);
D=sqrt(U.^2+V.^2);
cof=20; % cut-off freq. (radius)
H=double(D<=cof); % ideal LPF
subplot(3,3,5); imagesc(H); title('H: centered LPF'); colormap gray; 
axis image;

% 6. Form the product G(u,v) = H(u,v)F(u,v) using array multiplication.
G=H.*F; magG=abs(G); % spectrum of G
subplot(3,3,6); imagesc(log(1+magG)); title('H*F_p'); colormap gray; 
axis image;

% 7. Obtain the processed image. 
% g_p(x,y)={real[ F^-1[G(u,v)] ]}(-1)^x+y
real_g=real(ifft2(G));
g=zeros(2*M,2*N);
for i=1:2*M
    for j=1:2*N
        g(i,j)=real_g(i,j).*((-1).^(i+j));
    end
end
subplot(3,3,7); imagesc(g); title('g_p'); colormap gray; axis image;

% 8. Obtain the final processed result, g(x,y), by extracting the MxN
% region from the top, left quadrant of g_p(x,y).
[M,N]=size(f); out=zeros(M,N);
for i=1:M
    for j=1:N
        out(i,j)=g(i,j);
    end
end
subplot(3,3,8); imagesc(out); title('Final: cropping 1^s^t MxN'); 
colormap gray; axis image;

% 9. Compare the results obtained by the frequency domain filtering and
% space domain filtering.
% blurred image
w=fspecial('gaussian', [5 5],1); % sigma=1인 5x5 크기의 gaussian filter 생성
Ib=imfilter(f,w,'same','replicate'); 
% output size : same, padding method : replicate
Is=f+(f-Ib); % Input+(Input-blurred) : k=1인 unsharp masking
subplot(3,3,9); imshow(Is); title('Compare frequency vs space domain filtering');
colormap gray; axis image;
