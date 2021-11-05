function J = nonMaxSup(I, D)
    [M, N, ~] = size(I);
    J = zeros(size(I));
    angle = D * 180 ./ pi;
    B = angle < 0;
    angle = angle + 180 * B;
    
    for i = 2:M-1
        for j = 2:N-1
            q = 255;
            r = 255;
            
            % angle 0
            if ((0 <= angle(i,j)) && (angle(i,j) < 22.5)) || ...
                ((157.5 <= angle(i,j)) && (angle(i,j) <= 180))
                q = I(i, j+1);
                r = I(i, j-1);
            elseif ((22.5 <= angle(i,j)) && (angle(i,j) < 67.5))
                q = I(i+1, j-1);
                r = I(i-1, j+1);
            elseif ((67.5 <= angle(i,j)) && (angle(i,j) < 112.5))
                q = I(i+1, j);
                r = I(i-1, j);
            else
                q = I(i-1, j-1);
                r = I(i+1, j+1);
            end
            
            if (I(i,j) >= q) && (I(i,j) >= r)
                J(i,j) = I(i,j);
            else
                J(i,j) = 0;
            end
        end
    end
end