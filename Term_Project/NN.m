%% jsyoo
function out = NN(image, scale)
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

    % 결과 이미지의 각 픽셀별로 NN 실행
    if scale > 1
        for i = 1:Hn
            for j = 1:Wn
                % 입력 이미지의 좌표로 가서 가까운 값 할당 
                r = ceil(i/scale); c = ceil(j/scale);
                % R, G, B 각 채널별로 값 할당
                Rn(i,j) = R(r,c);
                Gn(i,j) = G(r,c);
                Bn(i,j) = B(r,c);
            end
        end
    else
        for i = 1:Hn
            for j = 1:Wn
                % 입력 이미지의 좌표로 가서 가까운 값 할당 
                r = floor(i/scale); c = floor(j/scale);
                % R, G, B 각 채널별로 값 할당
                Rn(i,j) = R(r,c);
                Gn(i,j) = G(r,c);
                Bn(i,j) = B(r,c);
            end
        end
    end
    % R, G, B 컬러 3채널을 결과 이미지로 결합시키기
    out = cat(3, Rn, Gn, Bn);
end