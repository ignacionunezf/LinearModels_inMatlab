function f=g_i(theta);

global y;
global X;
e=y-X*[theta(1);theta(2)];

f=zeros(size(y,1),2);
for i=1:size(y,1)
    f(i,1)=e(i);
    f(i,2)=e(i)*X(i,2);
end
