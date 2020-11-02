%1
fs = 100; % 大于最大两倍即30Hz即可
N = 1024; % 取2的次幂便于FFT
f1 = 15; f2 = 2;
t = (1:N)/fs; 
x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
F1 = abs(fft(x1)); % X按习惯表示x对应生成的循环矩阵
F2 = abs(fft(x2));
f = (1:N)*fs/N % 模拟频率

subplot(221)
plot(t, x1)
subplot(222)
plot(f, F1)
subplot(223)
plot(t, x2)
subplot(224)
plot(f, F2)