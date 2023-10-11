package org.javacream.training.neo4j.publishing.repository;
import org.javacream.training.neo4j.publishing.api.Book;
import org.springframework.data.neo4j.repository.Neo4jRepository;
import org.springframework.data.neo4j.repository.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends Neo4jRepository<Book, String> {
    Book findOneByTitle(String title);
    List<Book> findAllByYear(Integer year);
}
