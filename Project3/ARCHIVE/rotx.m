function [r] = rotx(q)
    r = [1 0 0; 0 cos(q) -sin(q); 0 sin(q) cos(q)];
end