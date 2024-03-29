%Run this before the simulation to set initial conditions and constants
g = 9.81; %Assuming g is roughly constant throughout flight
p0 = 101325; %Sea level pressure in Pa
gamma = 1.4; %Specific heat ratio for dry air
R = 287; %Gas constnat for air
sigma = 5.6704e-8; %Stefan-boltzmann constant in W/m^2.K

m_dry = 63; %Dry mass of rocket in kg

of = 3; % Oxidiser-Fuel ratio
m0_fuel = 19; %Fuel mass of rocket in kg
m0_ox = of * m0_fuel; % Oxidizer mass of rocket in kg
m0 = m_dry + m0_ox + m0_fuel;

Isp = 220; %Specific impulse of the rocket in s - assume roughly 200 for amateur propulsion system
V_e = g*Isp; %Work out exhaust velocity from Isp in m/s

F = 5000; %Thrust at liftoff in N

m_f_dot = 0.5 * F/V_e; %Assume constant m_dot throughout flight (i.e. constant throttle setting)
m_ox_dot = 3*m_f_dot;

De = 50; %Nozzle exit diameter in mm
A_e = pi*(De/2000)^2; %Nozzle exit area (should be calculated from engine design)

r_n = 0.001; %Nose radius of nosecone tip in m (I think)
epsilon = 0.1; %Emissivity coefficient of the nosecone tip

Cd = 0.5; %Drag coefficient (neglecting supersonic drag for now)
D = 0.25; %Rocket diameter in m
A = (pi*D^2)/4; %CS area of rocket in m^2

Cd_para = 1.75; %Parachute drag coefficient
D_para = 1.2; %Parachute diameter in m
A_para = (pi*D_para^2)/4; %Parachute area in m^2

D_drogue = 0.4; %Parachute diameter in m
A_drogue = (pi*D_drogue^2)/4; %Parachute area in m^2

% 
% mdl = gcs;
% thrustValues = [4000];
% for i = 1:numel(thrustValues)
%     F = thrustValues(i);
%     m_dot = F/V_e; %Assume constant m_dot throughout flight (i.e. constant throttle setting)
%     results = sim(mdl);
%     
%     subplot(3,1,1);
%     plot(results.logsout.get("Velocity (ms^-^1)").Values)
%     hold on
%     subplot(3,1,2);
%     plot(results.logsout.get("Convective heat transfer rate (W/cm^2)").Values)
%     hold on
%     subplot(3,1,3);
%     plot(results.logsout.get("Ambient Pressure (kPa)").Values)
%     hold on
%     
%     %legendLabels{i} = "Thrust = " + num2str(F/1000) + "kN";
%     
%     disp("Simulation " + num2str(i) + " complete")
% end
% %legend(legendLabels)
% hold off
