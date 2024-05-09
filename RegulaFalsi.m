%Using the Regula Falsi method for 4 iterations:

%matlab code
% Define the cubic function
function y = f(x)
  y = x^3 - 2*x^2 - 5*x + 6;
end

% Regula Falsi method function
function root = regula_falsi(a, b, tol, n)
  for i = 1:n
    fa = f(a);
    fb = f(b);
    
    % Check if signs are different at endpoints
    if fa * fb > 0
      error('Function signs must be different at initial guesses');
    end
    
    root = b - fb * (b - a) / (fb - fa);
    
    % Update interval based on function signs
    if f(root) * fa < 0
      b = root;
    else
      a = root;
    end
    
    % Check for convergence
    if abs(b - a) < tol
      break;
    end
  end
  
  % Print results
  if i < n
    fprintf('Root found in %d iterations: %f\n', i, root);
  else
    fprintf('Failed to converge in %d iterations\n', n);
  end
end

% Set initial guess interval, tolerance, and number of iterations
a = 1;
b = 3;
tol = 1e-5;
n = 4;

% Perform Regula Falsi iterations
root = regula_falsi(a, b, tol, n);

%This code defines the `f` function as before and then implements the `regula_falsi` function:

%1. **Function Input:** It takes the initial guess interval (a, b), tolerance (tol), and maximum iterations (n) as arguments.
%2. **Iteration Loop:** It iterates for `n` times or until convergence.
%3. **Function Evaluation:**  It evaluates the function at the interval endpoints (a and b).
%4. **Sign Check:** It checks if the function signs at `a` and `b` are different. This is necessary for the Regula Falsi method to work. If the signs are the same, it throws an error.
%5. **Root Update:** It calculates the new root estimate using the Regula Falsi formula.
%6. **Interval Update:** Based on the signs of f(root) and f(a), it updates the interval (a or b) that likely contains the root.
%7. **Convergence Check:** It checks if the interval width (b - a) is less than the tolerance, indicating convergence.
%8. **Output:** Similar to the previous code, it prints the root and the number of iterations used.
