function neff = planar_waveguide_TE(n1, n2, lambda, h1, h2, h3)
% Calculate the effective refractive index of a planar waveguide for the TE mode
% n1: core refractive index
% n2: cladding refractive index
% lambda: wavelength (um)
% h1: lower cladding thickness (um)
% h2: core thickness (um)
% h3: upper cladding thickness (um)

k0 = 2*pi/lambda; % vacuum wavenumber
a = sqrt(h2^2*(n1^2-n2^2));
b = sqrt(h1^2*(n1^2-n2^2));
c = sqrt(h3^2*(n1^2-n2^2));
d = a+b+c;
neff = sqrt((d^2-a^2)/(4*b*c));
end
