clear all;

%------ x1 = sinc(t/6)------
n = -70:70;
w = linspace(-pi, pi, 141);

T = 4;
figure
x1_4 = sinc((n*T/6));
fft_x1_4 = fftshift(fft(x1_4));
subplot(2,1,1);
stem(w,abs(fft_x1_4));
title('Freq Response of x1(t) sampled with T=4')
xlabel('\omega [rad]'),ylabel('Magnitude');

T = 8;
x1_8 = sinc((n*T/6));
fft_x1_8 = fftshift(fft(x1_8));
subplot(2,1,2);
stem(w,abs(fft_x1_8));
title('Freq Response of x1(t) sampled with T=8')
xlabel('\omega [rad]'),ylabel('Magnitude');
%----- x(t) = (sinc(t/12))^2 -----------
figure
T=4;
x2_4 = sinc((n*T/12)).*sinc((n*T/12));
% 
% plot(abs(fftshift(fft(sinc((n*T/12))))));
% 
% fft_x2_4_1 = fftshift(fft(sinc((n*T/12))));
% fft_x2_4_2 =fftshift(fft(sinc((n*T/12))));
% plot(abs(conv(fft_x2_4_1,fft_x2_4_2)));

fft_x2_4 = fftshift(fft(x2_4));
subplot(2,1,1);
plot(w,abs(fft_x2_4));
title('Freq Response of x2(t) sampled with T=4')
xlabel('\omega [rad]'),ylabel('Magnitude');

T=8;
x2_8 = sinc((n*T/12)).*sinc((n*T/12));
fft_x2_8 = fftshift(fft(x2_8));
subplot(2,1,2);
plot(w,abs(fft_x2_8));
title('Freq Response of x2(t) sampled with T=8')
xlabel('\omega [rad]'),ylabel('Magnitude'),axis([-4 4 0 3]);

%----- x(t) = cos((pi/12)t) -----------
figure
T=4;
x3_4 = cos((pi*n*T)/12);
fft_x3_4 = fftshift(fft(x3_4));
subplot(2,1,1);
plot(w,abs(fft_x3_4));
title('Freq Response of x3(t) sampled with T=4')
xlabel('\omega [rad]'),ylabel('Magnitude');

T=8;
x3_8 = cos((pi*n*T)/12);
fft_x3_8 = fftshift(fft(x3_8));
subplot(2,1,2);
plot(w,abs(fft_x3_8));
title('Freq Response of x3(t) sampled with T=8')
xlabel('\omega [rad]'),ylabel('Magnitude');


%----- x(t) = cos((pi/12)t) + sin((pi/6)t) -----------
figure
T=4;
x4_4 = cos((pi*n*T)/12) + sin((pi*n*T)/6);
fft_x4_4 = fftshift(fft(x4_4));
subplot(2,1,1);
plot(w,abs(fft_x4_4));
title('Freq Response of x4(t) sampled with T=4')
xlabel('\omega [rad]'),ylabel('Magnitude');

T=8;
x4_8 = cos((pi*n*T)/12) + sin((pi*n*T)/6);
fft_x4_8 = fftshift(fft(x4_8));
subplot(2,1,2);
plot(w,abs(fft_x4_8));
title('Freq Response of x4(t) sampled with T=8')
xlabel('\omega [rad]'),ylabel('Magnitude');

%-----------experiment ----------------
figure
T=4;
y = sin((pi*n*T)/6);
fft_y = fftshift(fft(y));
plot(w,abs(fft_y));

T
