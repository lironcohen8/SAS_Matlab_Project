clc;
close all;
clearvars;



part_X1()
part_X2()

function [] = plotInTime(tcont, x, x_origin, title_1)
    figure;
    plot(tcont, x);
    hold on;
    plot(tcont, x_origin);
    title(title_1);
    grid on;
    xlabel('time [s]');
    ylabel('amplitude');
    legend('restored signal','original signal');
end

% function [] = plotInSteps(N, x, title_1)
%     n= -N/2:N/2;
%     figure;
%     stem(n, x(1:N + 1));
%     title(title_1);
%     xlabel('steps [n]');
%     ylabel('amplitude');
% end

function [] = plotHarmony(wcont, X, title_1)
    figure;
    plot(wcont, abs(X));
    title(title_1);
    grid on;
    xlabel('frequency (Hz)');
    ylabel('magnitude');
    xticks([-pi, -pi/2, -pi/4, 0, pi/4, pi/2, pi])
    xticklabels({'-\pi', '-\pi/2', '-\pi/4', '0', '\pi/4', '\pi/2', '\pi'})
end
 
function part_X1() 
    points = 1001;
    % w0 - signal frequency 1/6 rad/s
    w0 = 1/6;
    % Ttot - Total signal time
    Ttot = 200;
    % tcont = linspace(-(Ttot/2), (Ttot/2), points);
    t = linspace(-(Ttot/2), (Ttot/2), points);
    % x1 - "continuous" sinc signal
    x1 = sinc(w0 .* t);
    % plot the input signal
    % plotInTime(t, x1, 'input signal x1');
    % plot X1
    %A_x1(points)
    A_x1(points)
    
    T = 4;
    X1_calaForT(x1, Ttot, T, t)
    T = 9;
    X1_calaForT(x1, Ttot, T, t)
  end
 
 function A_x1(points)
    % wcont - Frequncy vector for {points} points from 0 to pi
    w = linspace(-pi, pi, points);
    % X1 - ft of x1
    rect = 6 * rectangularPulse(-pi/6, pi/6, w);
    % plot FT
    plotHarmony(w, rect, 'X1 - FT of x1');
    axis([-pi pi -1 7]);
 end
 
% function A(x, points, number, t)
%     % wcont - Frequncy vector for {points} points from 0 to pi
%     w = linspace(-pi, pi, length(t));
%     % X1 - ft of x1
%     X = fftshift(fft(x, length(t)));
%     % plot FT
%     plotHarmony(w, X, "X"+number+"   - FT of x1");
%  end
  
function X1_calaForT(x1, Ttot, T, t)
    w0 = 1/6;
    N = Ttot / T;
    
    n = -1000:1000;
    x1n = sinc(w0 * T .* n);
    % plotInSteps(N, x1n, "x1[n]");
    
    D(x1n, 1);
    
    n = linspace(-N/2 , N/2 , N+1);
    x1n = sinc(w0 * T .* n);
    E(x1, x1n, 1, t, T);
  end
  
function part_X2() 
    points = 1001;
    % Ttot - Total signal time
    Ttot = 200;
    % tcont - Time vector for 10000 points from -Ttot/2 to Ttot/2
    t = linspace(-(Ttot/2), (Ttot/2), points);
    % x2 - "continuous" sinc signal
    x2 = cos((pi/12) .* t) + sin((pi/6) .* t);
    % plot the input signal
    % plotInTime(t, x2, 'input signal x2');
    A_x2(points);
    % sectionA_x1(x1);
    
    T = 4;
    X2_calaForT(x2, Ttot, T, t)
    T = 9;
    X2_calaForT(x2, Ttot, T, t)
  end
  
function A_x2(points)
    % wcont - Frequncy vector for {points} points from 0 to pi
    w = linspace(-pi, pi, points);
    % X1 - ft of x1
    X2 = pi * (dirac(w-(pi/12)) + dirac(w+(pi/12)) - 1i*dirac(w-(pi/6)) + 1i*dirac(w+(pi/6)));
    i=X2==inf;
    X2(i)=pi;
    % plot FT
    plotHarmony(w, X2, 'X2 - FT of x2');
 end
  
  function X2_calaForT(x2, Ttot, T, t)
    N = Ttot / T;
    
    n = -1000:1000;
    x2n = cos((pi/12) * T .* n) + sin((pi/6) * T .* n);
    % plotInSteps(N, x2n, "x2[n]");
    
    D(x2n, 2); % check heights
    
    n = linspace(-N/2 , N/2 , N+1);
    x2n = cos((pi/12) * T .* n) + sin((pi/6) * T .* n);
    E(x2, x2n, 2, t, T);
  end
  
  function D(xn, nubmer)
    X = fftshift(fft(xn));
    w = linspace(-pi, pi, length(X));
    plotHarmony(w, X, "X"+nubmer+"(e^j^w)");
  end
  
  function E(x, xn, number, t, T)
    printZoh(x, xn, number, t);
    printFow(x, xn, number, t);
    perfectRestoirng(x, xn, number, t, T);
  end
  
  function printZoh(x, xn, number, t)
    L = floor((length(t)-1) / (length(xn)-1));
    for i=1:length(xn)-1
        for j=1:L
            zoh((i-1) * L + j) = xn(i);
        end
    end
    zoh(length(t)) = xn(length(xn));
    plotInTime(t, zoh, x, "ZOH x" + number);
  end
  
  function printFow(x, xn, number, t)
    L = floor((length(t)-1) / (length(xn)-1));
    for i=1:length(xn) - 1
        for j=1:L
            foh((i-1) * L + j) = ((L-j) / L) * xn(i) + (j / L)* xn(i+1);
        end
    end
    foh(length(t)) = xn(length(xn));
    plotInTime(t, foh, x, "FOH x" + number);
  end
  
  function perfectRestoirng(x, xn, number, t, T)
    x_diraccomb = zeros(size(t));
    j = 1;
    for i=1:length(t)
        if mod(t(i), T) == 0
            x_diraccomb(i)= xn(j);
            j = j + 1;
        end
    end
    y = conv(x_diraccomb, sinc((1/T) * t), 'same');
    plotInTime(t, y, x, "Ideal restoing x" + number);
  end
  
 
 