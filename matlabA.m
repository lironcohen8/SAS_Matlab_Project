%PartA

%d
n = -10:10;
sympref('HeavisideAtOrigin', 1);
h = (((0.5).^n.*heaviside(n)) + ((0.75).^n.*heaviside(n-2)));
plot(n,h);
title('h[n]');
xlabel('n[sec]');
ylabel('h[n]');

%E - Transfer function

syms n;
sympref('HeavisideAtOrigin', 1);
h = (((0.5).^n.*heaviside(n)) + ((0.75).^n.*heaviside(n-2)));
H = ztrans(h); 
z = -10:10;
h1=1-(3./(4.*z))+9./(16.*z.^2)-9./(32.*z.^3);
h2=1-(3./(4.*z))-(1./(2.*z))+(3./(8.*z.^2));
%H =h1./h2;
plot(z,H)
title('Transfer Function')
xlabel('n [sec]'),ylabel('|Transfer function|');

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





