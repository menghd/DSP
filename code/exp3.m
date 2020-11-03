%1
function X = myFFT(x)
x = x(:);
N = length(x);
if N == 1
  X = x;
else
  X1 = myFFT(x(1:2:N));
  X2 = myFFT(x(2:2:N));
  X2 = X2.*exp(-1j*2*pi*(0:N/2 - 1)'/N);
  X = [X1 + X2; X1 - X2];
end

function X = myDFT(x)
x = x(:);
N = length(x);
X = zeros(N,1);
W = exp(-1j*2*pi/N);
for k = 1:N
  for n = 1:N
    X(k) = X(k) + x(n)*W^((k-1)*(n-1));
  end
end

N = zeros(12, 1);
T1 = N; T2 = N; T3 = N;
for n = 1:length(N)
  x = 1-2*rand(power(2, n), 1);
  tic
  fft(x);
  T1(n) = toc;
  tic
  myFFT(x);
  T2(n) = toc;
  tic
  myDFT(x);
  T3(n) = toc;
end

N = 1:length(N);
loglog(N, T1, 'r', N, T2, 'g', N, T3, 'b')
xlabel('N')
ylabel('t')

%2
fs = 100; % 大于最大两倍即30Hz即可
N = 1024; % 取2的次幂便于FFT
f1 = 15; f2 = 2;
t = (1:N)/fs; 
x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
F1 = abs(fft(x1)); F1 = F1(1:N); % X按习惯表示x对应生成的循环矩阵
F2 = abs(fft(x2)); F2 = F2(1:N);
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

%3
T = .01;
N1 = 100; N2 = 50;
t1 = (1:N1)*T;
t2 = (1:N2)*T;
f1 = 15; f2 = 2;
x1 = sin(2*pi*f1*t1) + sin(2*pi*f2*t1);
x2 = sin(2*pi*f1*t2) + sin(2*pi*f2*t2);
F1 = abs(fft(x1)); F1 = F1(1:N1);
F2 = abs(fft(x2)); F2 = F2(1:N2);
fa1 = (1:N1)/(N1*T);
fa2 = (1:N2)/(N2*T);

subplot(211)
stem(fa1, F1)
subplot(212)
stem(fa2, F2)
