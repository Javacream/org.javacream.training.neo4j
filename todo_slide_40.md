### Directors
* match (n) - [:DIRECTED] - (m:Movie) return n

### Directors name and directed film

* match (n) - [:DIRECTED] - (m:Movie) return n.name, m.title

### set Label 

* match (n) - [:DIRECTED] - (m:Movie) set n:Director
* match (n:Director) return n.name
* match (n:Person) where any(label in labels(n) where not label in ['Director']) return n

### 
match (n) where not (n) - [:DIRECTED] - (:Movie) remove n:Director
