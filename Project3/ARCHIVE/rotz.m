function [r] = rotz(q)
    r = [cos(q) -sin(q) 0; sin(q) cos(q) 0; 0 0 1];
end