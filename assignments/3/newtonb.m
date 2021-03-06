function [root, iter, xlist] = newtonb( func, pfunc, xguess, tol )
if nargin < 3
  fprintf(1, 'NEWTON: must be called with at least three arguments' );
  error( 'Usage:  [root, niter, xlist] = newton( func, pfunc, xguess, [tol] )' );
end
if nargin < 4, tol  = 1e-10; end
func = fcnchk( func );
pfunc= fcnchk( pfunc );
root =(xguess(2) + xguess(1)) / 2;
froot = feval ( func, root);
x    = root;
fx   = feval( func,  x );
fpx  = feval( pfunc, x );
if( fx == 0 | fpx == 0 ) 
  error( 'NEWTON: both f and f'' must be non-zero at the initial guess' );
end
xlist = [ x ]
done = 0;
iter = 0;
while( ~done )
  [ok, x] = newtBrack(xguess(1), xguess(2), root, fx, fpx);
  if (ok == 0)
    fprintf('the root falls outside the bracket, therefore taking bisection step \n');
    froot = feval (func, root);
    if(( froot * feval(func, xguess(1))) < 0)
        xguess(2) = root;
    else
        xguess(1) = root;
    end
    xlist = [ xlist; root ];%%
    root =(xguess(2) + xguess(1)) / 2;
    fx  = feval( func,  root );
    fpx = feval( pfunc, root );
    if (abs(froot) < tol ||abs(xguess(1)-xguess(2)) < 2*tol)
        done = 1;
    end      
  else
    fx  = feval( func,  x );
    fpx = feval( pfunc, x );
    if( abs(x-root) < tol )     % absolute tolerance on x
        done = 1;
    else
        xlist = [ xlist; x ];   % add to the list of x-values 
        iter  = iter + 1;
    end
    root = x;
  end  
end
fprintf('\n');
fprintf('%f \n ', xlist);fprintf('\niterations: %f\n', iter);
