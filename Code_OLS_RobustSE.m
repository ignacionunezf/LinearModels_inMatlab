%% OLS regression with heteroskedastic-robust standard errors
% Ignacio J. Nunez, Economics Department, UT-Austin, ijnunez@utexas.edu

clear all;
close all;

%% import data
filename = 'Final_Name';
sheet = 1;
xlRange = 'A1:B100';
[num,textT,raw] = xlsread(filename, sheet, xlRange);

Constant=ones(size(num,1),1);

clear X Y;
coef_tot=2;

Y(:,1)=num(:,1); %Dependent variable
X(:,1)=Constant; %Intercept
X(:,2)=num(:,2); %Explanatory variable

clear Beta SIGMA V e e2 SE_Beta;

% OLS
Beta=inv(X' * X)*(X'*Y);

% Standard errors
N=size(Y,1);
e=Y-X*Beta;
e2=e.^2;
SIGMA=zeros(N,N);
for i=1:N
    SIGMA(i,i)=e2(i);
end
V=inv(X' * X)*(X' * SIGMA * X)*inv(X' * X);
for i=1:coef_tot
    SE_Beta(i,1)=sqrt(V(i,i));
end

% R2
SStot=0;
SSres=0;
avg_Y=mean(Y);
for i=1:N
    SStot=SStot+(Y(i)-avg_Y)^2;
    SSres=SSres+e(i)^2;
end
R2_Beta=1-SSres/SStot;
