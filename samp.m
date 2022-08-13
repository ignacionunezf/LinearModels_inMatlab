% Sample Optimization Routine - samp.m 

clear;clear global;

% Some options for the fmins procedure 

options = optimset('Display','final','TolFun',1e-8,'MaxIter',100000);


%{ 
%To load in ascii data using matlab use something like this: 

load data1.asc;  
data1; 
load price1.asc;
price1;
 %}


global A;  
A=zeros(3,3);
A(1,1)=4;
A(2,2)=6;
A(3,3)=5;


%{ 
The above makes A a matrix that can be accessed in the function. 
You want to make your data,instrument matrix, and weighting
matrix global 
%}


beta1=[ 1 1 1 ]; % Starting Values 

test = sampfun(beta1);

b = fminsearch('sampfun',beta1,options)  % Call Routine 

% "fminsearch" uses simplex method , "fminunc" uses Newton type methods 

% Note:  Starting simple is small in Matlab






% The below should be placed in a separate file called sampfun.m

function retu=sampfun(theta);

global A;

fprintf('Parameters:  %8.4f %8.4f %8.4f \n',theta(1),theta(2),theta(3))

retu=(theta(1)-A(1,1))^2 + (theta(2)-A(2,2))^2 + (theta(3)-A(3,3))^2;

fprintf('Objective Function Value:  %20.16f \n',retu)
