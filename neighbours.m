function [neighs, deg] = neighbours(edges, country)

% alpha = 0;
% beta = 1;

% Normalised weights
% w = round( country.A / min(country.A) );
% w = country.A;

neighs = cell(size(country.V));
deg = zeros(size(country.V));
% gen_deg = zeros(size(country.V));

for k = 1:country.num_nodes
    v = country.V(k);
    
    % Look neighbours in the first column
    idx = edges(:,1) == v;
    tmp_neighs = edges(idx,2);
%     tmp_weights = w(idx);
    
    % Look fot neighbours in the second column
    idx = edges(:,2) == v;
    tmp_neighs = [tmp_neighs; edges(idx,1)];
%     tmp_weights = [tmp_weights; w(idx)];
    
    neighs{k} = tmp_neighs;
    deg(k) = length(tmp_neighs);
%     gen_deg(k) = ( deg(k).^alpha * sum( tmp_weights ).^beta ).^(1/(alpha + beta));
end

end
