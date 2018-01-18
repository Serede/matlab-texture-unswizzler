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
h = size(I, 1);
w = size(I, 2);
if h < w
    error('Horizontal images are not yet implemented.');
end
if mod(h, w) ~= 0
    error('Image dimensions cannot be coprime: %dx%d', w, h);
end
nblk = h/w;
U = uint8(zeros(size(I)));
for k = 0:nblk-1
    L = 2*log2(w/n);
    bits = 1:L;
    bitmap = [bits(2-p:2:end) bits(1+p:2:end)];
    v = serialize(I(k*w+1:(k+1)*w,:,:), n);
    F = cell(size(v));
    for i = 0:size(v, 1)-1
        iv = de2bi(i, L);
        jv = iv(bitmap);
        j = bi2de(jv);
        F{j+1} = v{i+1};
    end
    U(k*w+1:(k+1)*w,:,:) = deserialize(F);
end

end
