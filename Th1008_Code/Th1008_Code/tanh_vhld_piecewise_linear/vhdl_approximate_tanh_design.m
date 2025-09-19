function [y_out] = vhdl_approximate_tanh_design(x)
 y_out=1-(2./(1+power(2,2*1.44*x)));
end
