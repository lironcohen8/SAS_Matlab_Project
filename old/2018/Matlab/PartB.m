clear all;
load('LPF.mat')

%--------------- Plot freq responses of 4 filters given-----------
w = linspace(-pi,pi,80);

suptitle('Absolute Frequency Response')

subplot(2,2,1);
fft_h2 = fftshift(fft(h2));
plot(w,abs(fft_h2));
xlabel('\omega [rad]');
ylabel('Magnitude H2');

subplot(2,2,2);
% fft_h2 = exp(1j*w*40).*(fft(h2));
% plot(w,abs(fft_h2));
% xlabel('\omega [rad]');
% ylabel('Magnitude H2');
fft_h3 = fftshift(fft(h3));
plot(w,abs(fft_h3));
xlabel('\omega [rad]');
ylabel('Magnitude H3');

subplot(2,2,3);
fft_h4 = fftshift(fft(h4));
plot(w,abs(fft_h4));
ylabel('Magnitude H4');
xlabel('\omega [rad]');

subplot(2,2,4);
fft_h6 = fftshift(fft(h6));
plot(w,abs(fft_h6));
ylabel('Magnitude H6');
xlabel('\omega [rad]');

%--------------- End of ploting filters-----------
N = 10000;
w = linspace(-pi,pi,2*N+1);

n = -N:N;
x = cos((pi/5)*n) + cos(((2*pi)/5)*n);
fft_x = fftshift(fft(x));
figure
plot(w,abs(fft_x));
title('Absolute Frequency Response f[n] = cos((pi/5)*n) + cos(((2*pi)/5)*n')
ylabel('Magnitude f(x)');
xlabel('\omega [rad]');

%----------------seif D---------------------------------
w = linspace(-pi,pi,20080);
figure
subplot(2,2,1);
conv2 = conv(h2,x);
fft_conv2 = fftshift(fft(conv2));
plot(w,abs(fft_conv2));
title('Absolute Frequency Response of x[n] after filter h2');
ylabel('Magnitude ');
xlabel('\omega [rad]');

subplot(2,2,2);
conv3 = conv(h3,x);
fft_conv3 = fftshift(fft(conv3));
plot(w,abs(fft_conv3));
title('Absolute Frequency Response of x[n] after filter h3');
ylabel('Magnitude ');
xlabel('\omega [rad]');

subplot(2,2,3);
conv4 = conv(h4,x);
fft_conv4 = fftshift(fft(conv4));
plot(w,abs(fft_conv4));
title('Absolute Frequency Response of x[n] after filter h4');
ylabel('Magnitude ');
xlabel('\omega [rad]');

subplot(2,2,4);
conv6 = conv(h6,x);
fft_conv6 = fftshift(fft(conv6));
plot(w,abs(fft_conv6));
title('Absolute Frequency Response of x[n] after filter h6');
ylabel('Magnitude ');
xlabel('\omega [rad]');

%----------------end seif D---------------------------------

%----------------seif E---------------------------------
figure


subplot(2,2,1);
plot(conv2,'r');
hold on;
plot(x,'b');
title('y2[n] and x[n]');
ylabel('Magnitude ');
xlabel('n');
legend('y2[n]','x[n]');
axis([0 250 -2 3]);

subplot(2,2,2);
plot(conv3,'r');
hold on;
plot(x,'b');
title('y3[n] and x[n]');
ylabel('Magnitude ');
xlabel('n');
legend('y3[n]','x[n]');
axis([0 250 -2 3]);

subplot(2,2,3);
plot(conv4,'r');
hold on;
plot(x,'b');
title('y4[n] and x[n]');
ylabel('Magnitude ');
xlabel('n');
legend('y4[n]','x[n]');
axis([0 250 -2 3]);

subplot(2,2,4);
plot(conv6,'r');
hold on;
plot(x,'b');
title('y6[n] and x[n]');
ylabel('Magnitude ');
xlabel('n');
legend('y6[n]','x[n]');
axis([0 250 -2 3]);
%----------------end seif E---------------------------------
