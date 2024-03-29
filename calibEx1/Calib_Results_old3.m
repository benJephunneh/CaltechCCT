% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 657.331736293191060 ; 657.785701380050680 ];

%-- Principal point:
cc = [ 302.800525707620010 ; 242.365309269466880 ];

%-- Skew coefficient:
alpha_c = 0.000411144042315;

%-- Distortion coefficients:
kc = [ -0.253508198989057 ; 0.119569027747925 ; -0.000287688527452 ; 0.000040277753683 ; -0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 0.282506170751816 ; 0.286964766487752 ];

%-- Principal point uncertainty:
cc_error = [ 0.586378802306659 ; 0.552573258953629 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000188982591716;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.002290715866879 ; 0.009337185501975 ; 0.000120775067932 ; 0.000119942616959 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 25;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 1;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.654731e+00 ; 1.652452e+00 ; -6.703139e-01 ];
Tc_1  = [ -1.773229e+02 ; -8.361773e+01 ; 8.532239e+02 ];
omc_error_1 = [ 7.190890e-04 ; 9.084039e-04 ; 1.221846e-03 ];
Tc_error_1  = [ 7.631112e-01 ; 7.236185e-01 ; 4.009808e-01 ];

%-- Image #2:
omc_2 = [ 1.849140e+00 ; 1.901359e+00 ; -3.976474e-01 ];
Tc_2  = [ -1.546876e+02 ; -1.592641e+02 ; 7.577645e+02 ];
omc_error_2 = [ 7.539514e-04 ; 9.369109e-04 ; 1.485940e-03 ];
Tc_error_2  = [ 6.834693e-01 ; 6.404582e-01 ; 3.935001e-01 ];

%-- Image #3:
omc_3 = [ 1.742558e+00 ; 2.078417e+00 ; -5.060511e-01 ];
Tc_3  = [ -1.248807e+02 ; -1.744912e+02 ; 7.756550e+02 ];
omc_error_3 = [ 6.932762e-04 ; 9.849016e-04 ; 1.545149e-03 ];
Tc_error_3  = [ 6.998150e-01 ; 6.556742e-01 ; 3.732901e-01 ];

%-- Image #4:
omc_4 = [ 1.827647e+00 ; 2.117012e+00 ; -1.104309e+00 ];
Tc_4  = [ -6.407150e+01 ; -1.547072e+02 ; 7.791207e+02 ];
omc_error_4 = [ 6.554484e-04 ; 9.754675e-04 ; 1.457477e-03 ];
Tc_error_4  = [ 7.082981e-01 ; 6.560670e-01 ; 2.923170e-01 ];

%-- Image #5:
omc_5 = [ 1.079107e+00 ; 1.923190e+00 ; -2.534556e-01 ];
Tc_5  = [ -9.194597e+01 ; -2.288745e+02 ; 7.369483e+02 ];
omc_error_5 = [ 6.050775e-04 ; 9.379716e-04 ; 1.058458e-03 ];
Tc_error_5  = [ 6.743959e-01 ; 6.230809e-01 ; 3.638484e-01 ];

%-- Image #6:
omc_6 = [ -1.701561e+00 ; -1.929317e+00 ; -7.913588e-01 ];
Tc_6  = [ -1.486839e+02 ; -7.956330e+01 ; 4.446987e+02 ];
omc_error_6 = [ 5.812684e-04 ; 9.074386e-04 ; 1.243188e-03 ];
Tc_error_6  = [ 4.042649e-01 ; 3.862543e-01 ; 3.138856e-01 ];

%-- Image #7:
omc_7 = [ 1.996671e+00 ; 1.931926e+00 ; 1.310717e+00 ];
Tc_7  = [ -8.275283e+01 ; -7.761066e+01 ; 4.399452e+02 ];
omc_error_7 = [ 1.053318e-03 ; 5.925187e-04 ; 1.319834e-03 ];
Tc_error_7  = [ 4.073390e-01 ; 3.788625e-01 ; 3.277171e-01 ];

