package com.example.service;

import org.springframework.stereotype.Component;

@Component
public class EnglishGreetingService implements GreetingService {
    @Override
    public String getGreeting() {
        return "Hello Spring MVC";
    }
}
