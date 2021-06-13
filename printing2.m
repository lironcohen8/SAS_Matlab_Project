t = linspace(-100,100,200);
x1 = sinc(t./6);
w = linspace(-pi,pi,200);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
fft_x1= fftshift(fft(x1));
fft_x2= fftshift(fft(x2));


figure;
plot(w,abs(fft_x2));
title('X_2(j\Omega)');
ylabel('|X(j\Omega)|');
xlabel('\Omega [rad/sec]');
