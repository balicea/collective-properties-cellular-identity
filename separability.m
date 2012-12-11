[S, Za, Zb] = separability(k,m,n,p)
% k is the interval (rows) in matrix for replicates of cell line A, m is the interval (rows) in matrix for replicates of cell line B, 
n is the gene of interest (column), and p is the number of genes (columns) under analysis.
%%
A = data(k,n)
B = data(m,n)
%%
for i=p;
	if abs(min(A(i:,))-min(B(i,:))) < abs(min(A(i,:))-max(A(i,:)));
		S(i,:) = 1

	elseif abs(min(B(i,:))-max(A(i,:))) < abs(min(B(i,:))-max(B(i,:)));
		S(i,:) = 1

	else
		S(i,:) = 0
end
%%
% calculate z-scores
%%
a_s = std(A);
b_s = std(B);
a_mu = mean(mean(A));
b_mu = mean(mean(B));
x_a = A - a_mu;
x_b = B - b_mu;
z_a = x_a./a_s;
z_b = x_b./b_s;
%%
% conduct outlier test.
%%
for i=p;
	if z_a(i,:) > 2;
		Za(i,:) = 1

	if z_a(i,:) < -2;
		Za(i,:) = 1

	else
		Za(i,:) = 0
end
%%
for i=p;
	if z_b(i,:) > 2;
		Zb(i,:) = 1

	if z_b(i,:) < -2;
		Zb(i,:) = 1

	else
		Zb(i,:) = 0
end