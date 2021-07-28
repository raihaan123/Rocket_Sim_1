%Run this before the simulation to set initial conditions and constants
g = 9.81; %Assuming g is roughly constant throughout flight
p0 = 101325; %Sea level pressure in Pa

m_dry = 30; %Dry mass of rocket in kg
m_Propellant = 83; %Propellant mass of rocket in kg

Isp = 200; %Specific impulse of the rocket in s - assume roughly 200 for amateur propulsion system
Ve = g*Isp; %Work out exhaust velocity from Isp in m/s

F = 3100; %Thrust at liftoff in N

m_dot = F/Ve; %Assume constant m_dot throughout flight (i.e. constant throttle setting)

De = 50; %Nozzle exit diameter in mm
Ae = pi*(De/2000)^2; %Nozzle exit area (should be calculated from engine design)

Cd = 0.5; %Drag coefficient (neglecting supersonic drag for now)
D = 0.25; %Rocket diameter in m
A = (pi*D^2)/4; %CS area of rocket