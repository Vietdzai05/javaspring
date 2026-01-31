package com.example.model;

import java.util.List;

public class Employee {
    private String fullName;
    private String gender;
    private String department;
    private List<String> skills;

    public Employee() {
    }

    public Employee(String fullName, String gender, String department, List<String> skills) {
        this.fullName = fullName;
        this.gender = gender;
        this.department = department;
        this.skills = skills;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public List<String> getSkills() {
        return skills;
    }

    public void setSkills(List<String> skills) {
        this.skills = skills;
    }
}
