function out = structDegree(country)

nn = country.num_nodes;
out = zeros(nn, 1);

for k = 1:nn
    out(k) = length(country.neighbours{k});
end

end
