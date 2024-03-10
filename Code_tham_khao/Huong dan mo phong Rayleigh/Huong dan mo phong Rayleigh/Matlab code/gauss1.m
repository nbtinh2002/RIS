function out = gauss1(mean,var,s_row,s_column)
out = sqrt(var)*randn(s_row,s_column) + mean;
end