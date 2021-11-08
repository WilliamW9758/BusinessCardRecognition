function [G, theta] = sobel(I)
% SOBEL applies sobel gradient filter

    % calculate gradient
    Kx = [[-1 0 1];
          [-2 0 2];
          [-1 0 1]];
    Ky = [[ 1  2  1];
          [ 0  0  0];
          [-1 -2 -1]];
    % calculate mag G and slope theta
    Ix = cov(I, Kx);
    Iy = cov(I, Ky);
    
    G = sqrt(Ix.^2+Iy.^2);
    G = G / max(G(:)) * 255;
    theta = atan(Iy./Ix);
end