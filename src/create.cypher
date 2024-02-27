create (s:Person {name: "Sawitzki", weight: 75.1})
create (m:Movie {title: "Star Trek IV"})
create (s)-[:LIKES] -> (m)
with s,m
return s,m
