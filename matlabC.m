%a
t = -10000:10000;
x1 = sinc(t./6);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
fft_x1= fftshift(fft(x1));
fft_x2= fftshift(fft(x2));
plot(t,abs(fft_x1));
title('fft x1 - Part c')
ylabel('X(j\Omega)');
xlabel('\Omega [rad/sec]');

plot(t,abs(fft_x2));
title('fft x2 - Part c')
ylabel('X(j\Omega)');
xlabel('\Omega [rad/sec]');

%d
n = -50:50;
xn1 =  sinc(n./3);
fft_xn1= fftshift(fft(xn1));
stem(n,abs(fft_xn1));
title('fft xn1 - Part c')
ylabel('X(e.^j\Omega)');
xlabel('n [sec]');

xn2 = cos(pi.*n./6)+sin(pi.*n./3);
fft_xn2= fftshift(fft(xn2));
stem(n,abs(fft_xn2));
title('fft xn2 - Part c')
ylabel('X(e.^j\Omega)');
xlabel('n [sec]');