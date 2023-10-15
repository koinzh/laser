% Define the waveguide parameters
d_cutoff= 3.41;% core radius (um)
n1 = 2.61;        % core refractive index
n2 = 1.45;       % cladding refractive index
lambda = 1.48;   % wavelength (um)

% Layer heights:
h1 = 2.0;           % Lower cladding
h2 = 2.723;           % Core thickness
h3 = 2.0;           % Upper cladding

% the fundamental TE mode:
%neff = planar_waveguide_TE(n1, n2, lambda, h1, h2, h3);
[nTE, nTM] = wg_1D_analytic (lambda, h2, n2, n1, n2);
fprintf(1,'neff = %.4f\n',neff);

