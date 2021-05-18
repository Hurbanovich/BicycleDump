<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <link href="<c:url value="/res/css/stylehome.css"/>" rel="stylesheet">
    <title><spring:message code="home.title"/></title>
</head>
<body>
<header>

    <a href="${request.contextPath}?lang=en"><spring:message code="language.en"/></a>
    <a href="${request.contextPath}?lang=ru"><spring:message code="language.ru"/></a>
    <div>
        <a href="/" class="logo"><img src="/res/png/logo.png"></a>
        <nav>
            <ul>
                <li><sec:authorize access="hasRole('ROLE_ADMIN')">
                    <a class="button5" href="/product"><spring:message code="home.product"/></a></sec:authorize> </li>
                <li><sec:authorize access="hasRole('ROLE_ADMIN')">
                    <a class="button5" href="/users"><spring:message code="home.users"/></a></sec:authorize> </li>
                <li><a class="button5" href="/store"><spring:message code="home.shop"/></a> </li>

                <li><sec:authorize access="isAuthenticated()">
                    <a href="${request.contextPath}/login?logout" class="link_language"><spring:message code="films.page.logout"/></a></sec:authorize> </li>
            </ul>
        </nav>
    </div>
</header>
<div id="menu">

</div>



<footer>
    <nav>
        <ul>
            <li><sec:authorize access="isAuthenticated()">
                <a href="${request.contextPath}/login?logout" class="link_language"><spring:message code="films.page.logout"/></a>
                </sec:authorize>
        </ul>
    </nav>
</footer>

</body>
</html>