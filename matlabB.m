%Part B
%a
load('LPF.mat');

%h2
h2_len = length(h2);
w = linspace(-pi,pi,h2_len);
subplot(2,2,1);
fft_h2 = fftshift(fft(h2));
plot(w,abs(fft_h2));
title('Transfer Function H2')
xlabel('\omega [rad/sec]');
ylabel('H2');

%h3
h3_len = length(h3);
w = linspace(-pi,pi,h3_len);
subplot(2,2,2);
fft_h3 = fftshift(fft(h3));
plot(w,abs(fft_h3));
title('Transfer Function H3')
xlabel('\omega [rad/sec]');
ylabel('H3');

%h4
h4_len = length(h4);
w = linspace(-pi,pi,h4_len);
subplot(2,2,3);
fft_h4 = fftshift(fft(h4));
plot(w,abs(fft_h4));
title('Transfer Function H4')
xlabel('\omega [rad/sec]');
ylabel('H4');

%h6
h6_len = length(h6);
w = linspace(-pi,pi,h6_len);
subplot(2,2,4);
fft_h6 = fftshift(fft(h6));
plot(w,abs(fft_h6));
title('Transfer Function H6')
xlabel('\omega [rad/sec]');
ylabel('H6');

%b
w = linspace(-pi,pi,2*1000+1);
n = -1000:1000;
xn = cos((2.*pi./5).*n) + cos(((pi)./5).*n);
fft_xn = fftshift(fft(xn));
plot(w,abs(fft_xn));
title('X(e^{j\omega})')
ylabel('X(e^{j\omega})');
xlabel('\omega [rad/sec]');

%d
load('LPF.mat');
n = -10000:10000;
xn = cos((2*pi/5)*n) + cos(((pi)/5)*n);

%h2
yn2 = conv(xn,h2);
yn2_len = length(yn2);
fft_yn2 = fftshift(fft(yn2));
w = linspace(-pi,pi,yn2_len);
subplot(2,2,1);
plot(w,abs(fft_yn2));
title('Y_2(e^{j\omega})');
xlabel('\omega [rad/sec]');
ylabel('Y_2(e^{j\omega})');

%h3
yn3 = conv(xn,h3);
yn3_len = length(yn3);
fft_yn3 = fftshift(fft(yn3));
w = linspace(-pi,pi,yn3_len);
subplot(2,2,2);
plot(w,abs(fft_yn3));
title('Y_3(e^{j\omega})');
xlabel('\omega [rad/sec]');
ylabel('Y_3(e^{j\omega})');

%h4
yn4 = conv(xn,h4);
yn4_len = length(yn4);
fft_yn4 = fftshift(fft(yn4));
w = linspace(-pi,pi,yn4_len);
subplot(2,2,3);
plot(w,abs(fft_yn4));
title('Y_4(e^{j\omega})');
xlabel('\omega [rad/sec]');
ylabel('Y_4(e^{j\omega})');

%h6
yn6 = conv(xn,h6);
yn6_len = length(yn6);
fft_yn6 = fftshift(fft(yn6));
w = linspace(-pi,pi,yn6_len);
subplot(2,2,4);
plot(w,abs(fft_yn6));
title('Y_6(e^{j\omega})');
xlabel('\omega [rad/sec]');
ylabel('Y_6(e^{j\omega})');

%e
n = -50:50;
xn = cos((2.*pi./5).*n) + cos(((pi)./5).*n);

%h2
yn2 = conv(xn,h2);
subplot(2,2,1);
plot(n,yn2(1:101));
hold on;
plot(n, xn);
hold off;
title('x[n] and y_2[n]');
xlabel('n [sec]');
ylabel('x[n] and y_2[n]');
axis([0 50 -1.5 2.5]);

%h3
yn3 = conv(xn,h3);
subplot(2,2,2);
plot(n,yn3(1:101));
hold on;
plot(n, xn);
hold off;
title('x[n] and y_3[n]');
xlabel('n [sec]');
ylabel('x[n] and y_3[n]');
axis([0 50 -1.5 2.5]);

%h4
yn4 = conv(xn,h4);
subplot(2,2,3);
plot(n,yn4(1:101));
hold on;
plot(n, xn);
hold off;
title('x[n] and y_4[n]');
xlabel('n [sec]');
ylabel('x[n] and y_4[n]');
axis([0 50 -1.5 2.5]);

%h6
yn6 = conv(xn,h6);
subplot(2,2,4);
plot(n,yn6(1:101));
hold on;
plot(n, xn);
hold off;
title('x[n] and y_6[n]');
xlabel('n [sec]');
ylabel('x[n] and y_6[n]');
axis([0 50 -1.5 2.5]);



