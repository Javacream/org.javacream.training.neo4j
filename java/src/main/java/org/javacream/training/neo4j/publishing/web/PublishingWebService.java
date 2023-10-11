package org.javacream.training.neo4j.publishing.web;

import org.javacream.training.neo4j.demo.HelloWorld;
import org.javacream.training.neo4j.publishing.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class PublishingWebService {
    @Autowired private HelloWorld helloWorld;
    @Autowired
    BookRepository bookRepository;

    @PostMapping(path = "api/demo", produces = MediaType.TEXT_PLAIN_VALUE)
    public String greet(@RequestHeader("message") String message){
        helloWorld.create(message);
        return "OK";
    }
    @GetMapping(path = "api/demo", produces = MediaType.TEXT_PLAIN_VALUE)
    public String findAll(){
        return helloWorld.findAll().toString();
    }
    @GetMapping(path = "api/demo/filtered", produces = MediaType.TEXT_PLAIN_VALUE)
    public String findByMessage(@RequestHeader("filter") String filter){
        return helloWorld.findByMessage(filter).toString();
    }
    @DeleteMapping(path = "api/demo", produces = MediaType.TEXT_PLAIN_VALUE)
    public void delete(){
        helloWorld.removeAll();
    }

}
