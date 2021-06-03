%e
w = linspace(-pi,pi,2*10000+1);
n = -10:10;
xn = cos((2.*pi./5).*n) + cos(((pi)./5).*n);
yn2 = cos((2.*pi./5).*n) + cos(((pi)./5).*n);
yn3 = cos(((pi)./5).*n);
yn4 = cos(((pi)./5).*n);
yn6 = 0;
%h2
stem(n,abs(yn2));
hold on
stem(n, abs(xn));
hold off
title('x[n] and y_3[n]')
xlabel('n [sec]');
ylabel('y_2n');

%h3
stem(n,abs(yn3),n, abs(xn));
hold on;
plot(n, abs(xn));
hold off;
title('x[n] and y_3[n]')
xlabel('n [sec]');
ylabel('y_3n');

%h4
title('x[n] and y4[n]')
xlabel('n [sec]');
ylabel('y_4n');
%h6
stem(n,abs(yn6));
hold on;
plot(n, abs(xn));
hold off;
title('x[n] and y_6[n]')
xlabel('n [sec]');
ylabel('y_6n');


