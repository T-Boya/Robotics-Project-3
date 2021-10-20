%
% angleaxis.m
%
% calculates angle axis product
%

function [beta] = angleaxis(R)
    theta = asin(0.5*sqrt((3-trace(R))*(1+trace(R))));
    k = (1/sqrt((3-trace(R))*(1+trace(R))))*[R(3, 2) - R(2, 3); R(1, 3) - R(3, 2); R(2, 1) - R(1, 2)];
    beta = k * theta;
end