altitude    = 50e3;
g0          = 9.81;
Ms          = 50;

Isp         = 200;
V_e         = Isp * g0;
T           = linspace(2, 10, 100) * 10^3;
t_b         = linspace(5, 30, 100);

[~, t_b]    = meshgrid(T, t_b);
[T, V_e]    = meshgrid(T, V_e);

Mf          = T .* t_b ./ V_e;

TOW         = (Mf + Ms) * g0;




h_c         = (altitude - (V_e .* log(1 + Mf/Ms) ).^2 / (2*g0)) / 10^3;      % (T.*t_b)./(V_e*Ms)

surf(Mf, t_b, h_c)

% xlim([0,50]);
zlim([0, 50]);