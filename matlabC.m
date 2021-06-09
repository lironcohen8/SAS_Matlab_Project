clc;
close all;
clearvars;

%a
t = -100:100;
x1 = sinc(t./6);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
fft_x1= fftshift(fft(x1));
fft_x2= fftshift(fft(x2));
figure;
plot(t,abs(fft_x1));
title('X_1 - FFT')
ylabel('|X(j\Omega)|');
xlabel('\Omega [rad/sec]');

figure;
plot(t,abs(fft_x2));
title('X_2 - FFT')
ylabel('|X(j\Omega)|');
xlabel('\Omega [rad/sec]');

%d
n = -50:50;
T=2;

x1 = sinc(t./6);
xn1 =  sinc(T.*n./6);
fft_xn1= fftshift(fft(xn1));
figure;
stem(n,abs(fft_xn1));
title('xn_1 - FFT ')
ylabel('|X(e.^{j\omega})|');
xlabel('n [sec]');

x2 = cos(pi.*t./12)+sin(pi.*t./6);
xn2 = cos(T.*pi.*n./12)+sin(T.*pi.*n./6);
fft_xn2= fftshift(fft(xn2));
figure;
stem(n,abs(fft_xn2));
title('xn_2 - FFT')
ylabel('|X(e.^{j\omega})|');
xlabel('n [sec]');

%e
%e -xn1 zoh
T=2;
N=10;
L=T*N;
n = -100:100;
t = linspace(-100,100,length(xn1)*L);
xn1 =  sinc(T.*n./6);
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

%e- xn2 zoh
T=2;
N=10;
L=T*N;
n = -100:100;
xn2 = cos(T.*pi.*n./12)+sin(T.*pi.*n./6);
t = linspace(-100,100,length(xn2)*L);
for i=1:length(xn2)-1
    for j=1:L
        zoh(i*L+j) = xn2(i);
    end;
end;   
figure;
plot(t,zoh);
hold on;
plot(n,xn2);
hold off;
title('xn_2 - ZOH ')
ylabel('|xn_2|');
xlabel('n [sec]');

%e- xn1 foh

T=2;
N=10;
L=T*N;
n = -100:100;
t = linspace(-100,100,length(xn1)*L);
xn1 =  sinc(T.*n./6);
for i=1:length(xn1)-1
    for j=1:L
        foh(i*L+j) = xn1(i)+(j/L)*(xn1(i+1)-xn1(i))
    end;
end;   
figure;
plot(t,foh);
hold on;
plot(n,xn1);
hold off;
title('xn_1 - FOH ')
ylabel('|xn_1|');
xlabel('n [sec]');





%f

n = -50:50;
xn1 =  sinc(3.*n./2);
fft_xn1= fftshift(fft(xn1));
stem(n,abs(fft_xn1));
title('xn_1 - FFT ')
ylabel('|X(e.^{j\omega})|');
xlabel('n [sec]');

xn2 = cos(pi.*3.*n./4)+sin(pi.*3.*n./2);
fft_xn2= fftshift(fft(xn2));
stem(n,abs(fft_xn2));
title('xn_2 - FFT')
ylabel('|X(e.^{j\omega})|');
xlabel('n [sec]');

