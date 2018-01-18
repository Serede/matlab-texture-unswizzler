function [ I ] = serialize( img, s )
height = size(img, 1);
width  = size(img, 2);
h = height/s;
w = width/s;
I = cell(h*w,1);
for y = 0:h-1
    for x = 0:w-1
        I{bi2de([de2bi(x,log2(h)),de2bi(y,log2(w))]) + 1} = img((s*y)+1:(s*y)+s, (s*x)+1:(s*x)+s, :);
    end
end

end

