% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 657.395533244027660 ; 657.763354105897410 ];

%-- Principal point:
cc = [ 302.982165186368150 ; 242.617826054137170 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.255839278890099 ; 0.127576291849909 ; -0.000208190479883 ; 0.000033307713496 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 0.346917406854085 ; 0.371118503427182 ];

%-- Principal point uncertainty:
cc_error = [ 0.705475828839154 ; 0.645538016549508 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.002706730070907 ; 0.010758370512621 ; 0.000145791364824 ; 0.000144009936394 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 20;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.654780e+00 ; 1.651921e+00 ; -6.699942e-01 ];
Tc_1  = [ -1.775753e+02 ; -8.374276e+01 ; 8.529836e+02 ];
omc_error_1 = [ 8.237625e-04 ; 1.064578e-03 ; 1.360721e-03 ];
Tc_error_1  = [ 9.161187e-01 ; 8.447833e-01 ; 4.641471e-01 ];

%-- Image #2:
omc_2 = [ 1.849013e+00 ; 1.900563e+00 ; -3.971224e-01 ];
Tc_2  = [ -1.549627e+02 ; -1.593563e+02 ; 7.576053e+02 ];
omc_error_2 = [ 8.655189e-04 ; 1.057855e-03 ; 1.645383e-03 ];
Tc_error_2  = [ 8.180114e-01 ; 7.488668e-01 ; 4.562526e-01 ];

%-- Image #3:
omc_3 = [ 1.742393e+00 ; 2.077565e+00 ; -5.052457e-01 ];
Tc_3  = [ -1.252407e+02 ; -1.746294e+02 ; 7.754807e+02 ];
omc_error_3 = [ 7.921196e-04 ; 1.120886e-03 ; 1.700951e-03 ];
Tc_error_3  = [ 8.361887e-01 ; 7.663390e-01 ; 4.385899e-01 ];

%-- Image #4:
omc_4 = [ 1.827859e+00 ; 2.116779e+00 ; -1.103193e+00 ];
Tc_4  = [ -6.443160e+01 ; -1.548720e+02 ; 7.791043e+02 ];
omc_error_4 = [ 7.109956e-04 ; 1.161261e-03 ; 1.592745e-03 ];
Tc_error_4  = [ 8.427462e-01 ; 7.649064e-01 ; 3.533199e-01 ];

%-- Image #5:
omc_5 = [ 1.079054e+00 ; 1.922503e+00 ; -2.527479e-01 ];
Tc_5  = [ -9.224464e+01 ; -2.291571e+02 ; 7.366549e+02 ];
omc_error_5 = [ 6.944944e-04 ; 1.082875e-03 ; 1.219299e-03 ];
Tc_error_5  = [ 8.027281e-01 ; 7.298548e-01 ; 4.319094e-01 ];

%-- Image #6:
omc_6 = [ -1.701811e+00 ; -1.929288e+00 ; -7.914698e-01 ];
Tc_6  = [ -1.489013e+02 ; -7.964876e+01 ; 4.449787e+02 ];
omc_error_6 = [ 6.674898e-04 ; 1.081034e-03 ; 1.464384e-03 ];
Tc_error_6  = [ 4.810622e-01 ; 4.512431e-01 ; 3.694930e-01 ];

%-- Image #7:
omc_7 = [ 1.996752e+00 ; 1.931472e+00 ; 1.310636e+00 ];
Tc_7  = [ -8.293129e+01 ; -7.773630e+01 ; 4.401758e+02 ];
omc_error_7 = [ 1.278384e-03 ; 6.564051e-04 ; 1.535937e-03 ];
Tc_error_7  = [ 4.833052e-01 ; 4.409835e-01 ; 3.901160e-01 ];

%-- Image #8:
omc_8 = [ 1.961461e+00 ; 1.824261e+00 ; 1.326199e+00 ];
Tc_8  = [ -1.701109e+02 ; -1.035615e+02 ; 4.620733e+02 ];
omc_error_8 = [ 1.220058e-03 ; 6.695432e-04 ; 1.473052e-03 ];
Tc_error_8  = [ 5.284054e-01 ; 4.791017e-01 ; 4.394819e-01 ];

%-- Image #9:
omc_9 = [ -1.363691e+00 ; -1.980539e+00 ; 3.210347e-01 ];
Tc_9  = [ -1.877098e+00 ; -2.251604e+02 ; 7.286473e+02 ];
omc_error_9 = [ 8.318370e-04 ; 1.068307e-03 ; 1.376531e-03 ];
Tc_error_9  = [ 7.920096e-01 ; 7.188280e-01 ; 4.491916e-01 ];

