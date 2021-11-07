function [res, weak, strong] = dblThreshold(I, lowRatio, highRatio, weak, strong)
    highThreshold = max(I(:)) * highRatio;
    lowThreshold = highThreshold * lowRatio;
    
    [M, N] = size(I);
    res = zeros([M N]);
    
    strongMtx = I >= highThreshold;
    zeroMtx = I < lowThreshold;
    
    weakMtx = (I < highThreshold) & (I >= lowThreshold);
    
    res = res + (strongMtx * strong);
    res = res + (weakMtx * weak);
end