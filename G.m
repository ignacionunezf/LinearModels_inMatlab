function f=G(theta);

global y;
global X;
e=y-X*[theta(1);theta(2)];

f=zeros(2,1);
for i=1:size(y,1)
    f(1,1)=f(1,1)+1/size(y,1)*e(i);
    f(2,1)=f(2,1)+1/size(y,1)*e(i)*X(i,2);
end
