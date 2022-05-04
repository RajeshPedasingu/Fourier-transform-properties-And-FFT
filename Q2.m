clc;
clear all;
close all;



t=-2:0.01:2;
N=length(t);
width=1;

y=rectpuls(t,width);

figure;

plot(t,y)
title('rectangular pulse ,width=1 ')
xlabel('time samples')
ylabel('amplitude')

axis([-2 2 0 2])

y1=abs(fft(y));
y2=fftshift(y1);

n2=-floor(N/2):floor(N/2);

figure;
subplot(2,1,1)
plot(y1)
title('fourier transform of rectangular pulse BEFORE centering')
xlabel('frequency(K)axis ')
ylabel('amplitude')
subplot(2,1,2)
plot(n2,y2);
title('fourier transform of rectangular pulse AFTER centering')
xlabel('frequency(K)axis ')
ylabel('amplitude')



