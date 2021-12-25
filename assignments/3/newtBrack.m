function [ok, xnewt] = newtBrack(a, b, x, fx, fpx)
xnew = x - (fx/fpx);
if (xnew <= b && xnew >= a)
    ok = 1;
    xnewt = xnew;
else 
    xnewt = xnew;
    ok = 0;
 end
end