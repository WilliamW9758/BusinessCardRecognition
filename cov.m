function J = cov(I,h)
% COV performs convolution
% with image I and filter h
% Done through fourier transformation

    % Get RCB and NM dimensions
    [R,C,B] = size(I);
    [M,N,~] = size(h);
    % Make sure h is normalized
    s = sum(h(:));
    if s == 0
        s = 1;
    end
    h = h/s;
    % Zero-pad the filter
    H = zeros(size(I));
    for i = 1:B
        H(floor(R/2+1)-floor(M/2):floor(R/2+1)+floor((M-1)/2), ...
            floor(C/2+1)-floor(N/2):floor(C/2+1)+floor((N-1)/2), i) = h;
    end
    % Since we put the filter at the center, we need to move it to the
    % corner since fft2 will perform the shift again.
    H = ifftshift(H);
    FI = fft2(I);
    FH = fft2(H);
    % Convolution is multiplication in frequency domain
    FJ = FI.*FH;
    % Save the real part to eliminate noise
    J = real(ifft2(FJ));
end