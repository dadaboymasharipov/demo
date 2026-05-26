package com.example.demo;

import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController("/api/test")
public class DemoController {


    @GetMapping
    public HttpEntity<?> get() {
        return ResponseEntity.ok("Successfull");
    }
}
