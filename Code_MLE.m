% Code to run MLE with 1 regressor
% Ignacio Nunez, Economics Department, UT-Austin
clear;clear global;

% First, I load the data into variables y, x, and X which contains a column
% of ones too. I store these variables as global since they are going to be
% used in other functions

load data1.dat;  
data1;

global y;
global x;
global X;

y=data1(:,1);
x=data1(:,2);
X1=ones(size(x,1),1);
X=[X1,x];

% Second, I choose a vector of initial values for the estimators and use
% the function fminserch to find the minimum of the function logll, defined
% by inverting the model, and which is the negative of the log
% likelihood given X and y. The optimal values are stored in theta_hat.

options = optimset('Display','final','TolFun',1e-8,'MaxIter',100000);
theta=[1 1 1]; % Starting Values 
test = logll(theta);
theta_hat = fminsearch('logll',theta,options);

% Third, I calculate the sum of the derivates of the individual
% loglikelihood functions. For this I defined a new function loglike that
% gives the individual loglikelihood at theta_hat. The derivates are stored
% in DL_theta1, DL_theta2, and DL_theta3. 

L=loglike(theta_hat);
step=0.000001;
DL_theta1=(loglike([theta_hat(1)*(1+step),theta_hat(2),theta_hat(3)])-loglike(theta_hat))/(step*theta_hat(1));
DL_theta2=(loglike([theta_hat(1),theta_hat(2)*(1+step),theta_hat(3)])-loglike(theta_hat))/(step*theta_hat(2));
DL_theta3=(loglike([theta_hat(1),theta_hat(2),theta_hat(3)*(1+step)])-loglike(theta_hat))/(step*theta_hat(3));
DL=[DL_theta1,DL_theta2,DL_theta3];

% Lastly, I use the derivatives above and the formula in the assignment to
% calculate the variance-covariance matrix and then the standard errors.

V=inv(transpose(DL)*DL);
SE_theta1=sqrt(V(1,1));
SE_theta2=sqrt(V(2,2));
SE_theta3=sqrt(V(3,3));


