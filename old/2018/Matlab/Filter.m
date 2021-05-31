clear; close all; clc;  %% clear all

N = 100;  % sequence length of the input

A = [1, -3.3635, 5.0685, -4.2759, 2.1067, -0.5707, 0.0661]; % denominator coefficients
B =  [0, 0.0006, 0.0101, 0.0161, 0.0041, 0.0001, 0];      % nominator coefficients

%x = sin(pi/4*(0:N-1));  % sinusoidal input
x = zeros(1,N); x(7)=1;  % Impulse input
y = zeros(1,N); 
for n = 7:N   % computation of the output using difference equation
    y(n) = B(1)*x(n) + B(2)*x(n-1) + B(3)*x(n-2) + B(4)*x(n-3) + B(5)*x(n-4) + B(6)*x(n-5)...
        -A(2)*y(n-1) - A(3)*y(n-2) - A(4)*y(n-3) - A(5)*y(n-4) - A(6)*y(n-5) - A(7)*y(n-6);
end

figure
plot((1:N),x,'b-+',(1:N),y,'r-o')
grid
legend('Input','Output')
xlabel('Time [index n]')
ylabel('Output value')
title('Impulse Response')

%freq response
j = 0;
omega1 = -pi:.1:pi; % frequency range
H = zeros(size(omega1));
for omega = omega1
    j = j + 1;
    H(j) = (exp(1i*omega*(0:6))*B')/(exp(1i*omega*(0:6))*A');
end

figure
subplot(211)
plot(omega1,abs(H))
grid
xlabel('\omega [rad/sample]')
title('Absolute Frequency Response')
ylabel('Magnitude')

subplot(212)
plot(omega1,angle(H)*180/pi)
grid
xlabel('\omega [rad/sample]')
title('Phase Frequency Response')
ylabel('Phase [degrees]')