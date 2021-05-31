%PartA
%D -Impulse response
n = -10:10;
u0 = n>=0;
u2 = n>=2;

f = ((0.5).^n).*u0 + ((0.75).^n).*u2;
%stem(n,f)
title('Impulse response - Part A')
xlabel('n [sec]'),ylabel('Impulse response');

%E - Transfer function
z = -10:10;
h1=1-(3./(4.*z))+9./(16.*z.^2)-9./(32.*z.^3);
h2=1-(3./(4.*z))-(1./(2.*z))+(3./(8.*z.^2));
H =h1./h2;
%stem(n,H)
title('Transfer function - Part A')
xlabel('n [sec]'),ylabel('Transfer function');

%F - pole zero map
numerator = [32,-24,18,-9];
denomanator = [32,-40,12,0];
ts = 1;
sys = tf(numerator,denomanator,ts);
%pzmap(sys)

%Part B
%
load('LPF.mat');
w = linspace(-pi,pi,80);
%h2
subplot(2,2,1);
fft_h2 = fftshift(fft(h2));
%plot(w,abs(fft_h2));
title('Transfer function H2 - Part B')
xlabel('\omega [rad]');
ylabel('H2');

%h3
subplot(2,2,2);
fft_h3 = fftshift(fft(h3));
%plot(w,abs(fft_h3));
title('Transfer function H3 - Part B')
xlabel('\omega [rad]');
ylabel('H3');

%h4
subplot(2,2,3);
fft_h4 = fftshift(fft(h4));
%plot(w,abs(fft_h4));
title('Transfer function H4 - Part B')
xlabel('\omega [rad]');
ylabel('H4');

%h6
subplot(2,2,4);
fft_h6 = fftshift(fft(h6));
%plot(w,abs(fft_h6));
title('Transfer function H6 - Part B')
xlabel('\omega [rad]');
ylabel('H6');

close;

w = linspace(-pi,pi,2*10000+1);
n = -10000:10000;
xn = cos((2.*pi./5).*n) + cos(((pi)./5).*n);
fft_xn = fftshift(fft(xn));
plot(w,abs(fft_xn));
title('x[n] DTFT')
ylabel('X(e^(j\omega))');
xlabel('\omega [rad]');





