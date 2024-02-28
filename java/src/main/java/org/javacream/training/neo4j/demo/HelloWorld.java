package org.javacream.training.neo4j.demo;

import org.neo4j.driver.Driver;
import org.neo4j.driver.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static org.neo4j.driver.Values.parameters;

@Component
public class HelloWorld {
    @Autowired
    private Driver driver;

    @Transactional
    public void create(final String message) {
        try (var session = driver.session()) {
            var greeting = session.executeWrite(tx -> {
                var query = new Query("CREATE (a:Greeting) SET a.message = $message RETURN a.message + ', from node ' + id(a)", parameters("message", message));
                var result = tx.run(query);
                return result.single().get(0).asString();
            });
            System.out.println(greeting);
        }
    }

    public List<String> findAll() {
        try (var session = driver.session()) {
            var greetings = session.executeWrite(tx -> {
                var query = new Query("MATCH (a:Greeting) RETURN a");
                var result = tx.run(query);
                List<String> resultAsString = result.list().stream().map(record -> record.get("message").toString()).collect(Collectors.toList());
                return resultAsString;
            });
            return greetings;
        }
    }
    public List<String> findByMessage(String message) {
        try (var session = driver.session()) {
            var greetings = session.executeWrite(tx -> {
                var query = new Query("MATCH (a:Greeting {message: $message}) RETURN a", parameters("message", message));
                var result = tx.run(query);
                return result.list().stream().map(record -> record.get("message").toString()).collect(Collectors.toList());
            });
            return greetings;
        }


    }

    public void removeAll() {
        try (var session = driver.session()) {
            session.executeWrite(tx -> {
                var query = new Query("MATCH (a:Greeting) DETACH DELETE a");
                var result = tx.run(query);
                return "OK";
            });
        }
    }
}


