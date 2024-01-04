% MZI parameters
lambda_0 = 1500e-9; % central wavelength (m)
n_eff = 3; 

L1 = 0.5e-3; % Length of arm 1 (m)  
L2 = 5e-3;  % Length of arm 2 (m)

% Wavelength sweep
lambda = linspace(1500e-9,1501e-9,100);  

% Calculate phase difference
beta = (2*pi*n_eff) ./ lambda; 
delta_beta = beta .* (L2 - L1);  

% Intensities of outputs
I1 = cos(delta_beta/2).^2;  
I2 = sin(delta_beta/2).^2;   

% Plot
figure;
plot(lambda*1e9,I1,'b-',lambda*1e9,I2,'r--'); 
xlabel('Wavelength (nm)');
ylabel('Intensity (a.u.)');
legend('Output 1','Output 2');
title('Asymmetric MZI Output Intensities vs Wavelength');