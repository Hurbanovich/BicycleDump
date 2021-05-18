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
<header>

    <a href="${request.contextPath}?lang=en"><spring:message code="language.en"/></a>
    <a href="${request.contextPath}?lang=ru"><spring:message code="language.ru"/></a>
    <div>
        <a href="/" class="logo"><img src="/res/png/logo.png"></a>
        <div class="header-left">
            <sec:authorize access="!isAuthenticated()">
                <button inputmode="input.button"><a href="${request.contextPath}/login" class="link_language"><spring:message code="films.page.login"/></a></button>
                <button inputmode="input.button"><a href="${request.contextPath}/registration" class="link_language"><spring:message code="home.regictration"/></a> </button>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <button inputmode="input.button"><a href="${request.contextPath}/logout" class="link_language"><spring:message code="films.page.logout"/></a></button>
            </sec:authorize>
        </div>
        <nav>
            <ul>
                <li><a class="button5" href="/product"><spring:message code="home.shop"/></a> </li>
                <li><a class="button5" href="/film"><spring:message code="films.page.title"/></a> </li>
                <li><a class="button5" href="/404"><spring:message code="home.users"/></a> </li>
                <li><a class="button5" href="/logout"><spring:message code="films.page.logout"/></a> </li>
            </ul>
        </nav>
    </div>
</header>
<div id="menu">
    <form action="/filter" name="sections" method="GET">
        <label>
            <select name="sections" required="required">
                <option value=""><spring:message code="product.celect.section"/></option>
                <option value="RIM"><spring:message code="product.section.rim"/></option>
                <option value="SPOKES"><spring:message code="product.section.spokes"/></option>
                <option value="NIPPLE"><spring:message code="product.section.nipple"/></option>
                <option value="DROPOUT"><spring:message code="product.section.dropout"/></option>
                <option value="CASSETTE"><spring:message code="product.section.cassette"/></option>
                <option value="RATCHET"><spring:message code="product.section.ratchet"/></option>
                <option value="DERAILLEUR"><spring:message code="product.section.derailleur"/></option>
                <option value="FRONTDERAILLEUR"><spring:message code="product.section.frontderailleur"/></option>
                <option value="CHAIN"><spring:message code="product.section.chain"/></option>
                <option value="BONKI"><spring:message code="product.section.bonki"/></option>
                <option value="CARRIAGE"><spring:message code="product.section.carriage"/></option>
                <option value="CHAINCALMER"><spring:message code="product.section.chaincalmer"/></option>
                <option value="PEDALS"><spring:message code="product.section.pedals"/></option>
                <option value="CONNECTTINGRODS"><spring:message code="product.section.connecttingrods"/></option>
                <option value="FRAME"><spring:message code="product.section.fpame"/></option>
                <option value="CABLE"><spring:message code="product.section.cable"/></option>
                <option value="SHOCKABSORBER"><spring:message code="product.section.chockabsorber"/></option>
                <option value="SEATPIN"><spring:message code="product.section.droperidol"/></option>
                <option value="SADDLE"><spring:message code="product.section.saddle"/></option>
                <option value="MANETTE"><spring:message code="product.section.manette"/></option>
                <option value="GRIPS"><spring:message code="product.section.grips"/></option>
                <option value="BRAKEHENDLE"><spring:message code="product.section.brakehendle"/></option>
                <option value="BARENDA"><spring:message code="product.section.barenda"/></option>
                <option value="HANDLEBAREXTENSION"><spring:message code="product.section.handlebarextension"/></option>
                <option value="HANDLEBAR"><spring:message code="product.section.handlebar"/></option>
                <option value="STEERINGCOLUMN"><spring:message code="product.section.steeringcolumn"/></option>
                <option value="HYDRAULICLINE"><spring:message code="product.section.hydrauline"/></option>
                <option value="ROTOR"><spring:message code="product.section.rotor"/></option>
                <option value="CALIPER"><spring:message code="product.section.caliper"/></option>
                <option value="AXLE"><spring:message code="product.section.axle"/></option>
                <option value="ECCENTRIC"><spring:message code="product.section.eccentric"/></option>
                <option value="BRAKEPADS"><spring:message code="product.section.bracepads"/></option>
                <option value="REPAIRKIT"><spring:message code="product.section.repairkit"/>IRKIT</option>
                <option value="ADAPTERS"><spring:message code="product.section.adapters"/></option>
                <option value="TIRES"><spring:message code="product.section.tires"/></option>
                <option value="FORK"><spring:message code="product.section.fork"/></option>
                <option value="BEARING"><spring:message code="product.section.bearing"/></option>
            </select>
        </label>
        <button><a>Искать</a></button>
    </form>

</div>
<table>
    <caption>product</caption>
    <tr>
        <th>№</th>
        <th>ид</th>
        <th>серия</th>
        <th>найменование</th>
        <th>производитель</th>
        <th>количество</th>
    </tr>
    <c:forEach var="prod" items="${productList}" varStatus="i">
        <tr>
            <td>${i.index + 1 + (page - 1) * 10}</td>
            <td>${prod.id}</td>
            <td>${prod.series}</td>
            <td>${prod.name}</td>
            <td>${prod.brand}</td>
            <td>${prod.quantity}</td>
            <td><a href="<c:url value="/cartprodyct/${prod.id}"/>">просмотр</a></td>
            <td><a href="<c:url value="/cegbnm/${prod.id}"/>">в карзину</a></td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="7">
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
