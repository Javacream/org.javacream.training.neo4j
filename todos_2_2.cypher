//Alle Personen mit "K"

Match (p :Person)  where p.name STARTS WITH "K" return p

//Tom Hanks Movies

MATCH (tom:Person {name: "Tom Hanks"})-[:ACTED_IN]->(tomHanksMovies) RETURN tom,tomHanksMovies

//Alle Directors
Match (p :Person) - [:DIRECTED] -> (m :Movie) return p,m

//Die Rollen von Tom Hanks
MATCH (:Person {name: "Tom Hanks"})-[r :ACTED_IN]->(m) RETURN r.roles, m.title