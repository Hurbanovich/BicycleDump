<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>store</title>
    <style type="text/css">
        TABLE {
            width: 500px; /* Ширина таблицы */
            border-collapse: collapse; /* Убираем двойные линии между ячейками */
            margin: auto;
        }
        TD, TH {
            padding: 3px; /* Поля вокруг содержимого таблицы */
            border: 1px solid black; /* Параметры рамки */
        }
        TH {
            background: #b0e0e6; /* Цвет фона */
        }
    </style>
</head>
<body>
<table>
    <caption>product</caption>
    <tr>
        <th>№</th>
        <th>ид</th>
        <th>серия</th>
        <th>найменование</th>
        <th>раздел</th>
        <th>производитель</th>
        <th>количество</th>
        <th>действие</th>
    </tr>
    <c:forEach var="prod" items="${productList}" varStatus="i">
        <tr>
            <td>${i.index + 1 + (page - 1) * 10}</td>
            <td>${prod.id}</td>
            <td>${prod.series}</td>
            <td>${prod.name}</td>
            <td>${prod.sections}</td>
            <td>${prod.brand}</td>
            <td>${prod.quantity}</td>
            <td><a href="<c:url value="/editProduct/${prod.id}"/>">edit</a></td>
            <td><a href="<c:url value="/deleteProduct/${prod.id}"/>">delete</a></td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="7">
            <a href="<c:url value="/addProduct"/>">добавить</a>
            <c:forEach begin="${1}" end="${pagesCount}" step="1" varStatus="i">
                <c:url value="/product" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href="${url}">${i.index}</a>
            </c:forEach>
        </td>
    </tr>
</table>
<input type="hidden" name="${_csrf.parameterName}"
       value="${_csrf.token}" />
</body>
</html>