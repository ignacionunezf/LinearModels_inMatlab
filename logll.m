function f=logll(theta);

global y;
global X;

fprintf('Parameters:  %8.4f %8.4f %8.4f \n',theta(1),theta(2),theta(3))

e=y-X*[theta(1);theta(2)];
sum=0;
for i=1:size(e,1)
sum=sum+e(i)^2;
end
f=-size(y,1)/2*log(2*pi*(theta(3)^2))-1/(2*(theta(3)^2))*sum;
f=-f;

fprintf('Objective Function Value:  %20.16f \n',f)
