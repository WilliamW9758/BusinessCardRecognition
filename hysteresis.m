function J = hysteresis(I, weak, strong)
    [M, N] = size(I);
    J = zeros(size(I));
    for i = 2:M-1
        for j = 2:N-1
            if I(i,j) == weak
                if ((I(i+1, j-1) == strong) || (I(i+1, j) == strong) || (I(i+1, j+1) == strong) ...
                    || (I(i, j-1) == strong) || (I(i, j+1) == strong) ...
                    || (I(i-1, j-1) == strong) || (I(i-1, j) == strong) || (I(i-1, j+1) == strong))
                    J(i, j) = strong;
                else
                    J(i, j) = 0;
                end
            elseif I(i,j) == strong
                J(i,j) = strong;
            end
        end
    end