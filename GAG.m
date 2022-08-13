function f=GAG(theta);

global A;
fprintf('Parameters:  %8.4f %8.4f \n',theta(1),theta(2))

f=transpose(G(theta))*inv(A)*G(theta);
fprintf('Objective Function Value:  %20.16f \n',f)
