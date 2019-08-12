% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 657.463002177947600 ; 657.946839618882450 ];

%-- Principal point:
cc = [ 303.136519653506920 ; 242.569467012329820 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.254025829808369 ; 0.121434603213557 ; -0.000208641629717 ; 0.000019408838144 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 0.318187639021381 ; 0.340462062744131 ];

%-- Principal point uncertainty:
cc_error = [ 0.646818868094555 ; 0.592182243841415 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.002482730963616 ; 0.009863652692162 ; 0.000133840557008 ; 0.000132174441583 ; 0.000000000000000 ];

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
omc_1 = [ 1.654927e+00 ; 1.651990e+00 ; -6.694057e-01 ];
Tc_1  = [ -1.777721e+02 ; -8.387732e+01 ; 8.531471e+02 ];
omc_error_1 = [ 7.556257e-04 ; 9.761942e-04 ; 1.248192e-03 ];
Tc_error_1  = [ 8.399620e-01 ; 7.749001e-01 ; 4.258621e-01 ];

%-- Image #2:
omc_2 = [ 1.849122e+00 ; 1.900689e+00 ; -3.966400e-01 ];
Tc_2  = [ -1.551104e+02 ; -1.594756e+02 ; 7.576538e+02 ];
omc_error_2 = [ 7.937111e-04 ; 9.699406e-04 ; 1.509090e-03 ];
Tc_error_2  = [ 7.499133e-01 ; 6.867904e-01 ; 4.185262e-01 ];

%-- Image #3:
omc_3 = [ 1.742596e+00 ; 2.077769e+00 ; -5.049765e-01 ];
Tc_3  = [ -1.253216e+02 ; -1.747121e+02 ; 7.755770e+02 ];
omc_error_3 = [ 7.264950e-04 ; 1.027756e-03 ; 1.560219e-03 ];
Tc_error_3  = [ 7.666119e-01 ; 7.028432e-01 ; 4.023054e-01 ];

%-- Image #4:
omc_4 = [ 1.828127e+00 ; 2.116859e+00 ; -1.103003e+00 ];
Tc_4  = [ -6.453622e+01 ; -1.549585e+02 ; 7.791380e+02 ];
omc_error_4 = [ 6.521022e-04 ; 1.064803e-03 ; 1.460889e-03 ];
Tc_error_4  = [ 7.726195e-01 ; 7.014716e-01 ; 3.240754e-01 ];

%-- Image #5:
omc_5 = [ 1.079364e+00 ; 1.922483e+00 ; -2.531026e-01 ];
Tc_5  = [ -9.239862e+01 ; -2.290578e+02 ; 7.368644e+02 ];
omc_error_5 = [ 6.368594e-04 ; 9.927258e-04 ; 1.118385e-03 ];
Tc_error_5  = [ 7.360444e-01 ; 6.694870e-01 ; 3.960936e-01 ];

%-- Image #6:
omc_6 = [ -1.701347e+00 ; -1.929109e+00 ; -7.917736e-01 ];
Tc_6  = [ -1.489509e+02 ; -7.969982e+01 ; 4.447637e+02 ];
omc_error_6 = [ 6.120435e-04 ; 9.908973e-04 ; 1.342092e-03 ];
Tc_error_6  = [ 4.407936e-01 ; 4.136436e-01 ; 3.386536e-01 ];

%-- Image #7:
omc_7 = [ 1.996584e+00 ; 1.931515e+00 ; 1.311022e+00 ];
Tc_7  = [ -8.303021e+01 ; -7.776449e+01 ; 4.401635e+02 ];
omc_error_7 = [ 1.171876e-03 ; 6.020181e-04 ; 1.408368e-03 ];
Tc_error_7  = [ 4.430612e-01 ; 4.044110e-01 ; 3.577731e-01 ];

%-- Image #8:
omc_8 = [ 1.961144e+00 ; 1.824220e+00 ; 1.326777e+00 ];
Tc_8  = [ -1.701870e+02 ; -1.035782e+02 ; 4.620018e+02 ];
omc_error_8 = [ 1.118751e-03 ; 6.142431e-04 ; 1.350926e-03 ];
Tc_error_8  = [ 4.843074e-01 ; 4.393001e-01 ; 4.030031e-01 ];

%-- Image #9:
omc_9 = [ -1.363619e+00 ; -1.980445e+00 ; 3.210461e-01 ];
Tc_9  = [ -1.953593e+00 ; -2.251605e+02 ; 7.284426e+02 ];
omc_error_9 = [ 7.627042e-04 ; 9.794462e-04 ; 1.262191e-03 ];
Tc_error_9  = [ 7.258458e-01 ; 6.590027e-01 ; 4.118165e-01 ];

