function ret=A_init(theta);

global y;
global X;
e=y-X*[theta(1);theta(2)];

f=G(theta);

ret=zeros(2,2);
for i=1:size(y,1)
    ret=ret+(1/size(y,1))^2*([e(i);e(i)*X(i,2)]-f)*transpose(([e(i);e(i)*X(i,2)]-f));
end


