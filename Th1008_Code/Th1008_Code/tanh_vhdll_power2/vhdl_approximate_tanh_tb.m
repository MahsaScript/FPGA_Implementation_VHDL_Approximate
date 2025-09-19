% C:\Program Files\Polyspace\R2020a\toolbox\hdlcoder\hdlcoderdemos\matlabhdlcoderdemos
clc;
clear ;
close all;
xmin=-4;
xmax=+4;
x= linspace(xmin,xmax,1e3); 
for itr = 1e3:-1:1
    y_power2(itr) =vhdl_approximate_tanh_design( x(itr) );
    y(itr) = vhdl_approximate_tanh_power( x(itr) );
end
figure
% plot( x, y );

plot(x,y_power2,'r.',x,y,'b'),legend('power 2', 'tanh(x)');
grid on;
error = RMSE(y_power2,y);
formatSpec = '%.10f';
error_=num2str(error,formatSpec);
disp(error_);
title("tanh(x)& power 2 aproximation Error = " + error_);
xlabel('x');
ylabel('tanh(x)');
figure;
err = abs(tanh(x) - double(y_power2));
plot(x, err);
xlabel('theta');
ylabel('error');
title("tanh(x)& piecewise aproximation Error = " + error_);