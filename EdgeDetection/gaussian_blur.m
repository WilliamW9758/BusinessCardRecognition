function H = gaussian_blur(k, sd)
% GAUSSIAN_BLUR generate Gaussian blur filter
% k - size parameter, filter has side 2k+1
% sd - standard deviation of Gaussian Dist.

    H = zeros([2*k+1 2*k+1]);
    % Construct Gaussian blur filter
    for i = 1:(2*k+1)
        for j = 1:(2*k+1)
            H(i,j) = 1/(2*pi*sd^2)*exp(-((i-(k+1))^2+(j-(k+1))^2)/(2*sd^2));
        end
    end
    H = H./sum(H(:));
end