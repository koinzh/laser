% define waveguide parameters
n1 = 2.61; % refractive of the core medium
n2 = 1.45; % refractive of cladding
lambda = 1480; % wavelength, (nm)

% calculate d_cutoff
k0 = lambda / 2;
kc = sqrt(n1^2 - n2^2); 
d_cutoff = k0 / kc; % d_cutoff

% output
fprintf('d_cutoff= %.4f\n', d_cutoff); % (nm)

