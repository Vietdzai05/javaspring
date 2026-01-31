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
        String webappDirLocation = "src/main/webapp/";
        Context context = tomcat.addWebapp("", new File(webappDirLocation).getAbsolutePath());

        System.out.println("DEBUG: Webapp path: " + new File(webappDirLocation).getAbsolutePath());
        System.out.println("DEBUG: Context path: " + context.getPath());

        // Khởi động Tomcat trước
        tomcat.start();
        System.out.println("DEBUG: Tomcat started");

        // SAU KHI Tomcat start, mới tạo Spring context
        AnnotationConfigWebApplicationContext springContext = new AnnotationConfigWebApplicationContext();
        springContext.setServletContext(context.getServletContext());
        springContext.register(WebConfig.class);
        springContext.refresh();

        System.out.println("DEBUG: Spring context refreshed");

        // Tạo DispatcherServlet
        DispatcherServlet dispatcherServlet = new DispatcherServlet(springContext);

        // Đăng ký servlet
        Tomcat.addServlet(context, "springDispatcher", dispatcherServlet);
        context.addServletMappingDecoded("/", "springDispatcher");

        System.out.println("DEBUG: Spring DispatcherServlet registered");

        System.out.println("\n===========================================");
        System.out.println("Server started at http://localhost:8080/calculator");
        System.out.println("===========================================\n");
        tomcat.getServer().await();
    }
}
