function out = convert2linIdx(country, nodes)

out = zeros(size(nodes));

for v = 1:country.num_nodes
    out(nodes == country.V(v)) = v;
end

end
