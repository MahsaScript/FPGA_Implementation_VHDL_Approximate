close all;
clc;
% theta = fi(-2*pi:.1:2*pi);
xmin=-4;
xmax=+4;
n=1000;
x= linspace(xmin,xmax,n+1); 
T = vhdl_approximate_tanh_design(double(x));
iteration = [5,15,25];
 for i = 1:length(iteration)
     for niters = iteration(i)
        T_cordic = cordictanh(x, niters);
        plot(x, T_cordic);
        grid on;
        hold on;
     end
 end
xlabel('theta');
ylabel('tanh(theta)');
legend('5 iterations', '15 iterations', '25 iterations','Location','southeast');
figure;
err = abs(tanh(x) - double(T_cordic));
plot(x, err);
xlabel('theta');
ylabel('error');
error = RMSE(tanh(x),T_cordic);
formatSpec = '%.10f';
error_=num2str(error,formatSpec);
disp(num2str(error,formatSpec));
title("tanh(x)& cordic aproximation Error = " + error_);
xlabel('x');
ylabel('tanh(x)');
