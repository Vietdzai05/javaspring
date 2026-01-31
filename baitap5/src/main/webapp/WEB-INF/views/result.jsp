<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kết Quả</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .result-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            color: #4CAF50;
        }
        .info-row {
            display: flex;
            padding: 12px 0;
            border-bottom: 1px solid #eee;
        }
        .info-row:last-child {
            border-bottom: none;
        }
        .label {
            font-weight: bold;
            color: #555;
            min-width: 150px;
        }
        .value {
            color: #333;
            flex: 1;
        }
        .skills-list {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        .skill-tag {
            background-color: #e3f2fd;
            color: #1976d2;
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 14px;
        }
        .back-btn {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 30px;
            background-color: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            text-align: center;
        }
        .back-btn:hover {
            background-color: #1976D2;
        }
        .success-icon {
            text-align: center;
            font-size: 48px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="result-container">
        <div class="success-icon">✅</div>
        <h2>Thông Tin Nhân Viên</h2>

        <div class="info-row">
            <div class="label">Họ và tên:</div>
            <div class="value">${employee.fullName}</div>
        </div>

        <div class="info-row">
            <div class="label">Giới tính:</div>
            <div class="value">${employee.gender}</div>
        </div>

        <div class="info-row">
            <div class="label">Phòng ban:</div>
            <div class="value">${employee.department}</div>
        </div>

        <div class="info-row">
            <div class="label">Kỹ năng:</div>
            <div class="value">
                <c:choose>
                    <c:when test="${not empty employee.skills}">
                        <div class="skills-list">
                            <c:forEach var="skill" items="${employee.skills}">
                                <span class="skill-tag">${skill}</span>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <em>Chưa có kỹ năng</em>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div style="text-align: center;">
            <a href="/add-employee" class="back-btn">⬅ Quay lại</a>
        </div>
    </div>
</body>
</html>
