// Label Director hinzufügen
match (n) - [:DIRECTED] - (m:Movie) set n:Director

//Löschen aller unzulässigen Director-Labels
match (n) where not (n) - [:DIRECTED] - (:Movie) remove n:Director

