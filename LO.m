function [LO] = LO(input)
%%
% Soft classificatory kernel LO. Part of paper "Collective properties of  cellular identity: 
% a computational approach". arXiv: 1302:0826.
%%
% input is a vector (a single cell line) with microarray or other gene expression values.
% NOTE: MIN value for input vector is calculated as 0.
%%
m = length(input);
for i = 1:m
     LO(i,:) = 1-input(i,:)./(max(input)-0);
end