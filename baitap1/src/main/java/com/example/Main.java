package com.example;

import com.example.config.AppConfig;
import com.example.controller.HomeController;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class Main {
    public static void main(String[] args) {
        // Tạo Spring Application Context
        ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);

        // Lấy bean HomeController từ Spring Container
        HomeController homeController = context.getBean(HomeController.class);

        // Gọi phương thức để hiển thị lời chào
        homeController.displayGreeting();

        // Đóng context
        ((AnnotationConfigApplicationContext) context).close();
    }
}
