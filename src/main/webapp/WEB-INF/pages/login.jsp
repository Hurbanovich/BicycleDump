<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><spring:message code="rgistration.login"/></title>
    <link href="<c:url value="/res/styleLogin.css"/>" rel="stylesheet" type="text/css"/>
    <link rel="icon" type="image/x-icon">
    <link rel="shortcut icon" type="image/x-icon">
</head>
<body>
<a href="${request.contextPath}?lang=en"><spring:message code="language.en"/></a>
<a href="${request.contextPath}?lang=ru"><spring:message code="language.ru"/></a>
<div class="clr"></div>
<form method="post" action="" class="login">
    <p>
        <label for="login"><spring:message code="rgistration.login"/>:</label>
        <input type="text" name="username" placeholder="User Name" id="login">
    </p>

    <p>
        <label for="password"><spring:message code="registration.password"/>:</label>
        <input type="password" name="password" placeholder="Password" id="password">
    </p>

    <p class="forgot-password"><a href="/registration"><spring:message code="registration.registration"/></a></p>

    <p class="login-submit">
        <button type="submit" class="login-button"><spring:message code="registration.enter"/></button>
    </p>
    <c:if test="${param.error ne null}">
        <div class="alert-danger">Invalid username and password.</div>
    </c:if>
    <c:if test="${param.logout ne null}">
        <div class="alert-normal">You have been logged out.</div>
    </c:if>
    <input type="hidden" name="${_csrf.parameterName}"
           value="${_csrf.token}" />
</form>

</body>
</html>