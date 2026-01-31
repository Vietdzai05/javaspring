package com.example.controller;

import com.example.model.Employee;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.LinkedHashMap;
import java.util.Map;

@Controller
public class EmployeeController {

    @GetMapping("/add-employee")
    public String showForm(Model model) {
        // Tạo đối tượng Employee rỗng để bind vào form
        model.addAttribute("employee", new Employee());
        return "add-employee";
    }

    @PostMapping("/submit-employee")
    public String submitForm(@ModelAttribute("employee") Employee employee, Model model) {
        // Nhận dữ liệu từ form và chuyển sang trang kết quả
        model.addAttribute("employee", employee);
        return "result";
    }

    // ModelAttribute này sẽ tự động được thêm vào tất cả các request
    @ModelAttribute("departmentOptions")
    public Map<String, String> getDepartmentOptions() {
        Map<String, String> departments = new LinkedHashMap<>();
        departments.put("CNTT", "Công nghệ thông tin");
        departments.put("NS", "Nhân sự");
        departments.put("KD", "Kinh doanh");
        return departments;
    }

    @ModelAttribute("skillOptions")
    public Map<String, String> getSkillOptions() {
        Map<String, String> skills = new LinkedHashMap<>();
        skills.put("Java", "Java");
        skills.put("CSharp", "C#");
        skills.put("Python", "Python");
        return skills;
    }
}
