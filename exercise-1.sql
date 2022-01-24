-- Query 1 : 1 hop
select distinct fromnode as fromNode, tonode as toNode, '1' as length, '(' || fromnode  ||  ' -> '  ||  tonode  ||  ')' as path from webgraph1 where fromnode <> tonode; 5.898 ms
select distinct fromnode as fromNode, tonode as toNode, '1' as length, '(' || fromnode  ||  ' -> '  ||  tonode  ||  ')' as path from webgraph2 where fromnode <> tonode; 14.822 ms
select distinct fromnode as fromNode, tonode as toNode, '1' as length, '(' || fromnode  ||  ' -> '  ||  tonode  ||  ')' as path from webgraph3 where fromnode <> tonode; 28.141 ms

-- Query 2 : 2 hop
select distinct w1.fromnode as fromNode, w2.tonode as toNode, '2' as length, '(' || w1.fromnode || ' -> ' || w2.fromnode || ' -> ' ||  w2.tonode  ||  ')' as path from webgraph1 w1, webgraph1 w2 where w1.fromnode <> w1.tonode and w2.fromnode <> w2.tonode and w1.fromnode <> w2.tonode and w1.tonode = w2.fromnode; 25.833 ms
select distinct w1.fromnode as fromNode, w2.tonode as toNode, '2' as length, '(' || w1.fromnode || ' -> ' || w2.fromnode || ' -> ' ||  w2.tonode  ||  ')' as path from webgraph2 w1, webgraph2 w2 where w1.fromnode <> w1.tonode and w2.fromnode <> w2.tonode and w1.fromnode <> w2.tonode and w1.tonode = w2.fromnode; 151.465 ms
select distinct w1.fromnode as fromNode, w2.tonode as toNode, '2' as length, '(' || w1.fromnode || ' -> ' || w2.fromnode || ' -> ' ||  w2.tonode  ||  ')' as path from webgraph3 w1, webgraph3 w2 where w1.fromnode <> w1.tonode and w2.fromnode <> w2.tonode and w1.fromnode <> w2.tonode and w1.tonode = w2.fromnode; 292.974 ms

-- Query 3 : 3 hop
select distinct w1.fromnode as fromNode, w2.tonode as toNode, '3' as length, '(' || w1.fromnode || ' -> ' || w2.fromnode || ' -> ' || w3.fromnode || ' -> ' ||  w3.tonode  ||  ')' as path from webgraph1 w1, webgraph1 w2, webgraph1 w3 
where w1.fromnode <> w1.tonode and w2.fromnode <> w2.tonode and w3.fromnode <> w3.tonode and w1.tonode = w2.fromnode and w2.tonode = w3.fromnode and w1.fromnode <> w2.tonode and w2.fromnode <> w3.tonode and w1.fromnode <> w3.tonode;    449.131 ms
select distinct w1.fromnode as fromNode, w2.tonode as toNode, '3' as length, '(' || w1.fromnode || ' -> ' || w2.fromnode || ' -> ' || w3.fromnode || ' -> ' ||  w3.tonode  ||  ')' as path from webgraph2 w1, webgraph2 w2, webgraph2 w3 
where w1.fromnode <> w1.tonode and w2.fromnode <> w2.tonode and w3.fromnode <> w3.tonode and w1.tonode = w2.fromnode and w2.tonode = w3.fromnode and w1.fromnode <> w2.tonode and w2.fromnode <> w3.tonode and w1.fromnode <> w3.tonode;    3327.673 ms
select distinct w1.fromnode as fromNode, w2.tonode as toNode, '3' as length, '(' || w1.fromnode || ' -> ' || w2.fromnode || ' -> ' || w3.fromnode || ' -> ' ||  w3.tonode  ||  ')' as path from webgraph3 w1, webgraph3 w2, webgraph3 w3 
where w1.fromnode <> w1.tonode and w2.fromnode <> w2.tonode and w3.fromnode <> w3.tonode and w1.tonode = w2.fromnode and w2.tonode = w3.fromnode and w1.fromnode <> w2.tonode and w2.fromnode <> w3.tonode and w1.fromnode <> w3.tonode;    9957.135 ms

