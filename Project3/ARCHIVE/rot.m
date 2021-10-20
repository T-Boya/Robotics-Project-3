function r = rot(k, theta)
    k = k/norm(k); 
    r = eye(3, 3) + sin(theta)*hat(k)+(1-cos(theta))*hat(k)*hat(k);
end