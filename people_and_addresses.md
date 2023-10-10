### Create Nodes and Relations

create (p1:Person {lastname: "Sawitzki"})    
create (p2:Person {lastname: "Musterfrau"})    
create (p3:Person {lastname: "Foo"})    
create (p4:Person {lastname: "Goo"})    
create (a1:Address {city: 'München', street: 'Marienplatz'})    
create (a2:Address {city: 'Berlin', street: 'Alexanderplatz'})    
create (a3:Address {city: 'Stuttgart', street: 'Schlossplatz'})    
create (p1) - [:HAS {primary: true}] -> (a1)    
create (p1) - [:HAS] -> (a2)    
create (p2) - [:HAS] -> (a2)    
create (p2) - [:HAS {primary: true}] -> (a3)    
create (p2) - [:HAS] -> (a3)    
create (p3) - [:HAS {primary: true}] -> (a3)    
create (p4) - [:HAS {primary: true}] -> (a1)    
create (p4) - [:HAS {primary: true}] -> (a2)    

### Matches
#### All nodes and relations    
match(n) return n

#### people and primary addresses
match(p) - [r:HAS {primary: true}]-> (a) return p,a,r    

Hint: Disable 'Connect result nodes' in settings to see only primary addresses






