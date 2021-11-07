function generateLetterData(func, caps, nums, isize, dir, N, disp)
    if disp
        figure;
    end
    for n = 1:N
        I = zeros(isize);
        Set = 'abcdefghijklmnopqrstuvwxyz';
        if (caps)
            Set = append(Set, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ');
        end
        if (nums)
            Set = append(Set, '0987654321');
        end

        fonts = {'Arial', 'Arial Black', 'Arial Bold', ...
                'Calibri', 'Calibri Light', 'Calibri Bold', ...
                'Times New Roman', 'Times New Roman Bold'};
        letterIdx = ceil(rand()*strlength(Set));

        size = uint8(rand()*60+50);
        loc = uint8([rand()*(isize-size)+size rand()*(isize-size)+size]);
        ret = insertText(I,loc,Set(letterIdx), ...
            'AnchorPoint','RightBottom', 'Font', fonts{ceil(rand()*length(fonts))}, ...
            'FontSize',size, 'BoxColor', 'black', 'TextColor', 'White');
        ret = rgb2gray(ret);

        angle = rand()*60-30;
        ret = imrotate(ret, angle, 'nearest', 'crop');

        ret = imnoise(ret, 'gaussian', 0.56);

        ret = func(ret, false);
        if disp
            image(ret); truesize;
            colormap(gray(256));
        end

        imwrite(ret, gray(256), append(dir, int2str(n), '_', Set(letterIdx),'.jpg'));
    end
end