%-- Image #8:
omc_8 = [ 1.961170e+00 ; 1.824659e+00 ; 1.326644e+00 ];
Tc_8  = [ -1.698467e+02 ; -1.034001e+02 ; 4.617833e+02 ];
omc_error_8 = [ 1.012764e-03 ; 6.133987e-04 ; 1.270451e-03 ];
Tc_error_8  = [ 4.484543e-01 ; 4.122162e-01 ; 3.683263e-01 ];

%-- Image #9:
omc_9 = [ -1.363469e+00 ; -1.980495e+00 ; 3.222269e-01 ];
Tc_9  = [ -1.477853e+00 ; -2.249644e+02 ; 7.285509e+02 ];
omc_error_9 = [ 7.070103e-04 ; 9.048263e-04 ; 1.283048e-03 ];
Tc_error_9  = [ 6.705070e-01 ; 6.139984e-01 ; 3.852127e-01 ];

%-- Image #10:
omc_10 = [ -1.512978e+00 ; -2.086922e+00 ; 1.902170e-01 ];
Tc_10  = [ -2.907219e+01 ; -3.002672e+02 ; 8.602386e+02 ];
omc_error_10 = [ 8.815393e-04 ; 1.070775e-03 ; 1.711037e-03 ];
Tc_error_10  = [ 8.058668e-01 ; 7.291454e-01 ; 5.155377e-01 ];

%-- Image #11:
omc_11 = [ -1.793300e+00 ; -2.065357e+00 ; -4.798477e-01 ];
Tc_11  = [ -1.506665e+02 ; -2.352742e+02 ; 7.045966e+02 ];
omc_error_11 = [ 8.191854e-04 ; 1.012870e-03 ; 1.735267e-03 ];
Tc_error_11  = [ 6.584160e-01 ; 6.265017e-01 ; 5.125182e-01 ];

%-- Image #12:
omc_12 = [ -1.838980e+00 ; -2.087580e+00 ; -5.156159e-01 ];
Tc_12  = [ -1.331634e+02 ; -1.771286e+02 ; 6.047328e+02 ];
omc_error_12 = [ 6.887398e-04 ; 9.556553e-04 ; 1.582395e-03 ];
Tc_error_12  = [ 5.604746e-01 ; 5.299232e-01 ; 4.270715e-01 ];

%-- Image #13:
omc_13 = [ -1.918796e+00 ; -2.116790e+00 ; -5.944090e-01 ];
Tc_13  = [ -1.324043e+02 ; -1.434724e+02 ; 5.445406e+02 ];
omc_error_13 = [ 6.394903e-04 ; 9.365847e-04 ; 1.545907e-03 ];
Tc_error_13  = [ 5.037424e-01 ; 4.746688e-01 ; 3.873979e-01 ];

%-- Image #14:
omc_14 = [ -1.954147e+00 ; -2.124793e+00 ; -5.848276e-01 ];
Tc_14  = [ -1.233360e+02 ; -1.370537e+02 ; 4.905927e+02 ];
omc_error_14 = [ 6.003034e-04 ; 9.136524e-04 ; 1.507281e-03 ];
Tc_error_14  = [ 4.548001e-01 ; 4.272622e-01 ; 3.472829e-01 ];

%-- Image #15:
omc_15 = [ -2.110562e+00 ; -2.254099e+00 ; -4.957071e-01 ];
Tc_15  = [ -1.988791e+02 ; -1.344251e+02 ; 4.747370e+02 ];
omc_error_15 = [ 7.003048e-04 ; 8.726051e-04 ; 1.659706e-03 ];
Tc_error_15  = [ 4.476481e-01 ; 4.228835e-01 ; 3.721462e-01 ];

%-- Image #16:
omc_16 = [ 1.887157e+00 ; 2.336907e+00 ; -1.740773e-01 ];
Tc_16  = [ -1.562798e+01 ; -1.702052e+02 ; 6.955626e+02 ];
omc_error_16 = [ 9.650070e-04 ; 1.054539e-03 ; 2.099160e-03 ];
Tc_error_16  = [ 6.278431e-01 ; 5.832860e-01 ; 4.281698e-01 ];

