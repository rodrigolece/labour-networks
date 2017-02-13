function out = neighbours(country, v)
% v is the ID of the node isntead of the number in [1,num_nodes]

k = country.V == v;
out = country.neighbours{k};

end