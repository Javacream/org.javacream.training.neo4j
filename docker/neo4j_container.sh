docker create --name neo4j -p 7474:7474 -p 7687:7687 -e NEO4J_ACCEPT_LICENSE_AGREEMENT=yes neo4j:enterprise
docker start neo4j
