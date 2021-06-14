T = 2;
points = 200;
t = linspace(-50,50,points);
n = linspace(-50,50,points/T);
x1 = sinc(t./6);
xn = sinc(T.*n./6);
x_diraccomb = zeros(size(t));
j = 1;
for i=1:length(t)
    if mod(t(i), T) == 0
        x_diraccomb(i)= xn(j);
        j = j + 1;
    end
end
y = conv(x_diraccomb, sinc((1/T) * t), 'same');
figure;
plot(t,y);
hold on;
plot(t,x1);
hold on;
stem(n,xn);
hold on;
plot(t,x_diraccomb);
hold on;
%plot(t,sinc(t*(1/T)));
hold off;
title('xn_1 - Ideal')
ylabel('x_1');
xlabel('t[sec]');

  