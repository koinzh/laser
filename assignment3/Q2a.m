
%Q2b
%parameters
neff = 3.5;
ng = 3.5;
r = 0.9;
labmda0 = 1550*10^-9;
alpha = 300;
R = 10*10^-6;

Lr = 2*pi*R;
gamma = sqrt(exp(-alpha*Lr));

x = linspace(1.525*10^-6,1.575*10^-6,10000);
y = (r.^2 +gamma^2 - 2*r.*gamma.*cos(Lr*neff*2*pi./x))./(1 + r.^2*gamma^2 - 2*r.*gamma.*cos(Lr*neff*2*pi./x));
figure;
plot(x,y)
xlabel('Wavelength')
ylabel('Intensity transmission')
title('Intensity transmission vs Wavelength')