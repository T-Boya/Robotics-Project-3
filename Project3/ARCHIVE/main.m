%% Question 1
load('S_sphere_path.mat');
N = 101;
Sx = p_S(1,:); Sy = p_S(2,:); Sz = p_S(3,:);
ex = [1 0 0]; ey = [0 1 0]; ez = [0 0 1];
scatter3(Sx, Sy, Sz);
for i=1:101
    % find pose
end
% represent robot pose

% represent curve orientation
quats = zeros(1, 101); % create quaternion array
for i = 1:101
    theta = ;
    quats(i) = [cos(theta/2); (sin(theta/2))*k ]; % populate quaternion array % consider matlab quaternion class
end

%% Question 2a
% SDH
%SDH

% set up SDH parameters
d = [];
a = [];
alpha = [];
theta = [];
T = []
for i = a:b
    
end
% rest



elbow1.d=[l0;0;0;0;0;l3];
elbow1.a=[0;l1;l2;0;0;0];
elbow1.alpha=sym([-pi/2;0;0;pi/2;pi/2;0]);
elbow1.theta=[q1;q2;q3;q4;q5+pi/2;q6];
% calculate T_{06}
elbow1=fwdkinsdh(elbow1);
% additional transformation to match with POE end effector frame
T6T=[[[0 1 0 ; 0 0 1; 1 0 0] zeros(3,1)];[zeros(1,3) 1]];
% This should match with POE's T_{0T}
T0T_SDH=simplify(elbow1.T*T6T);

disp('T_{0T} from SDH method');
disp(T0T_SDH);


%% Question 2b
l = [399, 448, 42, 451, 82]; % define link lengths
% POE
q = [[0 0 0], [0 0 0], [0 0 0], [0 0 0]];
%  H IS WRONG BECAUSE IT HAS SO MANY DEGREES OF FREEDOM, SEE MANUAL
h = [[0 1 0], [0 1 0], [1 0 0], [0 1 0]]; % skipped first [001] for 0 -> L1 as that is origin
R = zeros(1, 5); % create exponentials array
for i = 1:5
    R(i) = exp( hat(h(i)) * q(i) ); % populate exponentials array
end
R = prod(R); % find product of exponentials

% SDH
