function [lower_bound, upper_bound] = confintervals(x, alpha) 
% confintervals - calculate confidence interval with the given alpha on for
%                 the given data set
%
% INPUT:
% x <- data set for which the confidence interval is calcluated.
% alpha <- for instance, if alpha = 0.05 then the function finds 95% 
%          confidence interval
%
% OUTPUT:
% [lower_bound, upper_bound] <- the confidence interval
%
    [m, n]= size(x);
    avg = mean(x);
    S = 0;
    i = 1;
    while i < n+1
        S = S + (x(i)-avg)^2;
        i = i + 1;
    end
    
    a = alpha;
    per = 1 - a/2;
    dof = n - 1;
  
    lower_bound = avg - tinv(per, dof).*(S./(n-1));
    upper_bound = avg + tinv(per, dof).*(S./(n-1));
    
end