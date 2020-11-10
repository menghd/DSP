% 1冲激响应不变法
fp = 1000; fst = 4000;
Rp = 3; As = 15;
fs = 20000;
[n, other] = buttord(2*pi*fp, 2*pi*fst, Rp, As, 's'); % 超出归一化1需要添加's'
[z, p, k] = buttap(n);
[b, a] = zp2tf(z, p, k);
[bt, at] = lp2lp(b, a, 2*pi*fp); % 连续滤波器
[bz, az] = impinvar(bt, at, fs) % 数字滤波器
freqz(bz, az) % 频率响应

% 2信号过滤
fs = 20000; f1 = 20; f2 = 5000;
T = 1; t = 0:1/fs:T; f = 0:1/T:fs;
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);
y = filter(bz, az, x);
Wx = fft(x);
Wy = fft(y);
subplot(121)
plot(t, x, 'r', t, y, 'b')
subplot(122)
plot(f, abs(Wx), 'r', f, abs(Wy), 'b')

% 3加窗函数
fp = 50; fst = 100; fs = 400;
As = 40; % 查表选用Hanning窗
deltaw = 2*pi*(fst - fp)/fs;
n = ceil(6.2*pi/deltaw);
h = hanning(n);
f = (fst + fp)/(2*fs);
b = fir1(n - 1, f, h)
figure
stem(b)
figure
freqz(b, 1)