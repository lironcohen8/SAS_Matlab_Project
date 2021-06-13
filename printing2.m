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
