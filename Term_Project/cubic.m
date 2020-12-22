%% jsyoo
function f = cubic(x)
    % 절댓값 구하기
    abs_x = abs(x); % x의 절댓값을 abs_x에 저장
    abs_x2 = abs_x.^2; % abs_x의 제곱을 abs_x2에 저장
    abs_x3 = abs_x.^3; % abs_x의 세제곱을 abs_x3에 저장
    % cubic convolution 진행
    f = (1.5*abs_x3 - 2.5*abs_x2 + 1) .* (abs_x <= 1) + ...
        (-0.5*abs_x3 + 2.5*abs_x2 - 4*abs_x + 2) .* ((1 < abs_x) & (abs_x <= 2));
end