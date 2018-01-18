function [ out ] = unswizzle( img, s )
height = size(img, 1);
width = size(img, 2);
if height ~= width
    error('Only squared images supported!');
end
length = log2(height/s)+log2(width/s);
bits = 1:length;
bitmap = containers.Map(bits, [bits(2:2:end) bits(1:2:end)]);
I = serialize(img, s);
F = cell(size(I));
for i = 0:size(I, 1)-1
    iv = de2bi(i, length);
    jv = zeros(size(iv));
    for j = 1:length
        jv(j) = iv(bitmap(j));
    end
    j = bi2de(jv);
    F{j+1} = I{i+1};
end
out = deserialize(F, s);
end

