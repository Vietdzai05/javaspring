package com.example.controller;

import com.example.model.Employee;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @GetMapping
    public String showEmployee(Model model) {
        // Tạo một đối tượng Employee giả lập
        Employee employee = new Employee(1, "Nguyễn Văn A", 15000000);

        // Đẩy đối tượng sang View
        model.addAttribute("employee", employee);

        return "employee";
    }

    @GetMapping("/list")
    public String showEmployeeList(Model model) {
        // Tạo danh sách 5 nhân viên giả lập
        List<Employee> employees = new ArrayList<>();
        employees.add(new Employee(1, "Nguyễn Văn A", 15000000));
        employees.add(new Employee(2, "Trần Thị B", 18000000));
        employees.add(new Employee(3, "Lê Văn C", 20000000));
        employees.add(new Employee(4, "Phạm Thị D", 17000000));
        employees.add(new Employee(5, "Hoàng Văn E", 22000000));

        // Đẩy danh sách sang View
        model.addAttribute("employees", employees);

        return "employee-list";
    }
}
