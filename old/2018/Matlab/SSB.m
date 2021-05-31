clear; close all
[z,Fs] = audioread('sara.wav');
x0 = z(1:32);
x = interp(x0,10);
Fs = Fs*10;
N = length(x);
X = (abs(fftshift(fft(x))));
F = (-N/2:N/2-1)./N*Fs;
Oc = 20000;
[lsb,usb] = hartley(x,Oc,Fs);
USB = (abs(fftshift(fft(usb))));
LSB = (abs(fftshift(fft(lsb))));

[lsb1,usb1] = hartley(lsb,Oc,Fs);
Z = abs(fftshift(fft(lsb1)));

figure
subplot(411)
plot(F,X);
subplot(412)
plot(F,USB);
subplot(413)
plot(F,LSB);
subplot(414)
plot(F,Z)

function [lsb,usb] = hartley(x,Oc,Fs)
N = length(x);
t = (0:N-1)*(1/Fs);
y1 = x.*cos(2*pi*Oc*t');
xh = imag(hilbert(x));
y2 = xh.*sin(2*pi*Oc*t');
lsb = y1 + y2;
usb = y1 - y2;
end