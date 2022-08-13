% Question 1b) GMM
clear;clear global;

% As before (MLE), first I load the data into variables y, x, and X, and
% store these variables as global.

load data1.dat;  
data1;

global y;
global x;
global X;

y=data1(:,1);
x=data1(:,2);
X1=ones(size(x,1),1);
X=[X1,x];

% Second, I define the weight matrix A and use the function A_init, which
% implements the formula in the assignment, to calculate an approximation
% to the optimal weight matrix


global A;
A=zeros(2,2);
theta=[0 1];
G(theta)
A=A_init(theta);

% Third, I use fminsearch to find the minimum of the GMM function, defined
% as GAG in a separate file, and using the approximation
% to the optimal weight matrix

options = optimset('Display','final','TolFun',1e-8,'MaxIter',100000);
theta_hat = fminsearch('GAG',theta,options);

% Fourth, I calculate numerically the derivative of the moment function G 

step=0.000001;
DG_theta1=(G([theta_hat(1)*(1+step),theta_hat(2)])-G(theta_hat))/(step*theta_hat(1));
DG_theta2=(G([theta_hat(1),theta_hat(2)*(1+step)])-G(theta_hat))/(step*theta_hat(2));
T=[DG_theta1,DG_theta2];

% Lastly, I implement the formulas in the assignment to calculate the
% standard errors of each estimator

V_aux=(1/size(y,1))^2*transpose(g_i(theta_hat))*g_i(theta_hat);
V=inv(transpose(T)*A*T)*transpose(T)*A*V_aux*A*T*inv(transpose(T)*A*T);

SE_theta1=sqrt(V(1,1));
SE_theta2=sqrt(V(2,2));


V_aux=(1/size(y,1))^2*transpose(g_i(theta_hat))*g_i(theta_hat);
V2=inv(T)*V_aux*inv(T);

SE_theta1=sqrt(V(1,1));
SE_theta2=sqrt(V(2,2));

