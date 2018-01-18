function [ img ] = deserialize( I, s )
h = sqrt(size(I, 1));
w = sqrt(size(I, 1));
height = h*s;
width  = w*s;
img = uint8(zeros(height, width, 3));
for y = 0:h-1
    for x = 0:w-1
        img((s*y)+1:(s*y)+s, (s*x)+1:(s*x)+s, :) = I{bi2de([de2bi(x,log2(h)),de2bi(y,log2(w))]) + 1};
    end
end

end

