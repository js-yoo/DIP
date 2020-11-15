%% jsyoo
% define vertices 좌표 8개 
vm=[0 0 0;
    1 0 0;
    1 1 0;
    0 1 0;
    0 0 1;
    1 0 1;
    1 1 1;
    0 1 1];  

% make faces 면
fm=[1 2 6 5; 2 3 7 6; 3 4 8 7; 4 1 5 8; 1 2 3 4; 5 6 7 8];

% 각 꼭짓점 마다 컬러값 지정
cdata=[0 0 0; % black
    1 0 0; % red
    1 0 1; % magenta
    0 0 1; % blue
    0 1 0; % green
    1 1 0; % yellow
    1 1 1; % white
    0 1 1; % cyan
    ];
    
figure
% patch - 꼭짓점을 넣으면 채워진 다각형을 만들어줌. 3D Rendering할 때 많이 사용
patch('Vertices',vm,'Faces',fm,'FaceVertexCdata',cdata,'FaceColor','interp');
xlabel('Red'); ylabel('Blue'); zlabel('Green');
