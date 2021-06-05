numerator = [32,-24,18,-9];
denomanator = [32,-40,12,0];
ts = 1;
sys = tf(numerator,denomanator,ts);
pzmap(sys)
