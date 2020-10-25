%1
x = [2 -1 4 7 0 -3 5]
y = [-2 8 0 -3 6 2 -4]
w = [7 0 -9 -3 4 2 -1]

u = x + y
v = x.*w
z = x - y.*w
%clc

%2
%%(1)
n_1 = -10:10;
x_1 = [zeros(1, 10) 1 zeros(1,10)];
h_1 = [zeros(1, 10) ones(1, 6) zeros(1, 5)];
y_1 = conv(x_1, h_1)ny_1 =-20:20;

subplot(3,1,1)
stem(n_1, x_1)
subplot(3,1,2)
stem(n_1, h_1)
subplot(3,1,3)
stem(ny_1, y_1)

%%(2)
n_2 = -10:10;
x_2 = [zeros(1, 10) ones(1, 4) zeros(1, 7)];
h_2 = [zeros(1, 10) ones(1, 4) zeros(1, 7)];
y_2 = conv(x_2, h_2)

ny_2 =-20:20;
subplot(3,1,1)
stem(n_2, x_2)
subplot(3,1,2)
stem(n_2, h_2)
subplot(3,1,3)
stem(ny_2, y_2)

%%(3)
n_3 = -10:10;
x_3 = [zeros(1, 12) 1 zeros(1, 8)];
h_3 = [zeros(1, 10) ones(1, 5) zeros(1, 6)] .*power(0.5, n_3);
y_3 = conv(x_3, h_3)

ny_3 =-20:20;
subplot(3,1,1)
stem(n_3, x_3)
subplot(3,1,2)
stem(n_3, h_3)
subplot(3,1,3)
stem(ny_3, y_3)

%3
%%(1)
a = [1 1]
b = [1 -1/3 -1/4]
[h, w] = freqz(a, b)
h_1 = abs(h)
h_2 = angle(h)

subplot(2,1,1)
plot(h_1)
title('幅度')

subplot(2,1,2)
plot(h_2)
title('幅角')

%%(2)
a = [1 1]
b = [1 -1/3 -1/4]
N = 0:49
fs = 10000
f0 = 1000
x = 5*sin(2*pi*f0*N/fs)
y = filter(a, b, x)plot(N, y)

%4
%%(1)
a = [1 -2]
b = [1 0 1 -0.06]
x = zeros(1, 10)
x(1) = 1
y = filter(a, b, x)
stem(y)

%%(2)
n = 0:20
a = [1 -2]
b = [1 0 1 -0.06]
x = 3*cos(0.2*pi*n) + 4*sin(0.6*pi*n) + 5
y = filter(a, b, x)

subplot(2,1,1)
stem(x)

subplot(2,1,2)
stem(y)

%5
n = -4999:5000

subplot(2,1,1)
b_1 = normrnd(1, 2, 1,10000)
plot(b_1)

subplot(2,1,2)
b_2 = unifrnd(-3, 3, 10000)
plot(b_2)

%6
N=2000;
x=randn(N);
y=randn(N);

tic;
for i=1:N
  for j=1:N
    z(i,j)=x(i,j)+y(i,j);
  end
end
toc;

tic;
for j=1:N
  for i=1:N
    z(i,j)=x(i,j)+y(i,j);
  end
end
toc;

tic;
for i=1:N
  z(i,:)=x(i,:)+y(i,:);
end
toc;

tic;
for j=1:N
  z(:,j)=x(:,j)+y(:,j);
end
toc;

tic;
z=x+y;
toc;