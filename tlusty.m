clc;
close all;
clearvars;



partC_X1()
partC_X2()

function [] = plotInTime(tcont, x, title_1)
    figure;
    plot(tcont, x);
    title(title_1);
    xlabel('time [s]');
    ylabel('amplitude');
end

function [] = plotInSteps(N, x, title_1)
    n= -N:N;
    figure;
    stem(n, x(1:2 * N + 1));
    title(title_1);
    xlabel('steps [n]');
    ylabel('amplitude');
end

function [] = plotHarmony(wcont, X, title_1)
    figure;
    plot(wcont, abs(X));
    title(title_1);
    xlabel('frequency (Hz)');
    ylabel('magnitude');
    xticks([-pi, -pi/2, -pi/4, 0, pi/4, pi/2, pi])
    xticklabels({'-\pi', '-\pi/2', '-\pi/4', '0', '\pi/4', '\pi/2', '\pi'})
end
 
 function sectionA_x1(x1)
    % wcont - Frequncy vector for 10000 points from 0 to pi
    wcont = linspace(-pi, pi, 1000);
    % X1 - ft of x1
    X1 = fftshift(fft(x1));
    % plot X1
    plotHarmony(wcont, X1, 'X1 - FT of x1');
 end
 
  function partC_X1() 
    points = 1000;
    % w0 - signal frequency 1/6 rad/s
    w0 = 1/6;
    % Ttot - Total signal time
    Ttot = 200;
    % tcont - Time vector for 10000 points from -Ttot/2 to Ttot/2
    % tcont = linspace(-(Ttot/2), (Ttot/2), points);
    t = linspace(-(Ttot/2), (Ttot/2), points);
    % x1 - "continuous" sinc signal
    x1 = sinc(w0 .* t);
    % plot the input signal
    plotInTime(t, x1, 'input signal x1');
    % plot X1
    sectionA_x1(x1)
    
    N=100;
    T=4;
    n = linspace(-N, N , 2*N+1);
    
    x1n = sinc(w0 * T .* n);
    plotInSteps(N, x1n, "x1[n]");
    
    D(x1n, 1);
    E(x1n, 1, T, Ttot);
  end
  
  function partC_X2() 
    points = 1000;
    % Ttot - Total signal time
    Ttot = 200;
    % tcont - Time vector for 10000 points from -Ttot/2 to Ttot/2
    t = linspace(-(Ttot/2), (Ttot/2), points);
    % x2 - "continuous" sinc signal
    x2 = cos((pi/12) .* t) + sin((pi/6) .* t);
    % plot the input signal
    plotInTime(t, x2, 'input signal x2');
    % plot X1
    % sectionA_x1(x1)
    
    N=100;
    T=4;
    n = linspace(-N, N , 2*N+1);
    
    x2n = cos((pi/12) * T .* n) + sin((pi/6) * T .* n);
    plotInSteps(N, x2n, "x2[n]");
    
    D(x2n, 2); % check heights
    E(x2n, 2, T, Ttot);
  end
  
  function D(xn, nubmer)
    X = fftshift(fft(xn));
    w = linspace(-pi, pi, length(X));
    plotHarmony(w, X, "X"+nubmer+"(e^jw)");
  end
  
  function E(xn, number, T, Ttot)
    printZoh(xn, number, T, Ttot);
    printFow(xn, number, T, Ttot);
    perfectRestoirng(xn, number, T, Ttot);
  end
  
  function printZoh(xn, number, T, Ttot)
    N = 10; %number of steps per second
    L = T * N;
    t = linspace(-Ttot/2, Ttot/2, length(xn) * L);
    for i=1:length(xn) - 1
        for j=1:L
            zoh(i * L + j) = xn(i);
        end
    end
    plotInTime(t, zoh, "ZOH x" + number);
  end
  
  function printFow(xn, number, T, Ttot)
    N = 10; %number of steps per second
    L = T * N;
    t = linspace(-Ttot/2, Ttot/2, length(xn) * L);
    for i=1:length(xn) - 1
        for j=1:L
            foh(i * L + j) = ((L-j) / L) * xn(i) + (j / L)* xn(i+1);
        end
    end
    plotInTime(t, foh, "FOH x" + number);
  end
  
  function perfectRestoirng(xn, number, T, Ttot)
    t = linspace(-Ttot/2, Ttot/2, length(xn));
    length(xn)
    y = conv(xn, sinc((1/T) * t));
    length(y)
    length(t)
    plotInTime(t, y, 'input signal x111');
    
    %X = fftshift(fft(xn));
    %syms x
    %rect = T * rectangularPulse(-pi/T, pi/T, x)
    %Y = X .* rect;
    %w = linspace(-pi, pi, length(X));
    %plotHarmony(w, X, "X");
    %y = ifft(Y);
    %plotInTime(t, y, 'input signal x111');
  end
 
 
 
 
 
 
 