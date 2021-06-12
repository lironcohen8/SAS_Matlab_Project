%e - xn2 ideal
T = 2;
N = 10;
n = -50:50;
xn2 = cos(T.*pi.*n./12)+sin(T.*pi.*n./6);
t = linspace(-50,50,length(xn2));
for i = 1:length(xn2)
    if mod(i,T) == 0
        xs(i) = xn2(i);
    else
        xs(i) = 0;
    end
end 
ideal = conv(xs, sinc(t./T), 'same');
figure;
plot(t,ideal);
hold on;
plot(n,xn2);
hold off;
title('xn_2 - Ideal');
ylabel('xn_2');
xlabel('n[sec]');
