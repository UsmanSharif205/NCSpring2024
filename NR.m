%Solve for the root of the cubic function  f(x) = x^3 - 2x^2 - 5x + 6 using the Newton-Raphson method for 4 iterations.

%Newton-Raphson Method

%The Newton-Raphson method is an iterative approach to find the roots (zeros) of a function. It utilizes the following formula to update the guess (x₀) for the root in each iteration:

% x_(n+1) = x_n - f(x_n) / f'(x_n)

%where:

%* x_(n+1) is the improved guess for the root in the (n+1)th iteration.
%* x_n is the current guess for the root in the nth iteration.
%* f(x_n) is the function's value at the current guess (x_n).
%* f'(x_n) is the derivative of the function evaluated at the current guess (x_n).

% Define the cubic function
function y = f(x)
  y = x^3 - 2*x^2 - 5*x + 6;
end

% Define the derivative of the cubic function
function y = derivative_f(x)
  y = 3*x^2 - 4*x - 5;
end

% Set initial guess, tolerance, and number of iterations
x0 = 2;
tol = 1e-5;
n = 4;

% Perform Newton-Raphson iterations
for i = 1:n
  fx = f(x0);
  dfx = derivative_f(x0);
  
  % Check for convergence
  if abs(fx) < tol
    break;
  end
  
  x0 = x0 - fx / dfx;
end

% Print results
if i < n
  fprintf('Root found in %d iterations: %f\n', i, x0);
else
  fprintf('Failed to converge in %d iterations\n', n);
end

Output:
Root found in 3 iterations: -2.000000