%-- Image #17:
omc_17 = [ -1.612806e+00 ; -1.953575e+00 ; -3.471140e-01 ];
Tc_17  = [ -1.349838e+02 ; -1.388704e+02 ; 4.900254e+02 ];
omc_error_17 = [ 5.844269e-04 ; 8.684684e-04 ; 1.248905e-03 ];
Tc_error_17  = [ 4.460185e-01 ; 4.222696e-01 ; 3.082596e-01 ];

%-- Image #18:
omc_18 = [ -1.341789e+00 ; -1.692603e+00 ; -2.965796e-01 ];
Tc_18  = [ -1.851836e+02 ; -1.577283e+02 ; 4.411726e+02 ];
omc_error_18 = [ 6.625075e-04 ; 8.221451e-04 ; 9.985758e-04 ];
Tc_error_18  = [ 4.041146e-01 ; 3.842938e-01 ; 3.012579e-01 ];

%-- Image #19:
omc_19 = [ -1.925663e+00 ; -1.838145e+00 ; -1.440131e+00 ];
Tc_19  = [ -1.063890e+02 ; -7.947343e+01 ; 3.339378e+02 ];
omc_error_19 = [ 5.750617e-04 ; 9.891113e-04 ; 1.253103e-03 ];
Tc_error_19  = [ 3.181290e-01 ; 2.961375e-01 ; 2.710140e-01 ];

%-- Image #20:
omc_20 = [ 1.896074e+00 ; 1.593757e+00 ; 1.471766e+00 ];
Tc_20  = [ -1.436699e+02 ; -8.785600e+01 ; 3.961993e+02 ];
omc_error_20 = [ 1.022646e-03 ; 6.387666e-04 ; 1.145546e-03 ];
Tc_error_20  = [ 3.873835e-01 ; 3.530552e-01 ; 3.235669e-01 ];

%-- Image #21:
omc_21 = [ 1.930381e+00 ; 1.668043e+00 ; 1.441859e+00 ];
Tc_21  = [ -8.313029e+01 ; -8.472126e+01 ; 4.059934e+02 ];
omc_error_21 = [ 1.043152e-03 ; 6.479955e-04 ; 1.186681e-03 ];
Tc_error_21  = [ 3.815760e-01 ; 3.517545e-01 ; 3.136430e-01 ];

%-- Image #22:
omc_22 = [ 2.106389e+00 ; 1.698524e+00 ; 7.002912e-01 ];
Tc_22  = [ -2.008479e+02 ; -1.444181e+02 ; 5.424789e+02 ];
omc_error_22 = [ 8.973923e-04 ; 7.118515e-04 ; 1.429675e-03 ];
Tc_error_22  = [ 5.234255e-01 ; 4.728690e-01 ; 4.150227e-01 ];

%-- Image #23:
omc_23 = [ -1.363795e+00 ; -1.714573e+00 ; -1.439704e-01 ];
Tc_23  = [ -1.628657e+02 ; -1.918901e+02 ; 5.846429e+02 ];
omc_error_23 = [ 6.886298e-04 ; 8.242463e-04 ; 1.059711e-03 ];
Tc_error_23  = [ 5.363037e-01 ; 5.010893e-01 ; 3.596618e-01 ];

%-- Image #24:
omc_24 = [ -1.336964e+00 ; -1.780799e+00 ; 4.189430e-02 ];
Tc_24  = [ -1.004474e+02 ; -1.952732e+02 ; 5.879591e+02 ];
omc_error_24 = [ 6.641622e-04 ; 8.354283e-04 ; 1.082490e-03 ];
Tc_error_24  = [ 5.384569e-01 ; 4.976547e-01 ; 3.259871e-01 ];

%-- Image #25:
omc_25 = [ -1.198094e+00 ; -2.341591e+00 ; 7.720190e-01 ];
Tc_25  = [ -3.363327e+01 ; -2.644626e+02 ; 8.206665e+02 ];
omc_error_25 = [ 8.387443e-04 ; 8.990843e-04 ; 1.396962e-03 ];
Tc_error_25  = [ 7.563585e-01 ; 6.954218e-01 ; 4.019358e-01 ];

