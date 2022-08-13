% Code to run OLS with 1 regressor
% Ignacio Nunez, Economics Department, UT-Austin

clear;clear global;

% First, I load the data into variables y and x
load data1.dat;  
data1;
y=data1(:,1);
x=data1(:,2);

% Second, I calculate the covariance between x and y and variance of x
sum1=0;
sum2=0;

for i=1:size(x,1)
sum1=sum1+(x(i)-mean(x))*(y(i)-mean(y));
sum2=sum2+(x(i)-mean(x))^2;
end

% Third, I calculate the estimators according to the classic formulas
theta2=sum1/sum2;
theta1=mean(y)-mean(x)*theta2;

% Lastly, I calculate the residuals and use them to calculate the standard
% errors of the estimators:

X1=ones(size(x,1),1);
X=[X1,x];
e=y-X*[theta1;theta2];

sum=0;
for i=1:size(e,1)
sum=sum+e(i)^2;
end
var=sum/(500-2);
V=inv(transpose(X)*X)*var;


SE_theta1=sqrt(V(1,1));
SE_theta2=sqrt(V(2,2));
