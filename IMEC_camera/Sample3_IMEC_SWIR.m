clc
clear

addpath(genpath('.'))

load sample3_IMEC_dataset

%% Sample 3
tic
[sample3_0p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample3,background_0p5mm,sample3_0p5mm);


[sample3_1p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample3,background_1p0mm,sample3_1p0mm);

[sample3_1p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample3,background_1p5mm,sample3_1p5mm);

[sample3_2p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample3,background_2p0mm,sample3_2p0mm);

[sample3_2p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample3,background_2p5mm,sample3_2p5mm);

[sample3_3p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample3,background_3p0mm,sample3_3p0mm);

[sample3_3p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample3,background_3p5mm,sample3_3p5mm);

[sample3_4p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample3,background_4p0mm,sample3_4p0mm);

[sample3_4p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample3,background_4p5mm,sample3_4p5mm);

[sample3_5p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample3,background_5p0mm,sample3_5p0mm);

toc

clear Abs_spectrum_sample3 b background_0p5mm background_1p0mm background_1p5mm background_2p0mm
clear background_2p5mm background_3p0mm background_3p5mm background_4p0mm background_4p5mm background_5p0mm
clear lambda lambda_true sample3_0p5mm sample3_1p0mm sample3_1p5mm sample3_2p0mm sample3_2p5mm sample3_3p0mm
clear sample3_3p5mm sample3_4p0mm sample3_4p5mm sample3_5p0mm

