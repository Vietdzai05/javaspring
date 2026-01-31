package com.example.controller;

import com.example.model.Employee;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    @GetMapping("/list")
    public String listEmployees(Model model) {
        // Tạo danh sách nhân viên với lương theo USD
        List<Employee> employees = new ArrayList<>();
        employees.add(new Employee(1, "Nguyễn Văn A", 800));    // Khá
        employees.add(new Employee(2, "Trần Thị B", 1200));     // Giỏi - tô đỏ
        employees.add(new Employee(3, "Lê Văn C", 1500));       // Giỏi - tô đỏ
        employees.add(new Employee(4, "Phạm Thị D", 950));      // Khá
        employees.add(new Employee(5, "Hoàng Văn E", 2000));    // Giỏi - tô đỏ
        employees.add(new Employee(6, "Võ Thị F", 750));        // Khá
        employees.add(new Employee(7, "Đặng Văn G", 1800));     // Giỏi - tô đỏ

        model.addAttribute("employees", employees);

        return "list-employees";
    }
}
