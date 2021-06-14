clear;
clearvars;

T = 2;
points = 200;
t = linspace(-50,50,points);
n = linspace(-50,50,points/T);
x1 = sinc(t./6);
xn1 = sinc(T*n./6);
j=1;
for i = 1:length(t)
    if mod(n(i),T) == 0
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
hold off;
title('xn_1 - Ideal')
ylabel('x_1');
xlabel('t[sec]');
