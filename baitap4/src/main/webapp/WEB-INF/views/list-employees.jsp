<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách Nhân viên - JSTL Demo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
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
            border-bottom: 3px solid #4CAF50;
            padding-bottom: 15px;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th {
            background-color: #4CAF50;
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: bold;
        }
        td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        /* Điều kiện: Tô đỏ nếu lương > 1000$ */
        .high-salary {
            background-color: #ffcccc !important;
            font-weight: bold;
        }
        .high-salary:hover {
            background-color: #ffbbbb !important;
        }
        .salary {
            text-align: right;
            font-weight: bold;
        }
        /* Badge cho xếp loại */
        .badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: bold;
        }
        .badge-good {
            background-color: #4CAF50;
            color: white;
        }
        .badge-fair {
            background-color: #2196F3;
            color: white;
        }
        .note {
            margin-top: 20px;
            padding: 15px;
            background-color: #e7f3ff;
            border-left: 4px solid #2196F3;
            border-radius: 5px;
        }
        .note h4 {
            margin: 0 0 10px 0;
            color: #1976D2;
        }
        .note ul {
            margin: 5px 0;
            padding-left: 20px;
        }
        .note li {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Danh sách Nhân viên (JSTL Demo)</h2>

        <table>
            <thead>
                <tr>
                    <th>Mã NV</th>
                    <th>Tên nhân viên</th>
                    <th>Lương (USD)</th>
                    <th>Xếp loại</th>
                </tr>
            </thead>
            <tbody>
                <%-- Sử dụng c:forEach để duyệt danh sách --%>
                <c:forEach var="emp" items="${employees}">
                    <%-- Sử dụng c:if để tô đỏ dòng có lương > 1000$ --%>
                    <tr <c:if test="${emp.salary > 1000}">class="high-salary"</c:if>>
                        <td>${emp.id}</td>
                        <td>${emp.name}</td>
                        <td class="salary">
                            $<fmt:formatNumber value="${emp.salary}" type="number" groupingUsed="true"/>
                        </td>
                        <td>
                            <%-- Sử dụng c:choose để hiển thị xếp loại --%>
                            <c:choose>
                                <c:when test="${emp.salary > 1000}">
                                    <span class="badge badge-good">Giỏi</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-fair">Khá</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="note">
            <h4>📌 Giải thích JSTL Tags:</h4>
            <ul>
                <li><strong>&lt;c:forEach&gt;</strong>: Duyệt qua danh sách nhân viên và hiển thị từng dòng</li>
                <li><strong>&lt;c:if&gt;</strong>: Nếu lương > 1000$, thêm class "high-salary" để tô đỏ dòng</li>
                <li><strong>&lt;c:choose&gt; / &lt;c:when&gt; / &lt;c:otherwise&gt;</strong>:
                    <ul>
                        <li>Nếu lương > 1000$ → Xếp loại "Giỏi" (màu xanh)</li>
                        <li>Ngược lại → Xếp loại "Khá" (màu xanh dương)</li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>
