I = imread('StanfordEE.jpg');
% I = imread('packetvideo.jpg');
% I = imread('RafealUlate.jpg');
% I = imread('MarkDMalvin.jpg');
% I = imread('CambridgeLogic.jpg');
% I = imread('acedaytons.jpg');

figure; image(I); truesize;
title('Original');

IG = rgb2gray(I);
J = canny(IG, false);
figure; image(J); truesize;
colormap(gray(256));

% Closing doesn't quite help in this case
% h = ones([6 6]);
% J = imdilate(J, h);
% J = imerode(J, h);
% figure; image(J); truesize;
% colormap(gray(256));
% title('Closing'); 