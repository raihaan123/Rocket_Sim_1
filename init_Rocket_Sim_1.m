%Run this before the simulation to set initial conditions and constants
g = 9.81; %Assuming g is roughly constant throughout flight
p0 = 101325; %Sea level pressure in Pa

m_dry = 50; %Dry mass of rocket in kg
m_Propellant = 118; %Propellant mass of rocket in kg

Isp = 200; %Specific impulse of the rocket in s - assume roughly 200 for amateur propulsion system
Ve = g*Isp; %Work out exhaust velocity from Isp in m/s

F = 5000; %Thrust at liftoff in N

m_dot = F/Ve; %Assume constant m_dot throughout flight (i.e. constant throttle setting)

De = 50; %Nozzle exit diameter in mm
Ae = pi*(De/2000)^2; %Nozzle exit area (should be calculated from engine design)

Cd = 0.5; %Drag coefficient (neglecting supersonic drag for now)
D = 0.25; %Rocket diameter in m
A = (pi*D^2)/4; %CS area of rocket

mdl = gcs;
thrustValues = [2000, 2500, 3000, 3500, 5000, 7000];
for i = 1:numel(thrustValues)
    F = thrustValues(i);
    m_dot = F/Ve; %Assume constant m_dot throughout flight (i.e. constant throttle setting)
    results = sim(mdl);
    
    subplot(3,1,1);
    plot(results.logsout.get("Altitude (km)").Values)
    hold on
    subplot(3,1,2);
    plot(results.logsout.get("Velocity (ms^-1)").Values)
    hold on
    subplot(3,1,3);
    plot(results.logsout.get("Acceleration (ms^-2)").Values)
    hold on
    
    legendLabels{i} = "Thrust = " + num2str(F/1000) + "kN";
    
    disp("Simulation " + num2str(i) + " complete")
end
legend(legendLabels)
hold off