%-- Image #10:
omc_10 = [ -1.513263e+00 ; -2.086816e+00 ; 1.882445e-01 ];
Tc_10  = [ -2.960584e+01 ; -3.004329e+02 ; 8.601618e+02 ];
omc_error_10 = [ 1.014574e-03 ; 1.214653e-03 ; 1.830525e-03 ];
Tc_error_10  = [ 9.518012e-01 ; 8.544880e-01 ; 5.961866e-01 ];

%-- Image #11:
omc_11 = [ -1.793083e+00 ; -2.064814e+00 ; -4.799217e-01 ];
Tc_11  = [ -1.510520e+02 ; -2.353654e+02 ; 7.047466e+02 ];
omc_error_11 = [ 9.101378e-04 ; 1.146161e-03 ; 1.970048e-03 ];
Tc_error_11  = [ 7.802822e-01 ; 7.317511e-01 ; 5.897904e-01 ];

%-- Image #12:
omc_12 = [ -1.839112e+00 ; -2.087342e+00 ; -5.155426e-01 ];
Tc_12  = [ -1.334788e+02 ; -1.772312e+02 ; 6.049751e+02 ];
omc_error_12 = [ 7.758775e-04 ; 1.101403e-03 ; 1.817477e-03 ];
Tc_error_12  = [ 6.645928e-01 ; 6.187402e-01 ; 4.931297e-01 ];

%-- Image #13:
omc_13 = [ -1.919017e+00 ; -2.116533e+00 ; -5.941702e-01 ];
Tc_13  = [ -1.326905e+02 ; -1.435613e+02 ; 5.448016e+02 ];
omc_error_13 = [ 7.237419e-04 ; 1.090156e-03 ; 1.786837e-03 ];
Tc_error_13  = [ 5.967665e-01 ; 5.538457e-01 ; 4.475490e-01 ];

%-- Image #14:
omc_14 = [ -1.954382e+00 ; -2.124574e+00 ; -5.844155e-01 ];
Tc_14  = [ -1.235962e+02 ; -1.371440e+02 ; 4.909031e+02 ];
omc_error_14 = [ 6.811653e-04 ; 1.068411e-03 ; 1.749286e-03 ];
Tc_error_14  = [ 5.385083e-01 ; 4.985683e-01 ; 4.016709e-01 ];

%-- Image #15:
omc_15 = [ -2.110763e+00 ; -2.253832e+00 ; -4.948447e-01 ];
Tc_15  = [ -1.991393e+02 ; -1.345106e+02 ; 4.750405e+02 ];
omc_error_15 = [ 7.861988e-04 ; 1.000621e-03 ; 1.906529e-03 ];
Tc_error_15  = [ 5.281506e-01 ; 4.944671e-01 ; 4.329082e-01 ];

%-- Image #16:
omc_16 = [ 1.886910e+00 ; 2.336196e+00 ; -1.735763e-01 ];
Tc_16  = [ -1.593266e+01 ; -1.703355e+02 ; 6.955667e+02 ];
omc_error_16 = [ 1.080886e-03 ; 1.141795e-03 ; 2.373529e-03 ];
Tc_error_16  = [ 7.512814e-01 ; 6.820996e-01 ; 5.126819e-01 ];

%-- Image #17:
omc_17 = [ -1.612907e+00 ; -1.953392e+00 ; -3.473551e-01 ];
Tc_17  = [ -1.352316e+02 ; -1.389572e+02 ; 4.901886e+02 ];
omc_error_17 = [ 6.730203e-04 ; 1.029449e-03 ; 1.450996e-03 ];
Tc_error_17  = [ 5.315932e-01 ; 4.945661e-01 ; 3.560080e-01 ];

%-- Image #18:
omc_18 = [ -1.341749e+00 ; -1.692556e+00 ; -2.970119e-01 ];
Tc_18  = [ -1.853682e+02 ; -1.578009e+02 ; 4.412936e+02 ];
omc_error_18 = [ 7.724114e-04 ; 1.000099e-03 ; 1.145522e-03 ];
Tc_error_18  = [ 4.833004e-01 ; 4.508150e-01 ; 3.458205e-01 ];

%-- Image #19:
omc_19 = [ -1.925984e+00 ; -1.837923e+00 ; -1.440321e+00 ];
Tc_19  = [ -1.065649e+02 ; -7.957263e+01 ; 3.341596e+02 ];
omc_error_19 = [ 6.643834e-04 ; 1.171568e-03 ; 1.484644e-03 ];
Tc_error_19  = [ 3.750302e-01 ; 3.440457e-01 ; 3.243378e-01 ];

%-- Image #20:
omc_20 = [ 1.896150e+00 ; 1.593138e+00 ; 1.471913e+00 ];
Tc_20  = [ -1.438333e+02 ; -8.803710e+01 ; 3.961775e+02 ];
omc_error_20 = [ 1.237552e-03 ; 6.846430e-04 ; 1.334013e-03 ];
Tc_error_20  = [ 4.577491e-01 ; 4.100573e-01 ; 3.923714e-01 ];

