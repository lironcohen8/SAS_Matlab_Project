clear;
clearvars;

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
