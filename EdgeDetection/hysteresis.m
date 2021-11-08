function J = hysteresis(I, weak, strong)
    [M, N] = size(I);
    J = I;
    changed = true;
    while changed
        changed = false;
        for i = 2:M-1
            for j = 2:N-1
                if J(i,j) == weak
                    if ((J(i+1, j-1) == strong) || (J(i+1, j) == strong) || (J(i+1, j+1) == strong) ...
                        || (J(i, j-1) == strong) || (J(i, j+1) == strong) ...
                        || (J(i-1, j-1) == strong) || (J(i-1, j) == strong) || (J(i-1, j+1) == strong))
                        J(i, j) = strong;
                        changed = true;
                    end
                end
            end
        end
    end
    
    for i = 2:M-1
        for j = 2:N-1
            if J(i,j) == weak
                J(i,j) = 0;
            end
        end
    end
end