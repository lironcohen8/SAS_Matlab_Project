clc;
close all;
clearvars;

%preform question for x1
part_X1()
%preform question for x2
part_X2()

function [] = plotInTime(tcont, x, x_origin, title_1, isDotted)
% Plot 2 signal in time, tcont is x axies, x is one signal, 
% x_origin is the second signal, title_1 is the figure title
% and isDotted is boolen that indicate if the first signal need to be
% dotted
    figure;
    if isDotted
        plot(tcont, x, '--', 'LineWidth', 1.5);
    else
        plot(tcont, x);
    end
    hold on;
    plot(tcont, x_origin);
    title(title_1);
    grid on;
    xlabel('time [s]');
    ylabel('amplitude');
    legend('restored signal','original signal');
end

function [] = plotHarmony(wcont, X, title_1)
% Plot Haromny, wcont is x axies, X is y axies 
% and title_1 is the figure title
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
    %Do qustions for x2 signal
    
    % points - amount of points in signal
    points = 1001;
    % w0 - signal frequency 1/6 rad/s
    w0 = 1/6;
    % Ttot - Total signal time
    Ttot = 200;
    % tcont = linspace(-(Ttot/2), (Ttot/2), points);
    t = linspace(-(Ttot/2), (Ttot/2), points);
    % x1 - "continuous" sinc signal
    x1 = sinc(w0 .* t);

    % part A - plot FT
    A_x1(points)
    % do part D and E with T=4
    T = 4;
    X1_calaForT(x1, Ttot, T, t)
    % do part D and E with T=9
    T = 9;
    X1_calaForT(x1, Ttot, T, t)
  end
 
 function A_x1(points)
    % Part A: plot FT of x1
    
    % w - Frequncy vector for {points} points from -pi to pi
    w = linspace(-pi, pi, points);
    % X1 - ft of x1, a rect of 6 height and pi/3 width
    X1 = 6 * rectangularPulse(-pi/6, pi/6, w);
    
    % plot FT
    plotHarmony(w, X1, 'X1 - FT of x1');
    axis([-pi pi -1 7]);
 end
  
function X1_calaForT(x1, Ttot, T, t)
    % preform parts D and E for a givven T
    % X1 is the orignal signal, Ttot is the total time length of the signal
    % T is the sampale time and t is the timespace var
    
    %w0 - sinc freq
    w0 = 1/6;
    
    % create 2001 samples for part D
    n = -1000:1000;
    x1n = sinc(w0 * T .* n);
    D(x1n, 1);
    
    % create samaples for part  E
    N = Ttot / T;
    n = linspace(-N/2 , N/2 , N+1);
    x1n = sinc(w0 * T .* n);
    E(x1, x1n, 1, t, T);
  end
  
function part_X2()
    %Do qustions for x2 signal
    
    % points - amount of points in signal
    points = 1001;
    % Ttot - Total signal time
    Ttot = 200;
    % tcont - Time vector for {points} points from -Ttot/2 to Ttot/2
    t = linspace(-(Ttot/2), (Ttot/2), points);
    % x2 - "continuous" cos and sin signal
    x2 = cos((pi/12) .* t) + sin((pi/6) .* t);
    
    % part A - plot FT
    A_x2();
    % do part D and E with T=4
    T = 4;
    X2_calaForT(x2, Ttot, T, t)
    % do part D and E with T=9
    T = 9;
    X2_calaForT(x2, Ttot, T, t)
  end
  
function A_x2()
    % Part A: plot FT of x2
    
    % create 4 diracs according to calculations, in X2 values rounded
    % becouse the values inside the dirac functions was approximately zero
    % but not exactly zero 
    w = -pi:(pi/(12^3)):pi;
    X2 = pi * (dirac(round(w-(pi/12),4)) + dirac(round(w+(pi/12), 4)) - 1i*dirac(round(w-(pi/6),4)) + 1i*dirac(round(w+(pi/6), 4)));
    X2 = abs(X2);
    % replace inf with pi for printing
    idx = X2 == Inf;
    X2(idx) = pi; 
    
    %plot FT
    plotHarmony(w, X2, 'X2 - FT of x2');
 end
  
  function X2_calaForT(x2, Ttot, T, t)
    % preform parts D and E for a givven T
    % x2 is the orignal signal, Ttot is the total time length of the signal
    % T is the sampale time and t is the timespace var
    
    % create 2001 samples for part D
    n = -1000:1000;
    x2n = cos((pi/12) * T .* n) + sin((pi/6) * T .* n);
    D(x2n, 2);
    
    % create samaples for part  E
    N = Ttot / T; 
    n = linspace(-N/2 , N/2 , N+1);
    x2n = cos((pi/12) * T .* n) + sin((pi/6) * T .* n);
    E(x2, x2n, 2, t, T);
  end
  
  function D(xn, nubmer)
    % Part D: plot xn DTFT, xn is the sampaled signal,
    % number is for the plot tite (1/2)
    
    X = fftshift(fft(xn));
    w = linspace(-pi, pi, length(X));
    plotHarmony(w, X, "X"+nubmer+"(e^j^w)");
  end
  
  function E(x, xn, number, t, T)
    % Part E: plot a ZOH, FOW and perfect restoring of the givven signal
    % x is the original signal, xn is the sampaled signal,
    % number is for the plot tite (1/2), t is the timespace var
    % and T is the sampale time
    
    printZoh(x, xn, number, t);
    printFow(x, xn, number, t);
    perfectRestoirng(x, xn, number, t, T);
  end
  
  function printZoh(x, xn, number, t)
  % ZOH restoring a signal, x is the original signal
  % xn is the sampaled signal, number is for the plot tite (1/2)
  % t is the timespace var
    
    %calculate the ZOH signal, L is the distance between samaples in time.
    %connect each 2 samaples with a linar line
    L = floor((length(t)-1) / (length(xn)-1));
    for i=1:length(xn)-1
        for j=1:L
            zoh((i-1) * L + j) = xn(i);
        end
    end
    zoh(length(t)) = xn(length(xn));
    
    %plot the restored signal and the in the same figure in time
    plotInTime(t, zoh, x, "ZOH x" + number, false);
  end
  
  function printFow(x, xn, number, t)
  % FOW restoring a signal, x is the original signal
  % xn is the sampaled signal, number is for the plot tite (1/2)
  % t is the timespace var
  
    %calculate the FOW signal, L is the distance between samaples in time.
    %connect each 2 samaples with a linar line
    L = floor((length(t)-1) / (length(xn)-1));
    for i=1:length(xn) - 1
        for j=1:L
            foh((i-1) * L + j) = ((L-j) / L) * xn(i) + (j / L)* xn(i+1);
        end
    end
    foh(length(t)) = xn(length(xn));
    
    %plot the restored signal and the in the same figure in time
    plotInTime(t, foh, x, "FOH x" + number, false);
  end
  
  function perfectRestoirng(x, xn, number, t, T)
  % perfect restoring a signal, x is the original signal
  % xn is the sampaled signal, number is for the plot tite (1/2)
  % t is the timespace var and T is the sampale time
  
    %convert xn to continues signal using dirac comb ("rakevet halamim")
    x_diraccomb = zeros(size(t));
    j = 1;
    for i=1:length(t)
        if mod(t(i), T) == 0
            x_diraccomb(i)= xn(j);
            j = j + 1;
        end
    end
    
    %restore the signal using convolution beteewn sinc function and the
    %firac comb in time
    y = conv(x_diraccomb, sinc((1/T) * t), 'same');
    %plot the restored signal and the in the same figure in time
    plotInTime(t, y, x, "Ideal restoing x" + number, true);
  end
   