%PartA

%d
n = -10:10;
sympref('HeavisideAtOrigin', 1);
h = (((0.5).^n.*heaviside(n)) + ((0.75).^n.*heaviside(n-2)));
plot(n,h);
title('h[n]');
xlabel('n[sec]');
ylabel('h[n]');

%e
sympref('HeavisideAtOrigin', 1);
syms n;
h = (((0.5).^n.*heaviside(n)) + ((0.75).^n.*heaviside(n-2)));
H = ztrans(h);
[numerator, denominator] = numden(H);
disp(numerator/denominator);


%f
sympref('HeavisideAtOrigin', 1);
h = (((0.5).^n.*heaviside(n)) + ((0.75).^n.*heaviside(n-2)));
H = ztrans(h);
[numerator, denominator] = numden(H);
numerator_c = sym2poly(numerator);
denominator_c = sym2poly(denominator);
ts = 1;
sys = tf(numerator_c,denominator_c,ts);
pzmap(sys)





