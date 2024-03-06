# Proportional Derivative Controller

## Introduction

- A PD (Proportional-Derivative) controller is a type of feedback controller commonly 
used in control systems. It combines proportional and derivative control actions to 
improve the system's response and stability. The PD controller calculates the control 
signal based on the error between the desired setpoint and the actual output, as 
well as the rate of change of the error.
 
- 𝑢(𝑡) = 𝐾<sub>p</sub>(𝑡) + 𝐾<sub>d</sub> 𝑑𝑒(𝑡)/dt




- The problem at hand involves the design of a PD controller for a system with a given forward-path transfer function. The objective is to design a controller that satisfies certain specifications, including a specific value for the proportional gain (KP) and a 
phase margin greater than 25°. The goal is to achieve stable and satisfactory system 
performance by appropriately designing the controller. The following sections will 
outline the design procedure, analyze the system's stability, calculate static error 
constants and steady-state errors, determine the range of possible proportional 
controller values, and simulate the overall system using SIMULINK.

# Given Problem 
The forward-path transfer function of a system is 
G(s)H(s) = $$\frac{1}{{(2s + 1)(s + 1)(0.5s + 1)}}$$ 

(a) Design a PD controller such that the KP = 9, and the phase margin is greater than 25◦.
 
 (b) Determine the static error constants and the corresponding steady state errors of the 
compensated system. 

(c) What is the range of the possible values of a proportional controller that can be designed 
for this system.


# Design procedure
## Finding Kd
- A PD controller can be represented as 
 C= 𝐾<sub>p</sub> + 𝐾<sub>d</sub>s ……. where Kp is the proportional constant and kd is the derivative constant
  

![![alt text](Images\image.png)](/Images/image.png)

![![alt text](Images\image-1.png)](/Images/image-1.png)

![![alt text](Images\image-2.png)](/Images/image-2\.png)

![![alt text](Images\image-3.png)](/Images/image-3.png)

## Or 
- Using the MATLAB built-in tool pidtool, a PID controller can be simulated to fulfil a 
corresponding criterion. In this case a phase margin of 25 degree and KP fixed at 9.
- After a couple of iterations, the following parameters were obtained for the controller and the system.
k<sub>p</sub>=9.007 K<sub>d</sub>= 1.88 which is almost exactly the same as the calculation
- Gain margin= 13.3 dB and phase margin= 25 deg
- max overshoot= 50.3%
-closed loop stability- stable.
❖ Therefore, substituting the values for Kp and Kd 
- **Answer: Controller= 9 + 1.88S**
## Calculating the static error constants
① The static position error constant Kp is defined by:
$$Kp = lim_{{s \to 0}} G(s) = G(0)$$

$$𝐺(𝑠) = 𝐺𝑐𝑜𝑛𝑡𝑟𝑜𝑙𝑙𝑒𝑟(𝑠) = \frac{{9+1.9s}}{{𝑠^3 + \frac{7}{2}𝑠^2+ \frac{7}{2}s +1}}$$
this implies that 
$$kp= lim_{s \to 0}\frac{{9+1.9s}}{{𝑠^3 + \frac{7}{2}𝑠^2+ \frac{7}{2}s +1}}$$
② The static velocity error constant Kv is defined by:
 $$Kv = 𝒔 ∗ lim_{s \to 0}$$

  $$𝐺𝑐𝑜𝑛𝑡𝑟𝑜𝑙𝑙𝑒𝑑(𝑠) = \frac{{9+1.9s}}{{𝑠^3 + \frac{7}{2}𝑠^2+ \frac{7}{2}s +1}}$$

,this implies that 
$$Kv = lim_{s \to 0} s* \frac{{9+1.9s}}{{𝑠^3 + \frac{7}{2}𝑠^2+ \frac{7}{2}s +1}} = 0$$

- The static acceleration error constant Ka is defined by:
 $$Ka = 𝒔^𝟐 ∗ lim_{s \to 0} G(s)= 0$$






## Calculating the range of the possible values of a proportional controller 

![![alt text](Images\image-4.png)](/Images/image-4.png)
## MATLAB Plots and Interpretations
The impulse, step and ramp response of the compensated and uncompensated closed loop 
system is presented below using MATLAB.
Impulse response without controller

![![alt text](Images\image-5.png)](/Images/image-5.png)

![![alt text](Images\image-6.png)](/Images/image-6.png)

![![alt text](Images\image-7.png)](/Images/image-7.png)

![![alt text](Images\image-8.png)](/Images/image-8.png)
## INTERPRETATION
- From the impulse and step response of the compensated and uncompensated system we 
can conclude that:
- the uncompensated system is critically damped.
- the maximum overshot and the settling time are higher in the compensated system.
- the maximum overshoot and the settling time can be seen as the tradeoff for higher gain margin.

![![alt text](Images\image-9.png)](/Images/image-9.png)

![![alt text](Images\image-10.png)](/Images/image-10.png)
## Bode Plot Representation
- The Bode plot the corresponding margins can be drawn using the MATLAB function
Margin on the open loop transfer function of the system. 
- The Margin plot given below for the uncompensated system indicates that the 
Uncompensated system has a phase margin of -180 deg at 0 rad/s. this phase margin 
implies that we have no margin to add, in fact a simple addition of any phase will 
make the system unstable.

![![alt text](Images\image-11.png)](/Images/image-11.png)

![![alt text](Images\image-12.png)](/Images/image-12.png)

![![alt text](Images\image-13.png)](/Images/image-13.png)

## Conclusion
- The PD controller was successfully designed to meet the specifications of KP = 9 and a 
phase margin greater than 25°
- The chosen values for the proportional gain (KP) and derivative gain (KD) resulted in a 
stable system with a phase margin that exceeded the required 25°
- The static error constants and corresponding steady-state errors of the compensated 
system were determined. These values provide insights into the accuracy of the system 
in achieving the desired setpoint.
- The range of the possible values for the proportional controller was found to be -1 ≤ Kp 
≤ 18.1. This indicates that within this range, different proportional gains can be chosen 
to achieve the desired system performance
