 clc;
 clear all;
 [y, Fs] = audioread('phone_number.mp3');
 % 短时傅里叶变换
 wlen = 5000;
 nover = 2500;
 i = 1; j = 1;
 a = 0.3; 
 n = 0 : (wlen - 1);
 w = (1 - a) - a*cos(2*pi*n/(wlen - 1 ));% 加窗
 while (i + wlen) < length(y)  
 temp = y(i:i + wlen - 1);  
 s(:,j) = fft(w.*temp', wlen);  
 j = j + 1;  
 i = i + wlen - nover;
 end
 t = 0:1/Fs:length(y)/Fs;
 f = 0:Fs/wlen:length(s)*Fs/wlen;
 figure;
 imagesc(t, f, 10*log10(abs(s).^2));
 axis xy;
 ylim([600 1500]);
 xlabel('时间 (s)');
 ylabel('频率 (Hz)');
 colorbar
 
 % 直接调用短时傅里叶
 figure
 spectrogram(y,5000,2500,5000,Fs);
 xlim([.6 1.5]);
 
 % 小波变换
 wavename = 'cmor3-4'; % 采用复morlet小波
 totalscal = 32;
 Fc=centfrq(wavename); % 小波中心频率
 scals = 16*Fc*totalscal./(1:totalscal); 
 f = scal2frq(scals,wavename,1/Fs); % 将尺度转换为频率  
 wvp = cwt(y,scals,wavename); % 连续小波系数
 t = 0:1/Fs:length(y)/Fs;
 figure
 imagesc(t, f, abs(wvp));
 ylim([600 1500]);
 set(gca,'YDir','normal')
 xlabel('时间 (s)');
 ylabel('频率 (Hz)');
 colorbar;