%% jsyoo
function out = Bicubic(image, scale)
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
    
    % 결과 이미지의 각 픽셀별로 Bicubic 실행
    for y_out = 1:Hn
        dy = (y_out/scale) + (0.5 * (1 - 1/scale));
        
        y1 = floor(dy) - 1;
        y1(y1 < 1) = 1;
        
        y2 = y1 + 1;
        y3 = y2 + 1;
        y4 = y3 + 1;

        % Height 경계 내에서 커널 유지하기
        if y4 >= H 
            y4 = H;
            y3 = y4 - 1;
            y2 = y3 - 1;
            y1 = y2 - 1;
        end
        
        for x_out = 1:Wn
            dx = (x_out/scale) + (0.5 * (1 - 1/scale));
            
            x1 = floor(dx) - 1;
            x1(x1 < 1) = 1;

            x2 = x1 + 1;
            x3 = x2 + 1;
            x4 = x3 + 1;

            % Width 경계 내에서 커널 유지하기
            if x4 >= W 
                x4 = W;
                x3 = x4 - 1;
                x2 = x3 - 1;
                x1 = x2 - 1;
            end
            
            % cubic interpolation을 진행
            % x-axis
            cc_x1 = double(cubic(dx - x1));
            cc_x2 = double(cubic(dx - x2));
            cc_x3 = double(cubic(dx - x3));
            cc_x4 = double(cubic(dx - x4));
            % x축 계산한 것 다 더하기
            cc_X = double(cc_x1 + cc_x2 + cc_x3 + cc_x4);
            % y-axis
            cc_y1 = double(cubic(dy - y1));
            cc_y2 = double(cubic(dy - y2));
            cc_y3 = double(cubic(dy - y3));
            cc_y4 = double(cubic(dy - y4));
            % y축 계산한 것 다 더하기
            cc_Y = double(cc_y1 + cc_y2 + cc_y3 + cc_y4);
            
            % R, G, B 각 채널 별로 구한 cubic 값을 곱하여서
            % Bicubic interpolation 진행하기
            % Red Channel
            R1 = cc_x1*double(R(y1,x1))/cc_X + cc_x2*double(R(y1,x2))/cc_X + cc_x3*double(R(y1,x3))/cc_X + cc_x4*double(R(y1,x4))/cc_X;
            R2 = cc_x1*double(R(y2,x1))/cc_X + cc_x2*double(R(y2,x2))/cc_X + cc_x3*double(R(y2,x3))/cc_X + cc_x4*double(R(y2,x4))/cc_X;
            R3 = cc_x1*double(R(y3,x1))/cc_X + cc_x2*double(R(y3,x2))/cc_X + cc_x3*double(R(y3,x3))/cc_X + cc_x4*double(R(y3,x4))/cc_X;
            R4 = cc_x1*double(R(y4,x1))/cc_X + cc_x2*double(R(y4,x2))/cc_X + cc_x3*double(R(y4,x3))/cc_X + cc_x4*double(R(y4,x4))/cc_X;
            Rn(y_out,x_out) = cc_y1*R1/cc_Y + cc_y2*R2/cc_Y + cc_y3*R3/cc_Y + cc_y4*R4/cc_Y;
            % Green Channel
            G1 = cc_x1*double(G(y1,x1))/cc_X + cc_x2*double(G(y1,x2))/cc_X + cc_x3*double(G(y1,x3))/cc_X + cc_x4*double(G(y1,x4))/cc_X;
            G2 = cc_x1*double(G(y2,x1))/cc_X + cc_x2*double(G(y2,x2))/cc_X + cc_x3*double(G(y2,x3))/cc_X + cc_x4*double(G(y2,x4))/cc_X;
            G3 = cc_x1*double(G(y3,x1))/cc_X + cc_x2*double(G(y3,x2))/cc_X + cc_x3*double(G(y3,x3))/cc_X + cc_x4*double(G(y3,x4))/cc_X;
            G4 = cc_x1*double(G(y4,x1))/cc_X + cc_x2*double(G(y4,x2))/cc_X + cc_x3*double(G(y4,x3))/cc_X + cc_x4*double(G(y4,x4))/cc_X;
            Gn(y_out,x_out) = cc_y1*G1/cc_Y + cc_y2*G2/cc_Y + cc_y3*G3/cc_Y + cc_y4*G4/cc_Y;
            % Blue Channel
            B1 = cc_x1*double(B(y1,x1))/cc_X + cc_x2*double(B(y1,x2))/cc_X + cc_x3*double(B(y1,x3))/cc_X + cc_x4*double(B(y1,x4))/cc_X;
            B2 = cc_x1*double(B(y2,x1))/cc_X + cc_x2*double(B(y2,x2))/cc_X + cc_x3*double(B(y2,x3))/cc_X + cc_x4*double(B(y2,x4))/cc_X;
            B3 = cc_x1*double(B(y3,x1))/cc_X + cc_x2*double(B(y3,x2))/cc_X + cc_x3*double(B(y3,x3))/cc_X + cc_x4*double(B(y3,x4))/cc_X;
            B4 = cc_x1*double(B(y4,x1))/cc_X + cc_x2*double(B(y4,x2))/cc_X + cc_x3*double(B(y4,x3))/cc_X + cc_x4*double(B(y4,x4))/cc_X;
            Bn(y_out,x_out) = cc_y1*B1/cc_Y + cc_y2*B2/cc_Y + cc_y3*B3/cc_Y + cc_y4*B4/cc_Y;
        end
    end
    % R, G, B 컬러 3채널을 결과 이미지로 결합시키기
    out = cat(3, Rn, Gn, Bn);
end