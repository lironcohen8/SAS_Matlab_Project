clear;
clearvars;
T = 2;
N = 1;
L = T*N;
n = -50:50;
xn1 = sinc(T.*n./6);

t = linspace(-50,50,length(xn1));
x1 = sinc(t./6);
for i = 1:L:length(xn1)-1
    for j = 0:L
        zoh(i+j) = xn1(i);
    end
end   
figure;
plot(t,zoh);
hold on;
plot(t,x1);
hold on;
stem(n,xn1)
hold off;
title('xn_1 - ZOH')
ylabel('x_1');
xlabel('t[sec]');