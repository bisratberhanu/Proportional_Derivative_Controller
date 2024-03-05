s= tf('s'); 
Gol = 1/((2*s+1)*(s+1)*(0.5*s+1)); % defining the open loop transfer function
pidtool(Gol) % using the matlab builtin function pid controller 
C = 9.007 + 1.88 * s; %after adjusting the pidtool,kp = 9.007 and kd=1.88 for phase margin of 25
% degree

G_uncompensated_cl = Gol / (1+Gol);  % defining the uncompensated closed loop transfer function
G_compensated_cl = (C * Gol) /(1 + (C*Gol)); % defining the compensated closed loop transfer function

% the following gives you the response of the compensated and uncompensated systems 

%impulse response
%------------------------
subplot(4,2,1);
impulse(G_uncompensated_cl); 
title('impulse response for the uncompensated system');
xlabel('time')
ylabel('Amplitude')
subplot(4,2,2);
impulse(G_compensated_cl);
title('impulse response for the compensated system');
xlabel('time')
ylabel('Amplitude')
%-----------------------

%Step response
%------------------------
subplot(4,2,3);
step(G_uncompensated_cl);
title('step response for the uncompensated system');
xlabel('time')
ylabel('Amplitude')
subplot(4,2,4);
step(G_compensated_cl);
title('step response for the compensated system');
xlabel('time')
ylabel('Amplitude')
%-----------------------------------

% ramp response
%---------------------------------
subplot(4,2,5);
step((1/s) * G_uncompensated_cl);
title('ramp response for the uncompensated system');
xlabel('time')
ylabel('Amplitude')
subplot(4,2,6);
step((1/s)*G_compensated_cl);
title('ramp response for the compensated system');
xlabel('time')
ylabel('Amplitude')
%--------------------------------

%Bode Plot Representation for the compensated and the uncompensated
subplot(4,2,7);
margin(Gol);

subplot(4,2,8);
margin(C * Gol);





