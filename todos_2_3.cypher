// Label Director hinzufügen
match (n) - [:DIRECTED] - (m:Movie) set n:Director

//Löschen aller unzulässigen Director-Labels
match (n) where not (n) - [:DIRECTED] - (:Movie) remove n:Director

//Hinzufügen einer Rolle
match (p :Person {name:"Keanu Reeves"}) - [r:ACTED_IN] - (:Movie {title:"The Matrix"}) set r.roles = r.roles + ["Hugo"] return r

