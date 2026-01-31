<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm Nhân Viên</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .radio-group, .checkbox-group {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        .radio-group label, .checkbox-group label {
            display: flex;
            align-items: center;
            font-weight: normal;
            cursor: pointer;
        }
        .radio-group input, .checkbox-group input {
            margin-right: 5px;
            cursor: pointer;
        }
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }
        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
        .required {
            color: red;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>📝 Thêm Nhân Viên Mới</h2>

        <form:form method="POST" action="/submit-employee" modelAttribute="employee">

            <!-- Họ tên -->
            <div class="form-group">
                <label>Họ và tên <span class="required">*</span></label>
                <form:input path="fullName" placeholder="Nhập họ và tên" required="true"/>
            </div>

            <!-- Giới tính -->
            <div class="form-group">
                <label>Giới tính <span class="required">*</span></label>
                <div class="radio-group">
                    <label>
                        <form:radiobutton path="gender" value="Nam" required="true"/>
                        Nam
                    </label>
                    <label>
                        <form:radiobutton path="gender" value="Nữ"/>
                        Nữ
                    </label>
                </div>
            </div>

            <!-- Phòng ban -->
            <div class="form-group">
                <label>Phòng ban <span class="required">*</span></label>
                <form:select path="department" required="true">
                    <form:option value="" label="-- Chọn phòng ban --"/>
                    <form:options items="${departmentOptions}"/>
                </form:select>
            </div>

            <!-- Kỹ năng -->
            <div class="form-group">
                <label>Kỹ năng</label>
                <div class="checkbox-group">
                    <label>
                        <form:checkbox path="skills" value="Java"/>
                        Java
                    </label>
                    <label>
                        <form:checkbox path="skills" value="CSharp"/>
                        C#
                    </label>
                    <label>
                        <form:checkbox path="skills" value="Python"/>
                        Python
                    </label>
                </div>
            </div>

            <button type="submit" class="submit-btn">Gửi thông tin</button>
        </form:form>
    </div>
</body>
</html>
