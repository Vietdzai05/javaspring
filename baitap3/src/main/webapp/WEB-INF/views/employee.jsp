<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thông tin Nhân viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 10px;
        }
        .info-row {
            display: flex;
            padding: 15px;
            border-bottom: 1px solid #eee;
        }
        .info-row:last-child {
            border-bottom: none;
        }
        .label {
            font-weight: bold;
            width: 150px;
            color: #555;
        }
        .value {
            flex: 1;
            color: #333;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Thông tin Nhân viên</h2>

        <div class="info-row">
            <div class="label">Mã nhân viên:</div>
            <div class="value">${employee.id}</div>
        </div>

        <div class="info-row">
            <div class="label">Tên nhân viên:</div>
            <div class="value">${employee.name}</div>
        </div>

        <div class="info-row">
            <div class="label">Lương:</div>
            <div class="value">${employee.salary} VNĐ</div>
        </div>

        <a href="/employee/list" class="back-link">Xem danh sách nhân viên →</a>
    </div>
</body>
</html>
