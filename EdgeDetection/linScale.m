function J = linScale(I)
    m = min(I(:));
    M = max(I(:));
    J = uint8((I - m)/(M - m)*255);
end