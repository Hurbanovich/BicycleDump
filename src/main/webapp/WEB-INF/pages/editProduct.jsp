<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <c:choose>
        <c:when test="${empty product.series}">
            <title>Add</title>
        </c:when>
        <c:otherwise>
            <title>Edit</title>
        </c:otherwise>
    </c:choose>
</head>
<body>
<c:url value="/addProduct" var="addUrl"/>
<c:url value="/editProduct" var="editUrl"/>
<form action="${empty product.series ? addUrl : editUrl}" name="product" method="POST">
    <c:choose>
        <c:when test="${!empty product.series}">
            <p>Edit product</p>
            <input type="hidden" name="id" value="${product.id}">
        </c:when>
        <c:otherwise>
            <p>Add new product</p>
        </c:otherwise>
    </c:choose>
    <p><input type="text" name="series" placeholder="series" value="${product.series}" maxlength="100" required>
    <p><input type="text" name="name" placeholder="name" value="${product.name}" maxlength="100" required>
    <p><input type="text" name="brand" placeholder="brand" value="${product.brand}" maxlength="100" required>
    <p><input type="number" name="price" placeholder="price" value="${product.price}" required>
    <p><input type="number" name="quantity" placeholder="quantity" value="${product.quantity}" required>
    <p><input type="text" name="picture" placeholder="picture" value="${product.picture}" maxlength="20" required>
    <p><input type="text" name="comment" placeholder="comment" value="${product.comment}" maxlength="20" required>
    <p>
        <c:set value="add" var="add"/>
        <c:set value="edit" var="edit"/>
        <input type="submit" value="${empty product.series ? add : edit}">
    </p>
    <p>${message}</p>
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}" />
</form>
</body>
</html>
