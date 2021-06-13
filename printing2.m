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
