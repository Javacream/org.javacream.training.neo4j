//CREATE STATES

CREATE (FL:State {code: "FL", name: "Florida", population: 21500000})
CREATE (AL:State {code: "AL", name: "Alabama", population: 4900000})
CREATE (GA:State {code: "GA", name: "Georgia", population: 10600000})
CREATE (MS:State {code: "MS", name: "Mississippi", population: 3000000})
CREATE (TN:State {code: "TN", name: "Tennessee", population: 6800000})
CREATE (NC:State {code: "NC", name: "North Carolina", population:
10500000})
CREATE (SC:State {code: "SC", name: "South Carolina", population: 5100000})
CREATE (FL)-[:SHARE_BORDER_WITH]->(AL)
CREATE (FL)-[:SHARE_BORDER_WITH]->(GA)
CREATE (AL)-[:SHARE_BORDER_WITH]->(MS)
CREATE (AL)-[:SHARE_BORDER_WITH]->(TN)
CREATE (GA)-[:SHARE_BORDER_WITH]->(AL)
CREATE (GA)-[:SHARE_BORDER_WITH]->(NC)
CREATE (GA)-[:SHARE_BORDER_WITH]->(SC)
CREATE (SC)-[:SHARE_BORDER_WITH]->(NC)
CREATE (TN)-[:SHARE_BORDER_WITH]->(MS)
CREATE (NC)-[:SHARE_BORDER_WITH]->(TN)
CREATE (CA:State {code: "AK", name: "Alaska", population: 700000 })

//Neighbors of Florida

MATCH (:State {code: "FL"})-[:SHARE_BORDER_WITH]-(n)
RETURN n.name

//Neighbors population

MATCH (:State {code: "FL"})-[:SHARE_BORDER_WITH]-(n)
RETURN n.name as state_name, n.population as state_population
ORDER BY n.population DESC

//Neighbors of Neighbors
MATCH (:State {code: "FL"})-[:SHARE_BORDER_WITH]-(neighbor)-
[:SHARE_BORDER_WITH]-(neighbor_of_neighbor)
RETURN neighbor_of_neighbor

//No indirect neighbor_of_neighbor

MATCH (FL:State {code: "FL"})-[:SHARE_BORDER_WITH]-(neighbor)-
[:SHARE_BORDER_WITH]-(neighbor_of_neighbor)
WHERE NOT (FL)-[:SHARE_BORDER_WITH]-(neighbor_of_neighbor)
RETURN neighbor_of_neighbor

//Hops

MATCH (:State {code: "FL"})-[:SHARE_BORDER_WITH*2]-(neighbor_of_neighbor)
RETURN neighbor_of_neighbor

MATCH (:State {code: "FL"})-[:SHARE_BORDER_WITH*2..3]-(neighbor_of_neighbor)
RETURN neighbor_of_neighbor

//Optional Match

MATCH (n:State {code: "AK"}) OPTIONAL MATCH (n)-[:SHARE_BORDER_WITH]-(m)
RETURN n.name, m.name

//Aggregate: Count

MATCH (FL:State {code: "FL"})-[:SHARE_BORDER_WITH]-(n)
RETURN FL.name as state_name, COUNT(n.code) as number_of_neighbors

//Result Lists
MATCH (:State {code: "FL"})-[:SHARE_BORDER_WITH]-(n)
RETURN COLLECT(n.code)

//Unwind, here a NOP

MATCH (:State {code: "FL"})-[:SHARE_BORDER_WITH]-(n)
WITH COLLECT(n.code) as codes
UNWIND codes as c
RETURN c


//Load Data
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/PacktPublishing/Hands-On-Graph-Analytics-with-Neo4j/master/Chapter02/data/usa_state_neighbors_edges.csv" AS row
FIELDTERMINATOR ';'
MERGE (n:State {code: row.code})
MERGE (m:State {code: row.neighbor_code})
MERGE (n)-[:SHARE_BORDER_WITH]->(m)


LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/PacktPublishing/Hands-On-Graph-Analytics-with-Neo4j/master/Chapter02/data/usa_state_neighbors_all.csv" AS row
FIELDTERMINATOR ';'
WITH row.code as state, split(row.neighbors, ',') as neighbors
MERGE (a:State {code: state})
WITH a, neighbors
UNWIND neighbors as neighbor
WITH a, neighbor
WHERE neighbor <> ""
MERGE (b:State {code: neighbor})
CREATE (a)-[:SHARE_BORDER_WITH]->(b)


