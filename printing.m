t = -100:100;
x1 = sinc(t./6);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
fft_x1= fftshift(fft(x1));
fft_x2= fftshift(fft(x2));
n = -50:50;
xn2 = cos(pi.*n./6)+sin(pi.*n./3);
fft_xn2= fftshift(fft(xn2));
stem(n,abs(fft_xn2));
title('xn_2 - FFT')
ylabel('|X(e.^{j\Omega})|');
xlabel('n [sec]');