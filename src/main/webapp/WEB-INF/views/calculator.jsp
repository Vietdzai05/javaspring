<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Máy Tính Calculator</title>
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
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input[type="number"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Máy Tính Calculator</h2>
        <form action="/calculator/calculate" method="post">
            <div class="form-group">
                <label for="a">Số thứ nhất (a):</label>
                <input type="number" id="a" name="a" step="any" required>
            </div>

            <div class="form-group">
                <label for="b">Số thứ hai (b):</label>
                <input type="number" id="b" name="b" step="any" required>
            </div>

            <div class="form-group">
                <label for="operation">Chọn phép tính:</label>
                <select id="operation" name="operation" required>
                    <option value="">-- Chọn phép tính --</option>
                    <option value="add">Cộng (+)</option>
                    <option value="subtract">Trừ (-)</option>
                    <option value="multiply">Nhân (*)</option>
                    <option value="divide">Chia (/)</option>
                </select>
            </div>

            <button type="submit">Tính toán</button>
        </form>
    </div>
</body>
</html>
