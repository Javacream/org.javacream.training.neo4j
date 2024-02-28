docker create --name neo4j_metrics -p 2004:2004 -p 7474:7474 -p 7687:7687 -e NEO4J_AUTH=neo4j/javacream123! -e NEO4J_ACCEPT_LICENSE_AGREEMENT=yes javacream/neo4j:metrics
docker start neo4j_metrics
