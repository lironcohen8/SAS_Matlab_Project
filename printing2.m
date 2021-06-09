T=2;
N=10;
L=T*N;
xn1 =  sinc(T.*n./6);
t = linspace(-100,100,length(xn1)*L);
n = -100:100;
xt1 =  sinc(t./3);
hold 
fft_xt1= fftshift(fft(xt1));
for i=1:length(xn1)-1
    for j=1:L
        zoh(i*L+j) = xn1(i);
    end;
end;   
figure;
plot(t,zoh);
hold on;
plot(n,xn1);
hold off;
title('xn_1 - ZOH ')
ylabel('|xn_1|');
xlabel('n [sec]');
