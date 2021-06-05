%a
t = -100:100;
x1 = sinc(t./6);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
fft_x1= fftshift(fft(x1));
fft_x2= fftshift(fft(x2));
plot(t,abs(fft_x1));
title('X_1 - FFT')
ylabel('|X(j\Omega)|');
xlabel('\Omega [rad/sec]');

plot(t,abs(fft_x2));
title('X_2 - FFT')
ylabel('|X(j\Omega)|');
xlabel('\Omega [rad/sec]');

%d
n = -50:50;
xn1 =  sinc(n./3);
fft_xn1= fftshift(fft(xn1));
stem(n,abs(fft_xn1));
title('xn_1 - FFT ')
ylabel('|X(e.^{j\Omega})|');
xlabel('n [sec]');

xn2 = cos(pi.*n./6)+sin(pi.*n./3);
fft_xn2= fftshift(fft(xn2));
stem(n,abs(fft_xn2));
title('xn_2 - FFT')
ylabel('X(e.^{j\Omega})');
xlabel('n [sec]');

clear;
close;
%e
t = -10000:10000;
xt1 =  sinc(t./3);
fft_xt1= fftshift(fft(xt1));
zoh = c2d(fft_xt1,0.1,'zoh');
plot(t,zoh);

