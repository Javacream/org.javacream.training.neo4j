//Nachbarn als Knoten
match (florida:State {code: "FL"}) -[border:SHARE_BORDER_WITH] -> (neighbors) return florida, border, neighbors

//Nachbarn-Namen
match (:State {code: "FL"}) -[:SHARE_BORDER_WITH] -> (neighbors) return neighbors.name

//Nachbarn als Liste der Codes, Arbeiten mit COLLECT
match (florida:State {code: "FL"}) -[border:SHARE_BORDER_WITH] -> (neighbors) return COLLECT(neighbors.code)

//Nachbarn der Nachbarn
match (florida:State {code: "FL"})-[:SHARE_BORDER_WITH] -> () -[:SHARE_BORDER_WITH] -> (neighbors_of_neighbors) return neighbors_of_neighbors

//Population der Nachbarstaaten
match (:State {code: "FL"}) -[:SHARE_BORDER_WITH] -> (neighbors) return neighbors.name as state_name, neighbors.population as state_population order by neighbors.population desc

