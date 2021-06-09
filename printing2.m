%e- xn1 foh

T=2;
N=10;
L=T*N;
n = -100:100;
t = linspace(-100,100,length(xn1)*L);
xn1 =  sinc(T.*n./6);
for i=1:length(xn1)-1
    for j=1:L
        foh(i*L+j) = xn1(i)+(j/L)*(xn1(i+1)-xn1(i))
    end;
end;   
figure;
plot(t,foh);
hold on;
plot(n,xn1);
hold off;
title('xn_1 - FOH ')
ylabel('|xn_1|');
xlabel('n [sec]');






