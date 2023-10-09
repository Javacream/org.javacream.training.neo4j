# use variables defined in node create

create (p1 {lastname: "Meier"})     
create (p2 {lastname: "Schneider"})    
create (p1) -[:KNOWS] -> (p2)

# create and match afterwards

create (p1:Person {lastname: "Metzger"})    
create (p2:Person {lastname: "Hoffmann"})    

after that    
match (p1:Person {lastname:"Metzger"})    
match (p2:Person {lastname: "Hoffmann"})    
create (p1)- [:KNOWS] -> (p2)    




