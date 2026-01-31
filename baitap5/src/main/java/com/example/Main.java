package com.example;

import com.example.config.WebConfig;
import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.startup.Tomcat;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import java.io.File;

public class Main {
    public static void main(String[] args) throws LifecycleException {
        // Tạo Tomcat instance
        Tomcat tomcat = new Tomcat();
        tomcat.setPort(8080);
        tomcat.getConnector();

        // Tạo context với webapp directory
        String webappDirLocation = "baitap5/src/main/webapp/";
        File webappDir = new File(webappDirLocation);
        if (!webappDir.exists()) {
            webappDirLocation = "src/main/webapp/";
        }
        Context context = tomcat.addWebapp("", new File(webappDirLocation).getAbsolutePath());

        // Khởi động Tomcat trước
        tomcat.start();

        // Tạo Spring context
        AnnotationConfigWebApplicationContext springContext = new AnnotationConfigWebApplicationContext();
        springContext.setServletContext(context.getServletContext());
        springContext.register(WebConfig.class);
        springContext.refresh();

        // Tạo DispatcherServlet
        DispatcherServlet dispatcherServlet = new DispatcherServlet(springContext);

        // Đăng ký servlet
        Tomcat.addServlet(context, "springDispatcher", dispatcherServlet);
        context.addServletMappingDecoded("/", "springDispatcher");

        System.out.println("\n===========================================");
        System.out.println("Server started at:");
        System.out.println("  - http://localhost:8080/add-employee");
        System.out.println("===========================================");
        System.out.println("Spring Form Tags Demo:");
        System.out.println("  - <form:form>: Liên kết form với model");
        System.out.println("  - <form:input>: Ô nhập văn bản");
        System.out.println("  - <form:radiobutton>: Nút chọn tròn");
        System.out.println("  - <form:select>: Hộp chọn (dropdown)");
        System.out.println("  - <form:checkbox>: Ô đánh dấu");
        System.out.println("===========================================\n");
        tomcat.getServer().await();
    }
}
