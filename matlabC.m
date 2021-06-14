clc;
close all;
clearvars;

%a
t = linspace(-100,100,200);
w = linspace(-pi,pi,200);
x1 = sinc(t./6);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
fft_x1= fftshift(fft(x1));
fft_x2= fftshift(fft(x2));

figure;
plot(w,abs(fft_x1));
title('X_1(j\Omega)')
ylabel('|X(j\Omega)|');
xlabel('\Omega [rad/sec]');

figure;
plot(w,abs(fft_x2));
title('X_2(j\Omega)');
ylabel('|X(j\Omega)|');
xlabel('\Omega [rad/sec]');

%d
n = linspace(-50,50,100);
T=2;
w = linspace(-pi,pi,100);
xn1 =  sinc(T.*n./6);
fft_xn1= fftshift(fft(xn1));
figure;
plot(w,abs(fft_xn1));
title('Xn_1(e^{j\omega})')
ylabel('|X(e^{j\omega})|');
xlabel('\omega[rad/sec]');

xn2 = cos(T.*pi.*n./12)+sin(T.*pi.*n./6);
fft_xn2= fftshift(fft(xn2));
figure;
plot(w,abs(fft_xn2));
title('Xn_2(e^{j\omega})')
ylabel('|X(e^{j\omega})|');
xlabel('\omega[rad/sec]');

%e
%e - xn1 zoh
T = 2;
N = 5;
L = T*N;
points = 200;
t = linspace(-50,50,points);
x1 = sinc(t./6);
n = linspace(-50,50,points/T);
xn1 = sinc(n./6);
for i = 1:length(xn1)-1
    for j = 1:L
        zoh((i-1)*L+j) = xn1(i);
    end
end   
figure;
t2 = linspace(-50,50,length(zoh));
plot(t2,zoh);
hold on;
plot(t,x1);
hold off;
title('xn_1 - ZOH')
ylabel('x_1');
xlabel('t[sec]');

%e - xn2 zoh
T = 2;
N = 5;
L = T*N;
points = 200;
t = linspace(-50,50,points);
n = linspace(-50,50,points/T);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
xn2 = cos(pi.*n./12)+sin(pi.*n./6);
for i = 1:length(xn2)-1
    for j = 1:L
        zoh((i-1)*L+j) = xn2(i);
    end
end   
figure;
t2 = linspace(-50,50,length(zoh));
plot(t2,zoh);
hold on;
plot(t,x2);
hold off;
title('xn_2 - ZOH')
ylabel('x_2');
xlabel('t[sec]');

%e - xn1 foh
T = 2;
N = 10;
L = T*N;
points = 75;
t = linspace(-50,50,points);
n = linspace(-50,50,points/T);
x1 = sinc(t./6);
xn1 =  sinc(n./6);
for i = 1:length(xn1)-1
    for j = 1:L
        foh((i-1)*L+j) = xn1(i)+(j/L)*(xn1(i+1)-xn1(i));
    end
end   
figure;
t2 = linspace(-50,50,length(foh));
plot(t2,foh);
hold on;
plot(t,x1);
hold off;
title('xn_1 - FOH')
ylabel('x_1');
xlabel('t[sec]');

%e - xn2 foh
T = 2;
N = 10;
L = T*N;
points = 75;
t = linspace(-50,50,points);
n = linspace(-50,50,points/T);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
xn2 = cos(pi.*n./12)+sin(pi.*n./6);
for i = 1:length(xn2)-1
    for j = 1:L
        foh((i-1)*L+j) = xn2(i)+(j/L)*(xn2(i+1)-xn2(i));
    end
end   
figure;
t2 = linspace(-50,50,length(foh));
plot(t2,foh);
hold on;
plot(t,x2);
hold off;
title('xn_2 - FOH')
ylabel('x_2');
xlabel('t[sec]');

%e - xn1 ideal
T = 2;
points = 200;
t = linspace(-100,100,points);
n = linspace(-100,100,points/T);
x1 = sinc(t./6);
xn1 = sinc(n./6);
j=1;
for i = 1:length(t)
    if mod(i,T) == 0
       xs(i) = xn1(j);
       j = j+1;
    else
       xs(i) = 0;
    end
end 
ideal = conv(xs, sinc(t./T), 'same');
figure;
plot(t,ideal);
hold on;
plot(t,x1);
hold off;
title('xn_1 - Ideal')
ylabel('x_1');
xlabel('t[sec]');
axis([-50 50 -0.4 1]);



%e - xn2 ideal
T = 2;
points = 200;
t = linspace(-100,100,points);
n = linspace(-100,100,points/T);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
xn2 = cos(pi.*n./12)+sin(pi.*n./6);
j=1;
for i = 1:length(t)
    if mod(i,T) == 0
       xs(i) = xn2(j);
       j = j+1;
    else
       xs(i) = 0;
    end
