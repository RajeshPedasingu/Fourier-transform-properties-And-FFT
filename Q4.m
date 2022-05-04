clc;
clear all;
close all;

t=1:1000;
m=0;
sigma=1;
a=m+sigma*randn(1,length(t));

figure;
subplot(2,1,1)
plot(t,a);

title('gaussian random numbers with mean=0,variance=1')
xlabel('random numbers')
ylabel('number of occurances')
subplot(2,1,2)
histfit(a);
title('distribution of gaussian random numbers')
xlabel('random numbers')
ylabel('number of occurances')

y=fft(a);


figure;
subplot(2,1,1)
plot(abs(y));
title('fourier transform of gaussian random numbers ')
xlabel('magnitude of frequencies(k)')
ylabel('amplitude ')

subplot(2,1,2)
histfit(abs(y));
title('distribution of frequencies')
xlabel('magnitude of frequencies')
ylabel('number of occurances')

