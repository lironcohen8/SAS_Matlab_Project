clear all; close all;
%%
%Part 1 plot of the fiters specrums

load('LPF.mat');


figure
suptitle('Absolute Frequency Response')


h2_l = length(h2)

w = linspace(-pi,pi,h2_l)

fft_h2 =  abs(fftshift(fft(h2)))
subplot(2,2,1);
plot(w,fft_h2)
xlabel('\omega [rad]');
ylabel('Magnitude H2');

h3_l = length(h3)

w = linspace(-pi,pi,h3_l)

fft_h3 =  abs(fftshift(fft(h3)))
subplot(2,2,2);
plot(w,fft_h3)
xlabel('\omega [rad]');
ylabel('Magnitude H3');

h4_l = length(h4)

w = linspace(-pi,pi,h4_l)

fft_h4 =  abs(fftshift(fft(h4)))
subplot(2,2,3);
plot(w,fft_h4)
xlabel('\omega [rad]');
ylabel('Magnitude H4');

h6_l = length(h6)

w = linspace(-pi,pi,h6_l)

fft_h6 =  abs(fftshift(fft(h6)))
subplot(2,2,4);
plot(w,fft_h6)
xlabel('\omega [rad]');
ylabel('Magnitude H6');

%%
% part 2
% b) plot of the input signal spectrum
N = 10000;
w = linspace(-pi,pi,2*N+1)

n = (-N:N)
x = cos((pi/5)*n) + cos(((2*pi)/5)*n);
fft_x = abs(fftshift(fft(x)))
figure
plot(w,fft_x)
title('Absolute Frequency Response')
ylabel('Magnitude');
xlabel('\omega [rad]');
%%
% d) output spectrums plot
w = linspace(-pi,pi,2*N+80)

y2_comp = conv(h2,x);
fft_y2 = abs(fftshift(fft(y2_comp)))
figure
plot(w,fft_y2)
title('Absolute Frequency Response y2 matlab colculated')
ylabel('Magnitude');
xlabel('\omega [rad]');

y3_comp = conv(h3,x);
fft_y3 = abs(fftshift(fft(y3_comp)))
figure
plot(w,fft_y3)
title('Absolute Frequency Response y3 matlab colculated')
ylabel('Magnitude');
xlabel('\omega [rad]');

y4_comp = conv(h4,x);
fft_y4 = abs(fftshift(fft(y4_comp)))
figure
plot(w,fft_y4)
title('Absolute Frequency Response y4 matlab colculated')
ylabel('Magnitude');
xlabel('\omega [rad]');

y6_comp = conv(h6,x);
fft_y6 = abs(fftshift(fft(y6_comp)))
figure
plot(w,fft_y6)
title('Absolute Frequency Response y6 matlab colculated')
ylabel('Magnitude');
xlabel('\omega [rad]');
%%
% e) output plot in time domain
figure
stem(n,y2_comp(1:20001),'r')
title('y2[n] and x[n] matlab colculated')
ylabel('Magnitude');
xlabel('\time [n]');
hold on;
stem(x,'b');
legend('y2[n]','x[n]');
axis([0 100 -1.5 2.5]);

hold off;

figure
stem(n,y3_comp(1:20001),'r')
title('y3[n] and x[n] matlab colculated')
ylabel('Magnitude');
xlabel('\time [n]');
hold on;
stem(x,'b');
legend('y3[n]','x[n]');
axis([0 100 -1.5 2.5]);
hold off;

figure
stem(n,y4_comp(1:20001),'r')
title('y4[n] and x[n] matlab colculated')
ylabel('Magnitude');
xlabel('\time [n]');
hold on;
stem(x,'b');
legend('y4[n]','x[n]');
axis([0 100 -1.5 2.5]);
hold off;

figure
stem(n,y6_comp(1:20001),'r')
title('y6[n] and x[n] matlab colculated')
ylabel('Magnitude');
xlabel('\time [n]');
hold on;
stem(x,'b');
legend('y6[n]','x[n]');
axis([0 100 -1.5 2.5]);
