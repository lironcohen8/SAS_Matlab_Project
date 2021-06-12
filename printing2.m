load('LPF.mat');
%e
n = -50:50;
xn = cos((2.*pi./5).*n) + cos(((pi)./5).*n);
%h2
yn2 = conv(xn,h2);
subplot(2,2,1);
plot(n,yn2(1:101));
hold on;
plot(n, xn);
hold off;
title('x[n] and y_2[n]');
xlabel('n [sec]');
ylabel('x[n] and y_2[n]');
axis([0 50 -1.5 2.5]);

%h3
yn3 = conv(xn,h3);
subplot(2,2,2);
plot(n,yn3(1:101));
hold on;
plot(n, xn);
hold off;
title('x[n] and y_3[n]');
xlabel('n [sec]');
ylabel('x[n] and y_3[n]');
axis([0 50 -1.5 2.5]);

%h4
yn4 = conv(xn,h4);
subplot(2,2,3);
plot(n,yn4(1:101));
hold on;
plot(n, xn);
hold off;
title('x[n] and y_4[n]');
xlabel('n [sec]');
ylabel('x[n] and y_4[n]');
axis([0 50 -1.5 2.5]);

%h6
yn6 = conv(xn,h6);
subplot(2,2,4);
plot(n,yn6(1:101));
hold on;
plot(n, xn);
hold off;
title('x[n] and y_6[n]');
xlabel('n [sec]');
ylabel('x[n] and y_6[n]');
axis([0 50 -1.5 2.5]);


