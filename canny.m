function J = canny(I,disp)
% CANNY performs canny edge detection on image I

    % init output image
    J = zeros(size(I));
    
    % construct gaussian blur filter
    g = gaussian_blur(5,1.5);
    % cov blur with J
    J = cov(I, g);
    %J = linScale(J);
    
    if (disp)
        figure; image(J); truesize;
        colormap(gray(256));
        title('Image after Gaussian Blur');
    end
    
    % apply sobel filter to get gradient intensity and edge direction
    [J, theta] = sobel(J);
    %J = linScale(J);
    
    if (disp)
        figure; image(J); truesize;
        colormap(gray(256));
        title('Image after Sobel Filter');
    end
    
    % apply non maximum suppression
    J = nonMaxSup(J, theta);
    
    if (disp)
        figure; image(J); truesize;
        colormap(gray(256));
        title('Image after Non-Maximum Suppression');
    end
    
    % perform double threshold
    J = dblThreshold(J, 0.6, 0.25, 25, 255);
    
    if (disp)
        figure; image(J); truesize;
        colormap(gray(256));
        title('Image after Double Threshold');
    end
    
    % perform hysteresis
    J = hysteresis(J, 25, 255);
    
    if (disp)
        figure; image(J); truesize;
        colormap(gray(256));
        title('Image after Hysteresis');
    end
end