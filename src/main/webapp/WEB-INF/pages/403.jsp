<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Access Denied Page</title>
</head>
<body>
<div class="alert-danger">
    <h3>You do not have permission to access this page!</h3>
</div>
<form action="/logout" method="post">
    <input type="submit" class="button red big" value="Sign in as different user" /> <input
        type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</body>
</html>