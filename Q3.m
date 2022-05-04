clc;
clear all;
close all;

fs=8000;
f1=100;

t=(1/fs):1/fs:0.5;


N=length(t);

y=sin(2*pi*f1*t);

y1=fft(y);
y2=abs(y1);
y3=fftshift(y1);

%----k axis--
k=(fs/N)*(0:N-1);

k1=(fs/N)*(-floor(N/2):floor(N/2)-1);
%--




figure;
subplot(2,1,1)
plot(t,y)
title('sine wave with f=100')
xlabel('time')
ylabel('amplitude')
subplot(2,1,2)
plot(t,y)
xlim([0 0.05])
title('sin wave with rescaling the x limits')
xlabel('time')
ylabel('amplitude')


figure;
subplot(3,1,1)
plot(k,abs(y1))
ylim([0 3000])
title('fourier transform of sin(2*pi*f*t) ')
xlabel('frequency(hz)')
ylabel('amplitude')
subplot(3,1,2)
plot(k1,abs(y3))
ylim([0 3000])
title('frequencies centering to zero')
xlabel('frequency(hz)')
ylabel('amplitude')

subplot(3,1,3)
plot(k1,abs(y3))
xlim([98 102])
ylim([0 3000])
title('Above plot in the frequency range [98 102]')
xlabel('frequency(hz)')
ylabel('amplitude')

t1=0:1/fs:0.5;
N=length(t1);
k2=(fs/N)*(0:N-1);
y1=sin(2*pi*f1*t1);

y1=fft(y1);
y2=angle(y1);

figure;
plot(k2,y2)

title('phanse plot')
xlabel('frequency(hz)')
ylabel('phase(angle)')
