function XY = comp_distortion_oulu(xd,k)

%comp_distortion_oulu.m
%
%[x] = comp_distortion_oulu(xd,k)
%
%Compensates for radial and tangential distortion. Model From Oulu university.
%For more informatino about the distortion model, check the forward projection mapping function:
%project_points.m
%
%INPUT: xd: distorted (normalized) point coordinates in the image plane (2xN matrix)
%       k: Distortion coefficients (radial and tangential) (4x1 vector)
%
%OUTPUT: x: undistorted (normalized) point coordinates in the image plane (2xN matrix)
%
%Method: Iterative method for compensation.
%
%NOTE: This compensation has to be done after the subtraction
%      of the principal point, and division by the focal length.


if length(k) == 1
    
    XY = comp_distortion(xd,k);
    
else
    
    k1 = k(1);
    k2 = k(2);
    k3 = k(5);
    p1 = k(3);
    p2 = k(4);
    
%     x = xd; 				% Initial guess.  Size of array is presently 1029 x 2.
    XY = xd;
    
    for kk=1:20
        x = XY(:,1); % Created x,y simply to match equations in documentation; to ease understanding of the code.
        y = XY(:,2);
        
%         r_2 = sum(x.^2);
        r_2 = x.^2 + y.^2;
        k_radial =  1 + k1 * r_2 + k2 * r_2.^2 + k3 * r_2.^3;
%         delta_x = [2*p1*x(1,:).*x(2,:) + p2*(r_2 + 2*x(1,:).^2);
%                    p1*(r_2 + 2*x(2,:).^2) + 2*p2*x(1,:).*x(2,:)]; % These operate on only a couple rows of 'x'.
        delta_1 = 2*p1*x.*y + p2*(r_2 + 2*x.^2);
        delta_2 = p1*(r_2 + 2*y.^2) + 2*p2*x.*y;
        delta_x = [delta_1 delta_2];
%         delta_x = [2*p1*x(:,1).*x(:,2) + p2*(r_2 + 2*x(:,1).^2); % On account of array-size mismatch errors, try to operate on the columns.
%                    p1*(r_2 + 2*x(:,2).^2) + 2*p2*x(:,1).*x(:,2)];
        XY = (xd - delta_x)./k_radial;
%         x = (xd - delta_x)./(ones(2,1)*k_radial);
            
    end
    
end
    
    