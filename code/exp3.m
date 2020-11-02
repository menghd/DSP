%1
fs = 100; % 大于最大两倍即30Hz即可
N = 1024; % 取2的次幂便于FFT
f1 = 15; f2 = 2;
t = (1:N)/fs; 
x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
F1 = abs(fft(x1))*(1:N); % X按习惯表示x对应生成的循环矩阵
F2 = abs(fft(x2))*(1:N);
fa = (1:N)*fs/N % 模拟频率
% 可以考虑fft加上shift使得图像符合平时习惯
subplot(221)
plot(t, x1)
subplot(222)
stem(fa, F1)
subplot(223)
plot(t, x2)
subplot(224)
stem(fa, F2)

%2
T = .01;
N1 = 100; N2 = 50;
t1 = (1:N1)*T;
t2 = (1:N2)*T;
f1 = 15; f2 = 2;
x1 = sin(2*pi*f1*t1) + sin(2*pi*f2*t1);
x2 = sin(2*pi*f1*t2) + sin(2*pi*f2*t2);
F1 = abs(fft(x1))*(1:N1);
F2 = abs(fft(x2))*(1:N2);
fa1 = (1:N)/(N1*T);
fa2 = (1:N)/(N2*T);

subplot(211)
stem(fa1, F1)
subplot(212)
stem(fa2, F2)
