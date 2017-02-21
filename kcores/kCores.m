function [k, cores] = kCores(edges, country, cumulative)

[nodes, nbs] = coreNumbers(edges, country);

unique_numbers = flipud(unique(nbs));
k = length(unique_numbers);

cores = cell(k, 1);

if cumulative
    cum_core = [];
    
    for j = 1:k
        idx = nbs == unique_numbers(j);
        jcore = nodes(idx);       
        cum_core = [jcore ; cum_core];
        cores{j} = cum_core;
    end
    
else
    for j = 1:k
        idx = nbs == unique_numbers(j);
        cores{j} = nodes(idx);
    end
end
