clc;
clear all;
close all;
warning('off')
a1=2;
a2=3;
x1 = [0.59 0.95 0.95 0.59 0.00 0.59 0.95 0.95 0.59 0.00];
x2 = [0.16 0.97 0.96 0.49 0.80 0.14 0.42 0.92 0.79 0.96];


%--liniarity--
y1=fft(x1);
y2=fft(x2);
y3=fft(a1*x1);
y4=fft(a2*x2);
y5=abs(y3)+abs(y4);
y6=a1*abs(y1)+a2*abs(y2);

figure;
subplot(2,1,1)
stem(x1);
title('given input signal x1')
xlabel('time')
ylabel('amplitude')
subplot(2,1,2)
stem(x2);
title('given input signal x1')
xlabel('time')
ylabel('amplitude')


figure;
subplot(2,1,1)
stem(abs(y6));
title('linearity check when input y=(a.x1+b.x2) ')
xlabel('time')
ylabel('amplitude')

subplot(2,1,2)
stem(abs(y5));
title('linearity check, output y=(a.y1+b.y2)')
xlabel('time')
ylabel('amplitude')

%-linear--end--




%time reversal

%--T_r end--







%---circular convotlution---

N=max(length(x1),length(x2));

y1=fft(x1);
y2=fft(x2);

x=cconv(x1,x2,N);
y3=fft(x);

y4=y1.*y2;


figure;
subplot(2,1,1)
stem(y3);
title('circular convolution using cconv(x1,x2,N)');
xlabel('time index');
ylabel('amplitude');


subplot(2,1,2)
stem(y4);
title('multiplication in f domain, y(w)=x1(w).x2(w)');
xlabel('time index');
ylabel('amplitude');

%---end convolution--




%---time shift property--

x1=[0.59 0.95 0.95 0.59 0.00 0.59 0.95 0.95 0.59 0.00];
x2=[0.16 0.97 0.96 0.49 0.80 0.14 0.42 0.92 0.79 0.96];
N=length(x1);
n=0:N-1;
y=circshift(x1,2);
y1=fft(x1);
y2=fft(y);


figure;
subplot(2,1,1);
stem(n,x1);
title('time shifting, original signal(x1)');
xlabel('time index');
ylabel('amplitude');

subplot(2,1,2);
stem(n,y);
title('shifted signal,using circshift command');
xlabel('time index');
ylabel('amplitude');



figure;
subplot(2,2,1);
stem(n,abs(y1));
xlabel('time index');
ylabel('amplitude');
title('magnitude response of x1 signal');
subplot(2,2,2);
stem(n,abs(y2));
xlabel('time index');
ylabel('amplitude');
title('magnitude response of y signal');
subplot(2,2,3);
stem(n,angle(y1));
xlabel('time index');
ylabel('amplitude');
title('phase response of x1 signal');
subplot(2,2,4);
stem(n,angle(y2));
xlabel('time index');
ylabel('amplitude');
title('phase response of y signal');
%----end --timeshift--









%--------time reversal---------
x1 = [0.59 0.95 0.95 0.59 0.00 0.59 0.95 0.95 0.59 0.00];
x2 = [0.16 0.97 0.96 0.49 0.80 0.14 0.42 0.92 0.79 0.96];

N1=length(x1);
n1=0:N1-1;


%--time reversal property using mod function----
b1=x1(mod(-n1,N1)+1);
y1=fft(b1);



y2=fft(x1);
b2=y2(mod(-n1,N1)+1);

%--end--

figure;
subplot(2,2,[1 2])
stem(n1,x1)
title('input signal(x1)')
xlabel('time(n)')
ylabel('amplitude')

subplot(2,2,3)
stem(n1,y1)
title('time reversal signal, i,e. fft[(x1(-n)N]>')
xlabel('time(n)')
ylabel('amplitude')

subplot(2,2,4)
stem(n1,b2)
title('first fft then reversal i,e <fft(x1)((-n-2))N>')
xlabel('time(n)')
ylabel('amplitude')






N2=length(x2);
n2=0:N2-1;

%--time reversal property using mod function for X2----
b3=x2(mod(-n2,N2)+1);
y3=fft(b3);



y4=fft(x2);
b4=y4(mod(-n2,N2)+1);

%--end--




%--for x2--
figure;
subplot(2,2,[1 2])
stem(n2,x2)
title('input signal(x2)')
xlabel('time(n)')
ylabel('amplitude')

subplot(2,2,3)
stem(n2,y3)
title('time reversal signal, i,e. fft[(x2(-n)N]>')
xlabel('time(n)')
ylabel('amplitude')

subplot(2,2,4)
stem(n2,b4)
title('first fft then reversal i,e <fft(x2)((-n-2))N>')
xlabel('time(n)')
ylabel('amplitude')

%---
%----




%---Parseval-s Theorem------

x1=[0.59 0.95 0.95 0.59 0.00 0.59 0.95 0.95 0.59 0.00];
x2=[0.16 0.97 0.96 0.49 0.80 0.14 0.42 0.92 0.79 0.96];
x=sum(x1.*conj(x2));
y1=fft(x1);
y2=fft(x2);
y=sum(y1.*conj(y2));
N=length(x1);
disp('parsevel theorem in time domain');
disp(x);
disp('parsevel theorem in frequency domain');
disp(y/N);

%---end parsevel---

