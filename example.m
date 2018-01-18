% matlab-texture-unswizzler example

close all;

name = 'totoro'; % Input BMP filename without the extension
n    = 4;        % Block size
p    = 0;        % Swizzle parity (0=even, 1=odd)
                 % Try both parity settings until satisfied.

% Load and show image
img = imread(strcat(name, '.bmp'));
figure(1);
subplot(121);
imshow(img);
title('Swizzled');

% Unswizzle
out = unswizzle(img, n, p);

% Write unswizzled BMP (in this case 'totoro_unswizzled.bmp')
imwrite(out, strcat(name, '_unswizzled.bmp'));

% Also show result
subplot(122);
imshow(out);
title('Unswizzled');