package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/calculator")
public class CalculatorController {

    public CalculatorController() {
        System.out.println("DEBUG: CalculatorController created!");
    }

    @GetMapping
    public String showForm() {
        System.out.println("DEBUG: showForm() called");
        return "calculator";
    }

    @PostMapping("/calculate")
    public String calculate(
            @RequestParam("a") double a,
            @RequestParam("b") double b,
            @RequestParam("operation") String operation,
            Model model) {

        double result = 0;
        String operationSymbol = "";
        boolean error = false;
        String errorMessage = "";

        switch (operation) {
            case "add":
                result = a + b;
                operationSymbol = "+";
                break;
            case "subtract":
                result = a - b;
                operationSymbol = "-";
                break;
            case "multiply":
                result = a * b;
                operationSymbol = "*";
                break;
            case "divide":
                if (b == 0) {
                    error = true;
                    errorMessage = "Không thể chia cho 0!";
                } else {
                    result = a / b;
                    operationSymbol = "/";
                }
                break;
            default:
                error = true;
                errorMessage = "Phép tính không hợp lệ!";
        }

        model.addAttribute("a", a);
        model.addAttribute("b", b);
        model.addAttribute("operation", operationSymbol);
        model.addAttribute("result", result);
        model.addAttribute("error", error);
        model.addAttribute("errorMessage", errorMessage);

        return "result";
    }
}
