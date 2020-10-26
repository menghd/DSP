%1
clear
ele = [1 2 3; 4 5 6; 7 8 9; 42 0 35]; % 按键信息，用矩阵元素表示
n = 11; % 输入号码长度
fs = 8000; % 采样频率，默认为8192
fL = [697 770 852 941]; % 低频信号
fH = [1209 1336 1477 1633]; % 高频信号
TN = input('请输入电话号码:');
for i = 1:n;    
  d = fix(TN/10^(n - i)); % 依次取各位号码
  TN = TN - d*10^(n - i); % 更新取后剩下号码
  for j = 1:4;        
    for k = 1:3;           
      if ele(j, k) == abs(d); break, end     
    end      
    if ele(j, k) == abs(d); break, end  
  end    
  t = 0:2020;  
  y = sin(2*pi*t*fL(j)/fs) + sin(2*pi*t*fH(k)/fs);   
  sound(y, fs);   
  pause(.3) % 输出间隔时间
end  
  
%2
% 录音
t = 5; % 录音时长
voice = audiorecorder;
disp('开始录音:');
recordblocking(voice, t);
disp('录音结束!');
% 播放并作图
player = play(voice);
Array = getaudiodata(voice);
plot(Array); 
title('录音信号波形');
% 所得录音细节
disp('音频特征:');
get(player)