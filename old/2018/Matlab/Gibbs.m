%%% MATLAB script to demonstrate the Gibb's phenomenon.
clear; close all; clc;
t = -2 : 2/1000  :2;  % time axis
sq = [zeros(1,500),2*ones(1,1000),zeros(1,501)]; % square wave 
k = 2;
N = [1,3,7,19,49,70]; % number of Fourier Coefficients used
for n = 1:length(N) % different cases of 
    m = 1:N(n);
    an = 2*sinc(m/2); % Fourier coefficients for square wave
    fN = 1 + sum(diag(an)*cos(m'*pi*t/2),1); % Truncated Fourier series
    
    figure
    plot(t,sq,'r','LineWidth',2);hold on;
    plot(t,fN,'LineWidth',2); hold off; axis([-2 2 -0.5 2.5]);grid;
    xlabel('Time'), ylabel('x_N(t)');title(['Number of Coefficients: N = ',int2str(N(n))]);
end
%%% End of gibb.m