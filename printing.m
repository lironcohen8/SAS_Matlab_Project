w = linspace(-pi,pi,2*10000+1);
n = -10000:10000;
xn = cos((2.*pi./5).*n) + cos(((pi)./5).*n);
fft_xn = fftshift(fft(xn));
plot(w,abs(fft_xn));
title('x[n] DTFT')
ylabel('X(e^(j\omega))');
xlabel('\omega [rad/sec]');