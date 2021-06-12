h = (((0.5).^n.*heaviside(n)) + ((0.75).^n.*heaviside(n-2)));
H = ztrans(h); 
z = -10:10;

%F - pole zero map
numerator = [32,-24,18,-9];
denominator = [32,-40,12,0];
ts = 1;
%sys = tf(numerator,denomanator,ts);
[num,den] = tfdata()
sys = tf(H);
pzmap(sys)
numden
