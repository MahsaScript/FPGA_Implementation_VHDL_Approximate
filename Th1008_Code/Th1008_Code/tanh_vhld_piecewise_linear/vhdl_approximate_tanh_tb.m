clc;
clear ;
close all;
xmin=-5;
xmax=+5;
n=100000;
x1= linspace(xmin,xmax,n+1);
t1=tanh(x1);
plot(x1,t1);
hold on;

grid on;
tanh_=1-2.*(1./(1+power(2,1.44*x1)));
plot(x1,tanh(x1));

tanh_piecewise = vhdl_approximate_tanh_design(x1);
% tanh_piecewise = tanh(x1);
a=find(x1==-5);
b=find(x1==-3);
c=find(x1==-1);
d=find(x1==1);
e=find(x1==3);
f=find(x1==5);

y1=tanh_piecewise([a]);
y2=tanh_piecewise([b]);
y3=tanh_piecewise([c]);
y4=tanh_piecewise([d]);
y5=tanh_piecewise([e]);
y6=tanh_piecewise([f]);

m1=(y2-y1)/(x1(b)-x1([a]));
m2=(y3-y2)/(x1(c)-x1([b]));
m3=(y4-y3)/(x1(d)-x1([c]));
m4=(y5-y4)/(x1(e)-x1([d]));
m5=(y6-y5)/(x1(f)-x1([e]));

b1=y1-m1*x1([a]);
b2=y2-m2*x1([b]);
b3=y3-m3*x1([c]);
b4=y4-m4*x1([d]);
b5=y5-m5*x1([e]);

Y1=(m1*x1(1:20000))+b1;
Y2=(m2*x1(20001:40001))+b2;
Y3=(m3*x1(40002:60002))+b3;
Y4=(m4*x1(60003:80003))+b4;
Y5=(m5*x1(80004:100001))+b5;

Y = [Y1 Y2 Y3 Y4 Y5];
plot(x1(1:20000),Y1)
hold on
plot(x1(20001:40001),Y2)
hold on
plot(x1(40002:60002),Y3)
hold on
plot(x1(60003:80003),Y4)
hold on 
plot(x1(80004:100001),Y5)
hold on
error = RMSE(t1,Y);
formatSpec = '%.10f';
error_=num2str(error,formatSpec);
disp(error_);
title("tanh(x)& piecewise linear Error = " + error_);
figure;
err = abs(tanh(x1) - double(Y));
plot(x1, err);
xlabel('theta');
ylabel('error');
title("tanh(x)& piecewise aproximation Error = " + error_);
formatSpec = '%.10f';
error_=num2str(error,formatSpec);
disp(num2str(error,formatSpec));


