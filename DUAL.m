function [y] = DUAL(input)
%%
% Soft classificatory kernel Q. Part of paper "Collective properties of  cellular identity: 
% a computational approach". arXiv: 1302:0826.
%%
% input is a vector (a single cell line) with microarray or other gene expression values.
% NOTE: MIN value for input vector is calculated as 0.
%%
m = length(input);
a_s = std(input);
a_mu = mean(mean(input));
x_a = input - a_mu;
z = x_a./a_s;
%%
%  calculate z-score on data.
%%
if z < 0
%%
%  use HI kernel.
%%
for i = 1:m
     DUAL(i,:) = input(i,:)./(max(input)-0);
end
elseif z > 0
%%
%  use LO kernel
%%
for i = 1:m
     DUAL(i,:) = 1-input(i,:)./(max(input)-0);
end

