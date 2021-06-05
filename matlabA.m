%PartA
%D -Impulse response
n = -10:10;
u0 = n>=0;
u2 = n>=2;

f = ((0.5).^n).*u0 + ((0.75).^n).*u2;
plot(n,f)
title('Impulse Response')
xlabel('n [sec]'),ylabel('|Impulse response|');

%E - Transfer function
z = -10:10;
h1=1-(3./(4.*z))+9./(16.*z.^2)-9./(32.*z.^3);
h2=1-(3./(4.*z))-(1./(2.*z))+(3./(8.*z.^2));
H =h1./h2;
plot(n,H)
title('Transfer Function')
xlabel('n [sec]'),ylabel('|Transfer function|');

%F - pole zero map
numerator = [32,-24,18,-9];
denomanator = [32,-40,12,0];
ts = 1;
sys = tf(numerator,denomanator,ts);
pzmap(sys)






