p = 5.0e6 / 1e5;
%T = linspace(300, 500, 11)'-273.15;
T=[300,307.52,316.091,326.803,340.534,357.895,379.208,404.467,433.4,465.475,500]'-273.15;
Cp = zeros(size(T));
Cv = zeros(size(T));
rho = zeros(size(T));
k = zeros(size(T));
mu = zeros(size(T));

for i = 1 : max(size(T))
	temp = T(i);
	Cp(i) = XSteam('cp_pt', p, temp);
	Cv(i) = XSteam('cv_pt', p, temp);
	rho(i) = XSteam('rho_pt', p, temp);
	k(i) = XSteam('tc_pt', p, temp);
	mu(i) = XSteam('my_pt', p, temp);
end

result = [T+273.15, k, Cp, Cp./Cp, Cp, Cv, mu, p*ones(size(T)), p*ones(size(T)), zeros(size(T)), rho];

save -ascii RefWaterProperties.dat result
