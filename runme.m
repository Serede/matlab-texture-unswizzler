close all;
swizzled_dir = 'swizzled';
unswizzled_dir = 'unswizzled';
files = dir(fullfile(swizzled_dir, '*.bmp'));
for i = 1:length(files)
    fn = fullfile(swizzled_dir, files(i).name);
    [~, name, ext] = fileparts(fn);
    fprintf('Unswizzling file %s... ', strcat(name, ext));
    try
        img = imread(fn);
        out = unswizzle(img, 4, 0);
        imwrite(out, fullfile(unswizzled_dir, strcat(name, '_unswizzled.bmp')));
        fprintf('OK.\n');
    catch ME
        fprintf('ERROR!\n');
        fprintf('-> %s\n', ME.message);
    end
end
fprintf('Finished unswizzling files.\n');