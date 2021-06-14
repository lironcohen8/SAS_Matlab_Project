clear;
clearvars;

T = 2;
N = 10;
points = 200;
t = linspace(-50,50,points);
n = linspace(-50,50,points/T);
x1 = sinc(t./6);
xn1 = sinc(n./6);
j=1;
for i = 1:length(t)
    if mod(i-1,T) == 0
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
hold on;
%stem(n,xn1);
hold on;
plot(t,xs);
hold on;
plot(t,sinc(t*(1/T)));
hold off;
title('xn_1 - Ideal')
ylabel('x_1');
xlabel('t[sec]');
