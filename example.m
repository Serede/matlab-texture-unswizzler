close all;

name = 'example'; % Input BMP filename without the extension
n    = 4;         % Block size
p    = 0;         % Swizzle parity (0=even, 1=odd)
                  % Try both parity settings until satisfied.

img = imread(strcat(name, '.BMP'));
out = unswizzle(img, 4);

% Write unswizzled BMP (in this case 'example_unswizzled.bmp')
imwrite(out, strcat(name, '_unswizzled.bmp'));

% Also show result
imshow(out);