end 
ideal = conv(xs, sinc(t./T), 'same');
figure;
plot(t,ideal);
hold on;
plot(t,x2);
hold off;
title('xn_2 - Ideal')
ylabel('x_2');
xlabel('t[sec]');
axis([-50 50 -2 2]);



%f - d
n = -50:50;
xn1 =  sinc(3.*n./2);
fft_xn1= fftshift(fft(xn1));
plot(n,abs(fft_xn1));
title('X_1(e^{j\omega})')
ylabel('|X_1(e^{j\omega})|');
xlabel('\omega[rad/sec]');

xn2 = cos(pi.*3.*n./4)+sin(pi.*3.*n./2);
fft_xn2= fftshift(fft(xn2));
plot(n,abs(fft_xn2));
title('X_2(e^{j\omega})')
ylabel('|X_2(e^{j\omega})|');
xlabel('\omega[rad/sec]');

%f - e - xn1 zoh
T = 9;
N = 5;
L = T*N;
points = 200;
t = linspace(-50,50,points);
x1 = sinc(t./6);
n = linspace(-50,50,points/T);
xn1 = sinc(n./6);
for i = 1:length(xn1)-1
    for j = 1:L
        zoh((i-1)*L+j) = xn1(i);
    end
end   
figure;
t2 = linspace(-50,50,length(zoh));
plot(t2,zoh);
hold on;
plot(t,x1);
hold off;
title('xn_1 - ZOH - T = 9')
ylabel('x_1');
xlabel('t[sec]');

%f - e - xn2 zoh
T = 9;
N = 5;
L = T*N;
points = 200;
t = linspace(-50,50,points);
n = linspace(-50,50,points/T);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
xn2 = cos(pi.*n./12)+sin(pi.*n./6);
for i = 1:length(xn2)-1
    for j = 1:L
        zoh((i-1)*L+j) = xn2(i);
    end
end   
figure;
t2 = linspace(-50,50,length(zoh));
plot(t2,zoh);
hold on;
plot(t,x2);
hold off;
title('xn_2 - ZOH - T = 9')
ylabel('x_2');
xlabel('t[sec]');


%f - e - xn1 foh
T = 9;
N = 10;
L = T*N;
points = 100;
t = linspace(-50,50,points);
n = linspace(-50,50,points/T);
x1 = sinc(t./6);
xn1 =  sinc(n./6);
for i = 1:length(xn1)-1
    for j = 1:L
        foh((i-1)*L+j) = xn1(i)+(j/L)*(xn1(i+1)-xn1(i));
    end
end   
figure;
t2 = linspace(-50,50,length(foh));
plot(t2,foh);
hold on;
plot(t,x1);
hold off;
title('xn_1 - FOH - T = 9')
ylabel('x_1');
xlabel('t[sec]');


%f - e - xn2 foh
T = 9;
N = 10;
L = T*N;
points = 75;
t = linspace(-50,50,points);
n = linspace(-50,50,points/T);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
xn2 = cos(pi.*n./12)+sin(pi.*n./6);
for i = 1:length(xn2)-1
    for j = 1:L
        foh((i-1)*L+j) = xn2(i)+(j/L)*(xn2(i+1)-xn2(i));
    end
end   
figure;
t2 = linspace(-50,50,length(foh));
plot(t2,foh);
hold on;
plot(t,x2);
hold off;
title('xn_2 - FOH - T = 9')
ylabel('x_2');
xlabel('t[sec]');

%f - e - xn1 ideal
T = 9;
points = 200;
t = linspace(-100,100,points);
n = linspace(-100,100,points/T);
x1 = sinc(t./6);
xn1 = sinc(n./6);
j=1;
for i = 1:length(t)
    if mod(i,T) == 0
       xs(i) = xn1(j);
       j = j+1;
    else
       xs(i) = 0;
    end
end 
ideal = conv(xs, sinc(t./T), 'same');
figure;
plot(t,ideal);
hold on;
plot(t,x1);
hold off;
title('xn_1 - Ideal - T = 9')
ylabel('x_1');
xlabel('t[sec]');
axis([-50 50 -0.4 1]);


%f - e - xn2 ideal
T = 9;
points = 200;
t = linspace(-100,100,points);
n = linspace(-100,100,points/T);
x2 = cos(pi.*t./12)+sin(pi.*t./6);
xn2 = cos(pi.*n./12)+sin(pi.*n./6);
j=1;
for i = 1:length(t)
    if mod(i,T) == 0
       xs(i) = xn2(j);
       j = j+1;
    else
       xs(i) = 0;
    end
end 
ideal = conv(xs, sinc(t./T), 'same');
figure;
plot(t,ideal);
hold on;
plot(t,x2);
hold off;
title('xn_2 - Ideal - T = 9')
ylabel('x_2');
xlabel('t[sec]');
axis([-50 50 -2 2]);


