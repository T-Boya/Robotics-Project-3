function robot = invkin(robot)
    ex = [1; 0; 0];ey = [0; 1; 0];ez = [0; 0; 1];zv = [0; 0; 0];
    p01 = robot.P(:,1);p12 = robot.P(:,2);p23 = robot.P(:,3);p34 = robot.P(:,4);p45 = robot.P(:,5);p56 = robot.P(:,6);p6T = robot.P(:,7);
    h1 = robot.H(:,1);h2 = robot.H(:,2);h3 = robot.H(:,3);h4 = robot.H(:,4);h5 = robot.H(:,5);h6 = robot.H(:,6);
    R = robot.T(1:3,1:3);
    p = robot.T(1:3,4);
    q3 = subprob3(h3, -p34, p23, norm(p - p01 - R * p6T));
    for i = 1:2
        [q1(:,i), q2(:,i)] =...
            subprob2(-h1, h2, p - p01 - R * p6T, p23 + rot(h3, q3(i)) * p34);
    end
    q = zeros(6, 8);
    q(1:3,1:4) = [q1(:,1)' q1(:,2)'; q2(:,1)' ...
        q2(:,2)'; q3(1) q3(1) q3(2) q3(2)];
    q(1:3, 5:8) = q(1:3, 1:4);
    for i = 1:4
        R03 = rot(h1, q(1, i)) * ...
            rot(h2, q(2, i)) * rot(h3, q(3, i));
        [q4, q5] = subprob2(-h4, h5, R03' * R * h6, h6);
        q51 = q5(1); q52 = q5(2);
        q41 = q4(1); q42 = q4(2);
        q(4:5, i+4) = [q42; q52];
        q(4:5, i) = [q41; q51];
        R05a = R03 * rot(h4, q41) * rot(h5, q51);
        R05b = R03 * rot(h4, q42) * rot(h5, q52);
        q(6, i) = subprob1(h6, h5, R05a' * R * h5);
        q(6, i + 4) = subprob1(h6, h5, R05b' * R * h5);
    end
    robot.q = q;
end