clc
clear

addpath(genpath('.'))

load sample1_IMEC_dataset

%% Sample 1
tic
[sample1_0p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample1,background_0p5mm,sample1_0p5mm);


[sample1_1p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample1,background_1p0mm,sample1_1p0mm);

[sample1_1p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample1,background_1p5mm,sample1_1p5mm);

[sample1_2p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample1,background_2p0mm,sample1_2p0mm);

[sample1_2p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample1,background_2p5mm,sample1_2p5mm);

[sample1_3p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample1,background_3p0mm,sample1_3p0mm);

[sample1_3p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample1,background_3p5mm,sample1_3p5mm);

[sample1_4p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample1,background_4p0mm,sample1_4p0mm);

[sample1_4p5mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample1,background_4p5mm,sample1_4p5mm);

[sample1_5p0mm_thick,~]...
    = invert_spectra_oil(Abs_spectrum_sample1,background_5p0mm,sample1_5p0mm);

toc

clear Abs_spectrum_sample1 b background_0p5mm background_1p0mm background_1p5mm background_2p0mm
clear background_2p5mm background_3p0mm background_3p5mm background_4p0mm background_4p5mm background_5p0mm
clear lambda lambda_true sample1_0p5mm sample1_1p0mm sample1_1p5mm sample1_2p0mm sample1_2p5mm sample1_3p0mm
clear sample1_3p5mm sample1_4p0mm sample1_4p5mm sample1_5p0mm

