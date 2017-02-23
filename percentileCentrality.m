function out = percentileCentrality(percentile, country)

n = round(length(country.A)*percentile/100);

[~, idx] = sort(country.A, 'descend');
edges = country.Eud(idx(1:n),:);
edges = convert2linIdx(country, edges);
weights = country.A(idx(1:n));

G = graph(edges(:,1), edges(:,2), weights);
out = centrality(G, 'eigenvector');

end