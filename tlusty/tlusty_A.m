clc;
close all;
clearvars;

A();
[numerator_coeffs, denomonstor_coeffs] = B();
C(numerator_coeffs, denomonstor_coeffs);

function A()
% Part A: plot a given Impulse Response 
% Impulse Response function: h[n] = (0.5)^n*u[u] + (0.75)^n*u[n-2]
    N = 10;
    n = -N:N;
    step0 = heaviside(n);
    step2 = heaviside(n-2);
    sympref('HeavisideAtOrigin', 1); % set step(0) = 1 and not 0.5
    h = step0.*(0.5).^n + step2.*(0.75).^n;
    plotInSteps(N, h, "PartA - Impulse Response");
end

function [numerator_coeffs, denomonstor_coeffs] = B() % set values returned to numerator_coeffs, denomonstor_coeffs
    % Transmission function as formula with ztrans (problem!)
    figure;
    syms n;
    sympref('HeavisideAtOrigin', 1);
    h_def = (((0.5)^n.*heaviside(n)) + ((0.75)^n.*heaviside(n-2)));
    H = ztrans(h_def);
    [numerator, denomonstor] = numden(H);
    numerator_coeffs = sym2poly(numerator);
    denomonstor_coeffs = sym2poly(denomonstor);
    H = tf(numerator_coeffs, denomonstor_coeffs);
    bodemag(H);
end

function [] = C(numerator_coeffs, denomonstor_coeffs)
    figure;
    zplane(numerator_coeffs, denomonstor_coeffs);
    title('Zeros and Poles plot');
end

function [] = plotInTime(tcont, x, title_1)
    figure;
    plot(tcont, x);
    title(title_1);
    xlabel('time [s]');
    ylabel('amplitude');
end

function [] = plotHarmony(wcont, X, title_1)
    figure;
    plot(wcont, abs(X));
    title(title_1);
    xlabel('frequency (Hz)');
    ylabel('magnitude');
end

function [] = plotInSteps(N, x, title_1)
    n = -N:N;
    figure;
    stem(n, x(1:2 * N + 1));
    title(title_1);
    xlabel('steps [n]');
    ylabel('amplitude');
end
