match (p1 {lastname:"Sawitzki"})
match(p2 {lastname:"Fabricius"})
create (p1) - [:LIKES] -> (p2)
create  (p1) <- [:LIKES] - (p2)