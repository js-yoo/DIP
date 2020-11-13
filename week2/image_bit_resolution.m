%% Bit resolution
nbit=2; % number of used bits
Ib=round(double(Ir)/(256/2^(nbit))); %quantize image levels
Ib2=uint8(Ib*2^(8-nbit)); % stretch to 0-255 intensity levels
figure(4); imshow(Ib2);
title('Reduced Gray Levels image of Joonsang Yoo','fontsize',16)
