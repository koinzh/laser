lambda = 1500e-9; % wavelength
L = 0.5e-3; % arm length  
n_init = 3; % initial effective index
dn = 0.03; % change in effective index
neff2 = 3;

% array of effective indices  
neff1 = n_init:0.0005:n_init+dn;  

% calculate phase  
delta_phi = (2*pi/lambda) .*( neff1 .* L - neff2 * L);  

% calculate output intensities
I1 = sin(delta_phi/2) .* sin(delta_phi/2);   
I2 = cos(delta_phi/2) .* cos(delta_phi/2);

% plot intensities
figure;
plot(neff1,I1,'b-',neff1,I2,'r--'); 
legend('I1','I2');
xlabel('Effective Index');
ylabel('Normalized Intensity');
title('MZI Output Intensity vs Change in Effective Index');