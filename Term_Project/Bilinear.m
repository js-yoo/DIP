%% jsyoo
function out = Bilinear(image, scale)
    % 입력 이미지로부터 R, G, B 각 채널 추출
    R = image(:,:,1); % 이미지의 Red 채널 추출
    G = image(:,:,2); % 이미지의 Green 채널 추출
    B = image(:,:,3); % 이미지의 Blue 채널 추출

    % 입력 이미지의 크기 구하기
    [H,W] = size(R);

    % Resize한 새로운 이미지의 크기를 변수에 할당
    Hn = ceil(H * scale);
    Wn = ceil(W * scale);
   
    Rn = zeros(Hn,Wn,'uint8');
    Gn = zeros(Hn,Wn,'uint8');
    Bn = zeros(Hn,Wn,'uint8');
    
    % 결과 이미지의 각 픽셀별로 Bilinear 실행
    for i = 1:Hn
        x = (i/scale) + (0.5 * (1 - 1/scale));
        for j = 1:Wn
            y = (j/scale) + (0.5 * (1 - 1/scale));
            
            y(y < 1) = 1;
            if y >= W
                y = W;
                k = floor(y) - 1;
            else
                k = floor(y);
            end
            
            x(x < 1) = 1;
            if x >= H
                x = H;
                l = floor(x) - 1;
            else
                l = floor(x);
            end
            
            R1 = (k + 1 - y)*R(l,k) + (y - k)*R(l,k + 1);
            R2 = (k + 1 - y)*R(l + 1,k) + (y - k)*R(l + 1,k + 1);
            Rn(i,j) = (l + 1 - x)*R1 + (x - l)*R2;
            
            G1 = (k + 1 - y)*G(l,k) + (y - k)*G(l,k + 1);
            G2 = (k + 1 - y)*G(l + 1,k) + (y - k)*G(l + 1,k + 1);
            Gn(i,j) = (l + 1 - x)*G1 + (x - l)*G2;
            
            B1 = (k + 1 - y)*B(l,k) + (y - k)*B(l,k + 1);
            B2 = (k + 1 - y)*B(l + 1,k) + (y - k)*B(l + 1,k + 1);
            Bn(i,j) = (l + 1 - x)*B1 + (x - l)*B2;
        end
    end
    % R, G, B 컬러 3채널을 결과 이미지로 결합시키기
    out = cat(3, Rn, Gn, Bn);
end