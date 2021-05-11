<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed&subset=latin,cyrillic' rel='stylesheet'>
    <link href="<c:url value="/res/css/stylehome.css"/>" rel="stylesheet">
    <title>Home</title>
</head>
<body>
<form>
    <button class="bottom"><a href="/login">Login</a> </button>
</form>
<form>
    <button class="bottom"><a href="/product">Product</a> </button>
</form>
<form>
    <button class="bottom"><a href="/film">Film</a> </button>
</form>

<form>
    <button class="bottom"><a href="/404">Users</a> </button>
</form>
<form>
    <button class="bottom"><a href="/">Home</a> </button>
</form>
<form>
    <button class="bottom"><a href="/logout">Logout</a> </button>
</form>
<form>
    <button class="bottom"><a href="/registration">registration</a> </button>
</form>
</body>
</html>