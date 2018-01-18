function [ U ] = unswizzle( I, n, p )
% UNSWIZZLE Unswizzles a squared RGB texture image.
%
%    I: input image
%    n: block size
%    p: swizzle parity (0=even, 1=odd)
%
%    U: output unswizzled image

if (p < 0) || (p > 1)
    error('Parity must be either 0 (even) or 1 (odd).');
end
height = size(I, 1);
width = size(I, 2);
if height ~= width
    error('Only squared images supported!');
end
length = log2(height/n)+log2(width/n);
bits = 1:length;
bitmap = [bits(2-p:2:end) bits(1+p:2:end)];
v = serialize(I, n);
F = cell(size(v));
for i = 0:size(v, 1)-1
    iv = de2bi(i, length);
    jv = zeros(size(iv));
    for j = 1:length
        jv(j) = iv(bitmap(j));
    end
    j = bi2de(jv);
    F{j+1} = v{i+1};
end
U = deserialize(F);
end

