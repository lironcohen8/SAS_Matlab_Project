clc;
close all;
clearvars;

load('LPF.mat');

N = 10000;
n = -N:N;
x = 2 * cos((3 * pi / 10) .* n ) .* cos((pi / 10) .* n );
w = linspace(-pi, pi, length(h2));

H2= fftshift(fft(h2));
H3= fftshift(fft(h3));
H4= fftshift(fft(h4));
H6= fftshift(fft(h6));

A(H2, H3, H4, H6, w);
X = B(x, N);
[y2, y3, y4, y6] = E(x, h2, h3, h4, h6);
D(y2, y3, y4, y6);

function [] = plotInSteps(N, y, x, title_1)
    n= -N:N;
    figure;
    stem(n, y(1:2 * N + 1));
    hold on;
    stem(n, x(1:2 * N + 1));
    title(title_1);
    xlabel('steps [n]');
    ylabel('amplitude');
    axis([0 100 -2 3]);
    legend('y[n]','x[n]');
end

function [] = plotHarmony2(wcont, X, title_1, isNewFigure)
    if isNewFigure
        figure;
    end
    plot(wcont, abs(X));
    title(title_1);
    xlabel('frequency (Hz)');
    ylabel('magnitude');
    xticks([-pi, -pi/2, -pi/4, 0, pi/4, pi/2, pi])
    xticklabels({'-\pi', '-\pi/2', '-\pi/4', '0', '\pi/4', '\pi/2', '\pi'})
end

function [] = plotHarmony(wcont, X, title_1)
    plotHarmony2(wcont, X, title_1, true);
end

function [] = A(H2, H3, H4, H6, w)
    figure
    subplot(2,2,1)
    plotHarmony2(w, H2, "H2", false);
    subplot(2,2,2)
    plotHarmony2(w, H3, "H3", false);
    subplot(2,2,3)
    plotHarmony2(w, H4, "H4", false);
    subplot(2,2,4)
    plotHarmony2(w, H6, "H6", false);
end

function X = B(x, N)
    w = linspace(-pi, pi, 2*N+1);
    X = fftshift(fft(x));
    plotHarmony(w, X, "X(e^jw)");
end

function [] = D(y2, y3, y4, y6)
    Y2 = fftshift(fft(y2));
    Y3 = fftshift(fft(y3));
    Y4 = fftshift(fft(y4));
    Y6 = fftshift(fft(y6));
    
    w = linspace(-pi, pi, length(y2));
    
    plotHarmony(w, Y2, "Y2");
    plotHarmony(w, Y3, "Y3");
    plotHarmony(w, Y4, "Y4");
    plotHarmony(w, Y6, "Y6");
end

function [y2, y3, y4, y6] = E(x, h2, h3, h4, h6)
    y2 = conv(x, h2);
    y3 = conv(x, h3);
    y4 = conv(x, h4);
    y6 = conv(x, h6);
    
    N = 1000;
    
    plotInSteps(N, y2, x, "y2")
    plotInSteps(N, y3, x, "y3")
    plotInSteps(N, y4, x, "y4")
    plotInSteps(N, y6, x, "y6")
    
end
