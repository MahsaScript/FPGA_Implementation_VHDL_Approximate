function y = vhdl_approximate_tanh( x )
   y = (exp(x)-exp(-x))./(exp(x)+exp(-x));
%     y =1- (2./( 1./(1+exp(2*x))));
end