%-- Image #10:
omc_10 = [ -1.513021e+00 ; -2.086647e+00 ; 1.888886e-01 ];
Tc_10  = [ -2.964514e+01 ; -3.004829e+02 ; 8.600793e+02 ];
omc_error_10 = [ 9.303588e-04 ; 1.113503e-03 ; 1.677753e-03 ];
Tc_error_10  = [ 8.724424e-01 ; 7.834890e-01 ; 5.466093e-01 ];

%-- Image #11:
omc_11 = [ -1.793031e+00 ; -2.064966e+00 ; -4.800574e-01 ];
Tc_11  = [ -1.511240e+02 ; -2.354826e+02 ; 7.046450e+02 ];
omc_error_11 = [ 8.348829e-04 ; 1.051073e-03 ; 1.806831e-03 ];
Tc_error_11  = [ 7.152099e-01 ; 6.709837e-01 ; 5.408590e-01 ];

%-- Image #12:
omc_12 = [ -1.838801e+00 ; -2.087239e+00 ; -5.158068e-01 ];
Tc_12  = [ -1.335493e+02 ; -1.773139e+02 ; 6.048338e+02 ];
omc_error_12 = [ 7.113780e-04 ; 1.009610e-03 ; 1.665867e-03 ];
Tc_error_12  = [ 6.091233e-01 ; 5.673248e-01 ; 4.521079e-01 ];

%-- Image #13:
omc_13 = [ -1.918715e+00 ; -2.116505e+00 ; -5.945301e-01 ];
Tc_13  = [ -1.327532e+02 ; -1.436467e+02 ; 5.446944e+02 ];
omc_error_13 = [ 6.635576e-04 ; 9.992814e-04 ; 1.637756e-03 ];
Tc_error_13  = [ 5.469885e-01 ; 5.078447e-01 ; 4.103299e-01 ];

%-- Image #14:
omc_14 = [ -1.954108e+00 ; -2.124528e+00 ; -5.849552e-01 ];
Tc_14  = [ -1.236530e+02 ; -1.372115e+02 ; 4.907439e+02 ];
omc_error_14 = [ 6.245062e-04 ; 9.794624e-04 ; 1.603345e-03 ];
Tc_error_14  = [ 4.935237e-01 ; 4.570903e-01 ; 3.682263e-01 ];

%-- Image #15:
omc_15 = [ -2.110566e+00 ; -2.253735e+00 ; -4.956802e-01 ];
Tc_15  = [ -1.992010e+02 ; -1.345712e+02 ; 4.748874e+02 ];
omc_error_15 = [ 7.211985e-04 ; 9.179423e-04 ; 1.748449e-03 ];
Tc_error_15  = [ 4.839434e-01 ; 4.533420e-01 ; 3.970576e-01 ];

%-- Image #16:
omc_16 = [ 1.887030e+00 ; 2.336243e+00 ; -1.738237e-01 ];
Tc_16  = [ -1.600932e+01 ; -1.704000e+02 ; 6.956757e+02 ];
omc_error_16 = [ 9.919251e-04 ; 1.047976e-03 ; 2.180139e-03 ];
Tc_error_16  = [ 6.888357e-01 ; 6.256217e-01 ; 4.702812e-01 ];

%-- Image #17:
omc_17 = [ -1.612583e+00 ; -1.953293e+00 ; -3.477427e-01 ];
Tc_17  = [ -1.352754e+02 ; -1.389983e+02 ; 4.899672e+02 ];
omc_error_17 = [ 6.169650e-04 ; 9.435852e-04 ; 1.330102e-03 ];
Tc_error_17  = [ 4.870960e-01 ; 4.533511e-01 ; 3.263071e-01 ];

%-- Image #18:
omc_18 = [ -1.341592e+00 ; -1.692585e+00 ; -2.972891e-01 ];
Tc_18  = [ -1.854392e+02 ; -1.578336e+02 ; 4.410360e+02 ];
omc_error_18 = [ 7.083385e-04 ; 9.165507e-04 ; 1.050336e-03 ];
Tc_error_18  = [ 4.427998e-01 ; 4.132075e-01 ; 3.171099e-01 ];

%-- Image #19:
omc_19 = [ -1.925664e+00 ; -1.837985e+00 ; -1.440613e+00 ];
Tc_19  = [ -1.066230e+02 ; -7.960075e+01 ; 3.340900e+02 ];
omc_error_19 = [ 6.093737e-04 ; 1.074325e-03 ; 1.361182e-03 ];
Tc_error_19  = [ 3.437365e-01 ; 3.154373e-01 ; 2.973870e-01 ];

%-- Image #20:
omc_20 = [ 1.895970e+00 ; 1.593181e+00 ; 1.471967e+00 ];
Tc_20  = [ -1.439591e+02 ; -8.800888e+01 ; 3.963769e+02 ];
omc_error_20 = [ 1.134722e-03 ; 6.279993e-04 ; 1.223600e-03 ];
Tc_error_20  = [ 4.197899e-01 ; 3.762204e-01 ; 3.599790e-01 ];

