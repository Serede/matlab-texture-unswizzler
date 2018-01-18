function [ v ] = serialize( T, n )
% SERIALIZE Serializes a 3-tensor into a cell-vector blockwise.
%
%    T: input 3-tensor
%    n: block size
%
%    v: output cell-vector

height = size(T, 1);
width  = size(T, 2);
h = height/n;
w = width/n;
v = cell(h*w, 1);
for y = 0:h-1
    for x = 0:w-1
        v{bi2de([de2bi(x,log2(h)),de2bi(y,log2(w))]) + 1} = T((n*y)+1:(n*y)+n, (n*x)+1:(n*x)+n, :);
    end
end

end

