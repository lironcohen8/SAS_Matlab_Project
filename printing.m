n = -50:50;
xn2 = cos(pi.*3.*n./4)+sin(pi.*3.*n./2);
fft_xn2= fftshift(fft(xn2));
stem(n,abs(fft_xn2));
title('xn_2 - FFT')
ylabel('|X(e.^{j\omega})|');
xlabel('n [sec]');
