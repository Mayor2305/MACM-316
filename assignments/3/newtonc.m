
function [root, iter, xlist] = newtonc( func, pfunc, xguess, tol )
if nargin < 3
  fprintf(1, 'NEWTON: must be called with at least three arguments' );
  error( 'Usage:  [root, niter, xlist] = newton( func, pfunc, xguess, [tol] )' );
end
if nargin < 4, tol  = 1e-6; end
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
xlist= [ x ];
done = 0;
iter = 0;
while( ~done )
  x0  = x;
  x   = x0 - fx / fpx;
  fx  = feval( func,  x );
  fpx = feval( pfunc, x );
  if( abs(x-x0) < tol )     % absolute tolerance on x
    done = 1;
  else
    xlist = [ xlist; x ];   % add to the list of x-values 
    iter  = iter + 1;
  end
end
root = x;