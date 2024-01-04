minimum = [];
labmda0 = 2199*10^-9;
r_Q2c = linspace(0.98, 0.995, 15);
lambda_Q2c = linspace(2.19*10^-6, 2.20*10^-6, 10000);
Lr_Q2c = 2*pi*R;
gamma_Q2c = sqrt(exp(-alpha*Lr_Q2c));

for r = r_Q2c
    temp = 1;
    for lambda = lambda_Q2c
        y = (r.^2 +gamma_Q2c^2 - 2*r.*gamma_Q2c.*cos(Lr_Q2c*neff*2*pi./lambda))./(1 + r.^2*gamma_Q2c^2 - 2*r.*gamma_Q2c.*cos(Lr_Q2c*neff*2*pi./lambda));
        if y < temp
            temp=y;
        end
    end
    minimum = [minimum, temp];
end
figure; 
plot(r_Q2c, minimum)
grid on
xlabel('Coupling coefficient')
ylabel('Intensity transmission')
title('Intensity transmission vs Coupling coefficient')