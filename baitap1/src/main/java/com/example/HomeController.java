package com.example.controller;

import com.example.service.GreetingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class HomeController {

    @Autowired
    private GreetingService greetingService;

    public void displayGreeting() {
        String message = greetingService.getGreeting();
        System.out.println(message);
    }
}
