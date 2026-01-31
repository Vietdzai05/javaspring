<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kết Quả Tính Toán</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 500px;
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
        }
        .result-box {
            background-color: #e8f5e9;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
            text-align: center;
        }
        .error-box {
            background-color: #ffebee;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
            text-align: center;
            color: #c62828;
        }
        .calculation {
            font-size: 24px;
            font-weight: bold;
            color: #2e7d32;
        }
        .back-button {
            display: inline-block;
            padding: 12px 30px;
            background-color: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            margin-top: 20px;
        }
        .back-button:hover {
            background-color: #1976D2;
        }
        .button-container {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Kết Quả Tính Toán</h2>

        <% if ((Boolean) request.getAttribute("error")) { %>
            <div class="error-box">
                <p><strong>Lỗi:</strong> ${errorMessage}</p>
            </div>
        <% } else { %>
            <div class="result-box">
                <p class="calculation">
                    ${a} ${operation} ${b} = ${result}
                </p>
            </div>
        <% } %>

        <div class="button-container">
            <a href="/calculator" class="back-button">Tính toán lại</a>
        </div>
    </div>
</body>
</html>
