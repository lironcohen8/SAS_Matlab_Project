n = linspace(-50,50,100);
T=2;
w = linspace(-pi,pi,100);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
xn2 = cos(T.*pi.*n./12)+sin(T.*pi.*n./6);
fft_xn2= fftshift(fft(xn2));
figure;
stem(w,abs(fft_xn2));
title('Xn_2(e^{j\omega})')
ylabel('|X(e^{j\omega})|');
xlabel('\omega[rad/sec]');