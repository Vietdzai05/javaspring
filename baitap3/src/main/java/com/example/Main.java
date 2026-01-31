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
        String webappDirLocation = "baitap3/src/main/webapp/";
        File webappDir = new File(webappDirLocation);
        if (!webappDir.exists()) {
            webappDirLocation = "src/main/webapp/"; // Fallback nếu chạy từ baitap3 folder
        }
        Context context = tomcat.addWebapp("", new File(webappDirLocation).getAbsolutePath());

        // Khởi động Tomcat trước
        tomcat.start();

        // SAU KHI Tomcat start, mới tạo Spring context
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
        System.out.println("  - http://localhost:8080/employee (1 nhân viên)");
        System.out.println("  - http://localhost:8080/employee/list (danh sách)");
        System.out.println("===========================================\n");
        tomcat.getServer().await();
    }
}
