%
% uler.m
%
% calculates euler numbers
%

function [theta, psi, phi] = uler(R)
    theta = -asin(R(3, 1));
    psi = atan2(R(3, 2), R(3, 3));
    phi = atan2(R(2, 1), R(1, 1));
end