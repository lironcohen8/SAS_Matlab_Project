%e- xn2 foh
T=2;
N=10;
L=T*N;
n = -50:50;
xn2 = cos(T.*pi.*n./12)+sin(T.*pi.*n./6);
t = linspace(-50,50,length(xn2)*L);
for i=1:length(xn2)-1
    for j=1:L
        foh(i*L+j) = xn2(i)+(j/L)*(xn2(i+1)-xn2(i))
    end;
end;   
figure;
plot(t,foh);
hold on;
plot(n,xn2);
hold off;
title('xn_2 - FOH ')
ylabel('|xn_2|');
xlabel('n [sec]');
