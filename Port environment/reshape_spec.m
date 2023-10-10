function [data,a,b] = reshape_spec(data)

[a,b,c] = size(data);
data = reshape(data,[a*b,c])';

end