function [y_out] = vhdl_approximate_tanh_design( x )
    y_out = 1-(2./(power(2,((4-1-(1/4)+(1/8))*x))+1));
end
