[y, Fs] = audioread('phone_number.mp3'); 
% spectrogram(y,1024,0,1024,Fs);
wavename='cmor3-3';
totalscal=256;
Fc=centfrq(wavename); % 小波的中心频率
c=2*Fc*totalscal;
scals=c./(1:totalscal);
f=scal2frq(scals,wavename,1/Fs); % 将尺度转换为频率
coefs=cwt(y,scals,wavename); % 求连续小波系数
figure
imagesc(t,f,abs(coefs));
set(gca,'YDir','normal')
colorbar;
xlabel('时间 t/s');
ylabel('频率 f/Hz');
title('小波时频图');
ylim([600 1500])