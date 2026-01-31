# Java Spring Projects

Bộ sưu tập các bài tập Spring Framework.

## Cấu trúc

### baitap1 - Spring Console Application
- Ứng dụng console đơn giản với Spring IoC/DI
- Sử dụng annotation-based configuration
- Demo về GreetingService và HomeController

### baitap2 - Spring MVC Calculator Web Application
- Ứng dụng web calculator với Spring MVC
- Embedded Tomcat server
- JSP views
- Các phép tính: cộng, trừ, nhân, chia
- Xử lý lỗi chia cho 0

## Chạy ứng dụng

### Bài tập 1 (Console App)
```bash
cd baitap1
mvn compile exec:java -Dexec.mainClass="com.example.Main"
```

### Bài tập 2 (Web App)
```bash
cd baitap2
mvn compile exec:java -Dexec.mainClass="com.example.Main"
```
Sau đó truy cập: http://localhost:8080/calculator

## Yêu cầu
- Java 17+
- Maven 3.6+
