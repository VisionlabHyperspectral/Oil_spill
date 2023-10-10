clc
clear

addpath(genpath('.'))

load sample4_spec_dataset_Visible

%% Considering only 5 bands

[~,b]=intersect(lambda,lambda_true);
Abs_spectrum_sample4 = Abs_spectrum_sample4(b); 
background_0p5mm = background_0p5mm(b);
background_1p0mm = background_1p0mm(b);
background_1p5mm = background_1p5mm(b);
background_2p0mm = background_2p0mm(b);
background_2p5mm = background_2p5mm(b);
background_3p0mm = background_3p0mm(b);
background_3p5mm = background_3p5mm(b);
background_4p0mm = background_4p0mm(b);
background_4p5mm = background_4p5mm(b);
background_5p0mm = background_5p0mm(b);

sample4_0p5mm = sample4_0p5mm(b);
sample4_1p0mm = sample4_1p0mm(b);
sample4_1p5mm = sample4_1p5mm(b);
sample4_2p0mm = sample4_2p0mm(b);
sample4_2p5mm = sample4_2p5mm(b);
sample4_3p0mm = sample4_3p0mm(b);
sample4_3p5mm = sample4_3p5mm(b);
sample4_4p0mm = sample4_4p0mm(b);
sample4_4p5mm = sample4_4p5mm(b);
sample4_5p0mm = sample4_5p0mm(b);

%% Sample 1
tic
[sample4_0p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample4,background_0p5mm,sample4_0p5mm);


[sample4_1p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample4,background_1p0mm,sample4_1p0mm);

[sample4_1p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample4,background_1p5mm,sample4_1p5mm);

[sample4_2p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample4,background_2p0mm,sample4_2p0mm);

[sample4_2p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample4,background_2p5mm,sample4_2p5mm);

[sample4_3p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample4,background_3p0mm,sample4_3p0mm);

[sample4_3p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample4,background_3p5mm,sample4_3p5mm);

[sample4_4p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample4,background_4p0mm,sample4_4p0mm);

[sample4_4p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample4,background_4p5mm,sample4_4p5mm);

[sample4_5p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample4,background_5p0mm,sample4_5p0mm);

toc

clear Abs_spectrum_sample4 b background_0p5mm background_1p0mm background_1p5mm background_2p0mm
clear background_2p5mm background_3p0mm background_3p5mm background_4p0mm background_4p5mm background_5p0mm
clear lambda lambda_true sample4_0p5mm sample4_1p0mm sample4_1p5mm sample4_2p0mm sample4_2p5mm sample4_3p0mm
clear sample4_3p5mm sample4_4p0mm sample4_4p5mm sample4_5p0mm

