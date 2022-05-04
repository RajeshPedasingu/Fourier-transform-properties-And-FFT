clc;
clear all;
close all;

f1=500;
f2=1000;
fs=8000;
t=(1/fs):(1/fs):0.5;
N=length(t);

y=sin(2*pi*f1*t)+sin(2*pi*f2*t);


subplot(2,1,1)
plot(t,y)
title('dual tone signal with f1=500,f2=1000')
xlabel('time')
ylabel('amplitude')


subplot(2,1,2)
plot(t,y)
xlim([0 0.005])
title('above signal in the intervel of [0 0.005]sec')
xlabel('time')
ylabel('amplitude')


y1=(fft(y));

%--axis normalisation--
k = (fs/N)*(0:N-1);
k1=(fs/N)*(-floor(N/2):floor(N/2)-1);

d=fftshift(y1);
%--


figure;
subplot(2,1,1)
plot(k,abs(y1))
ylim([0 3000])
title('fourier transform of dual tone signal ')
xlabel('frequency(Hz)')
ylabel('amplitude')

subplot(2,1,2)
plot(k1,abs(d))
ylim([0 3000])
title('frequencies centering to zero')
xlabel('frequency(Hz)')
ylabel('amplitude')

