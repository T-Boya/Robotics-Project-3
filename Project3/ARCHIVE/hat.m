function [h] = hat(k)
    h = [0 -k(3) k(2); k(3) 0 -k(1); -k(2) k(1) 0];
end