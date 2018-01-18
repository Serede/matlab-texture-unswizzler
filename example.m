close all;
name = 'input_bmp_filename_without_extension';
img = imread(strcat(name, '.BMP'));
out = unswizzle(img, 4);
imwrite(out, strcat(name, '_unswizzled.bmp'));
imshow(out);