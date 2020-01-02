function [X,T] = one_cos(A,w,phi,dur)
        %Using the duration and sample size a relation can be made to find
        %the sample times.  These values are then put into a cosine
        %function with the other inputs.  This gives us our time values and
        %x values.
        T = (1:1:20).*(dur/20); 
        X = A.*cos(w.*T+phi);
        
end
