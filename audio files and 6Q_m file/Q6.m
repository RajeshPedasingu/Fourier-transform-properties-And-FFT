clc;
clear all;
close all;

% % first extract the given ZIP file 
% % and copy the  extracted ZIP file to this file folder.
%  


for h=1:27

name=num2str(h)+".wav";

[y,fs]=audioread(name);
[f1 f2]=raj(y,fs);
X = [ num2str(h) '.wav ' 'audio has frequencies  f1= ',num2str(f1),' Hz' ,' &  f2=' num2str(f2),' Hz'];
disp(X)

end





function [f1, f2]= raj (y,fs) 

N=length(y);
y1=fft(y);
y2=fftshift(y1);
%--axis--
k=(fs/N)*(0:N-1);
k1=(fs/N)*(-floor(N/2):floor(N/2));
%---

if mod(N,2)==0
k1=(fs/N)*(-floor(N/2):floor(N/2)-1);

end





p=abs(y1);

j=1;
m=1;
for i=2:(length(p)-1)/2
    g(j)=p(i)-p(i-1);
    j=j+1;
    if g(j-1)<0
        c(m)=j-1;
        m=m+1;
    end
end


p1=p(c);
z=sort(p1);

for i=1:length(p1)
    if p1(i)==z(end-1)
        c2=i;
    end
end
c3=c(c2);



[v1 id1]=max(p);



v2=p(c3);
id2=c3;

%final index values

value1=v1;
f1=k(id1);
value2=v2;
f2=k(id2);

%---end---




% figure;
% plot(y)
% title('audio signal ')
% xlabel('time')
% ylabel('amplitude')
% figure;
% subplot(2,1,1)
% plot(k,abs(y1))
% 
% 
% txt = ['F1(hz)=' num2str(f1) ' , ' 'F2(hz)=' num2str(f2) ];
% text(length(y1)/2,v1-v1/4,txt)
% title('DFT of audio file ')
% xlabel('frrequency(hz)')
% ylabel('amplitude')
% 
% subplot(2,1,2)
% plot(k1,abs(y2))
% title('DFT of audio file after frequencies center to zero')
% xlabel('frrequency(hz)')
% ylabel('amplitude')
% 


end

