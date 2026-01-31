package com.example;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;

import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/employees")
public class EmployeeController {
    private static List<Employee> employees = new ArrayList<>();

    static {
        employees.add(new Employee(1, "Nguyễn Văn A", "a@example.com", "Dev"));
        employees.add(new Employee(2, "Trần Thị B", "b@example.com", "QA"));
        employees.add(new Employee(3, "Lê Văn C", "c@example.com", "Manager"));
    }

    @GetMapping("/list")
    public String listEmployees(@RequestParam(required = false) String search, Model model) {
        List<Employee> filteredEmployees = employees;

        if (search != null && !search.isEmpty()) {
            filteredEmployees = employees.stream()
                    .filter(e -> e.getName().toLowerCase().contains(search.toLowerCase()) ||
                            e.getEmail().toLowerCase().contains(search.toLowerCase()) ||
                            e.getPosition().toLowerCase().contains(search.toLowerCase()))
                    .collect(Collectors.toList());
            model.addAttribute("search", search);
        }

        model.addAttribute("employees", filteredEmployees);
        model.addAttribute("totalCount", filteredEmployees.size());
        return "list-employees";
    }

    @GetMapping("/add-employee")
    public String showAddForm(Model model) {
        model.addAttribute("employee", new Employee());
        return "add-employee";
    }

    @PostMapping("/submit-employee")
    public String submitEmployee(@Valid @ModelAttribute Employee employee, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "add-employee";
        }

        Integer maxId = employees.stream()
                .map(Employee::getId)
                .max(Integer::compareTo)
                .orElse(0);
        employee.setId(maxId + 1);
        employees.add(employee);

        model.addAttribute("message", "Thêm nhân viên thành công!");
        model.addAttribute("employee", employee);
        return "result";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Integer id, Model model) {
        Employee employee = employees.stream()
                .filter(e -> e.getId().equals(id))
                .findFirst()
                .orElse(null);
        model.addAttribute("employee", employee);
        return "edit-employee";
    }

    @PostMapping("/update-employee")
    public String updateEmployee(@Valid @ModelAttribute Employee employee, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "edit-employee";
        }

        employees.stream()
                .filter(e -> e.getId().equals(employee.getId()))
                .findFirst()
                .ifPresent(e -> {
                    e.setName(employee.getName());
                    e.setEmail(employee.getEmail());
                    e.setPosition(employee.getPosition());
                });

        model.addAttribute("message", "Cập nhật nhân viên thành công!");
        model.addAttribute("employee", employee);
        return "result";
    }

    @GetMapping("/delete/{id}")
    public String deleteEmployee(@PathVariable Integer id) {
        employees.removeIf(e -> e.getId().equals(id));
        return "redirect:/employees/list";
    }
}
