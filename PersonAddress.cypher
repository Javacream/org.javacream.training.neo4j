create (rainer :Person {lastname:"Sawitzki", firstname:"Rainer"})
create (klaus :Person {lastname:"Sawitzki", firstname:"Klaus"})
create (muenchen: Adress {city:"München", postalCode: 81377, street: "Marienplatz"})
create (berlin: Adress {city:"Berlin", postalCode: 30100, street: "Alexanderplatz"})
create (rainer) - [:LIVES_IN] -> (muenchen)
create (klaus) - [:LIVES_IN] -> (berlin)
match (n) return n