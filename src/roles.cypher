create user hugo set password "egal123!"
alter user hugo set password "secret123!" change not required
grant role reader to hugo
create role training as copy of reader
grant role training to hugo
grant create on graph neo4j nodes Training on training
grant create on graph neo4j nodes Training to training
