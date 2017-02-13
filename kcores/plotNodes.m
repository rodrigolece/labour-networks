function plotNodes(G, country, nodes, lim_axes)

% I don't understand why the sort is needed, but if we use subgraph without
% a sorted set of nodes it plots the network differently.
nodes = sort(nodes);

nodes_inV = ismember(country.V, nodes);
idx = find(nodes_inV);

if lim_axes
    hold on
    xlim([-4 8])
    ylim([-8 6])
end

plot(subgraph(G,nodes), ...
    'XData', country.xcoord(idx), ...
    'YData', country.ycoord(idx), ...
    'NodeLabel', {} )
%     'NodeColor', [redfloat, greenfloat, bluefloat],...
%     'NodeLabel', ire_copy.V(idx) )
% h.LineStyle = 'none';
hold off

end