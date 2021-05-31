clc;
close all;
clearvars;
%%

N = 100;

const_sig = ones(1,N+1)

h = [];

for n=0:N
    h = [h; filt(n)]
end

output = conv(const_sig,h)
output = output(1:N+1)

plot((1:N+1),output);
title('y[n] as result of DC of amplitude 1')
xlabel('[n]')
ylabel('Amplitude')


function res = filt(n)
    res = n*(10 * 2 ^ n) + n*(5 * 2^n)
end