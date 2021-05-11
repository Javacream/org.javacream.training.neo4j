//Verbindung Tom Hanks, Ed Harris
match(p:Person {name:"Tom Hanks"}) - [:ACTED_IN] -> (m:Movie)<- [:ACTED_IN]-(p2:Person {name:"Ed Harris"}) return p, m, p2

//Verbindung Tom Hanks, Ed Harris, selber Film

//Verbindungen zwischen Hanks und Cruise
MATCH (tom:Person {name:"Tom Hanks"})-[:ACTED_IN]->(m)<-[:ACTED_IN]-(coActors),
  (coActors)-[:ACTED_IN]->(m2)<-[:ACTED_IN]-(cruise:Person {name:"Tom Cruise"})
RETURN tom, m, coActors, m2, cruise

//Shortest Path
MATCH p=shortestPath(
(bacon:Person {name:"Kevin Bacon"})-[*]-(meg:Person {name:"Meg Ryan"})
)
RETURN p