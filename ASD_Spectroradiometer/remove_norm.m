function x = remove_norm(x)
        
        x = x./vecnorm(x,1);
end