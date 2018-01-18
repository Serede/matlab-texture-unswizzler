function [ T ] = deserialize( v )
% DESERIALIZE Deserializes a cell-vector into a 3-tensor blockwise.
%
%    v: input cell-vector
%
%    T: output 3-tensor

h = sqrt(size(v, 1));
w = sqrt(size(v, 1));
n = size(v{1}, 1);
depth = size(v{1}, 3);
height = h*n;
width  = w*n;
T = uint8(zeros(height, width, depth));
for y = 0:h-1
    for x = 0:w-1
        T((n*y)+1:(n*y)+n, (n*x)+1:(n*x)+n, :) = v{bi2de([de2bi(x,log2(h)),de2bi(y,log2(w))]) + 1};
    end
end

end

