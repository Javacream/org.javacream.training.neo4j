package org.javacream.training.neo4j.publishing.web;

import org.javacream.training.neo4j.demo.HelloWorld;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class PublishingWebService {
    @Autowired private HelloWorld helloWorld;
    @GetMapping(path = "api/demo", produces = MediaType.TEXT_PLAIN_VALUE)
    String sayHello(@RequestHeader("message") String message){
        helloWorld.printGreeting(message);
        return "OK";
    }

}
