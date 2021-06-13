
n = -10:10;
sympref('HeavisideAtOrigin', 1);
h = (((0.5).^n.*heaviside(n)) + ((0.75).^n.*heaviside(n-2)));
stem(n,h);
title('h[n]');
xlabel('n[sec]');
ylabel('h[n]');

