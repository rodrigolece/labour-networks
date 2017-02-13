function [bucket, core_nbs] = coreNumbers(country)

nn = country.num_nodes;

% Initialise numbers d_v
dvs = structDegree(country);
M = max(dvs);

D = cell(M+1, 1);

for i = 0:M
    idx = dvs == i;
    D{i+1} = country.V(idx);
end

k = 0; % the degeneracy number
bucket = [];
core_nbs = zeros(nn, 1);

for j = 1:nn
    for i = 1:M+1
        if ~isempty(D{i})
            actual_degree = i-1; % -1 because of indexing, to include D(0)
            k = max(k, actual_degree); 
            core_nbs(end + 1 - j) = k;
            
            % Select a node
            v = D{i}(1);
            bucket = [v; bucket];
            D{i} = D{i}(2:end);
            
            neighs = neighbours(country, v);
            % The neighbours that are not already in bucket
            neighs = neighs(~ismember(neighs, bucket));
            
            for u = neighs'
                lin_idx = country.V == u;
                du = dvs(lin_idx);
                dvs(lin_idx) = du - 1;
                
                % normally du - 1, but index means that this is already
                % shifted
                D{du} = [D{du}; u];
                % We find u in the old cells
                D{du+1} = D{du+1}(~ismember(D{du+1}, u));
            end

            break
        end
    end
end

end




% function [ordered_nodes, core_nbs] = coreNumbers(country)
% 
% nn = country.num_nodes;
% 
% % Bin-sort instead...
% [sorted_degrees, idx] = sort(structDegree(country));
% 
% ordered_nodes = country.V(idx);
% 
% core_nbs = zeros(nn, 1);
% 
% for v = 1:nn
%     dv = sorted_degrees(v);
%     core_nbs(v) = dv;
%     
%     for u = neighbours(country, ordered_nodes(v))' % transpose so that dimensions
%         lin_idx = country.V == u;            % <--   agree here.
%         if  sorted_degrees(lin_idx) > dv
%             sorted_degrees(lin_idx) = sorted_degrees(lin_idx) - 1;
%         end
%     end
%     
%     % Bin-sort instead...
%     [sorted_degrees, idx] = sort(sorted_degrees);
%     ordered_nodes = ordered_nodes(idx);
% end
% 
% end
