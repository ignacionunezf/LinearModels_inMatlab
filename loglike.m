function f=loglike(theta);

global y;
global X;
e=y-X*[theta(1);theta(2)];

f=zeros(size(y,1),1);
for i=1:size(y,1)
    f(i)=log(1/sqrt(2*pi*theta(3)^2)*exp(-1/(2*theta(3)^2)*(e(i))^2));
end

