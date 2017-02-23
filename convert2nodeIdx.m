function out = convert2nodeIdx(country, ints)

out = zeros(size(ints));

for v = 1:country.num_nodes
    out(ints == v) = country.V(v);
end

end