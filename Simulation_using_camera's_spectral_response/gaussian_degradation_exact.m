function red_spec = gaussian_degradation_exact(R,val)

%SR: Spectral resolution: Full width half maximum
% val: Spectral response function

red_spec = R'*val/sum(val);
