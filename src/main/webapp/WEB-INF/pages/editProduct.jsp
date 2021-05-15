<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <c:choose>
        <c:when test="${empty product.series}">
            <title><spring:message code="films.action.add"/></title>
        </c:when>
        <c:otherwise>
            <title><spring:message code="films.action.edit"/></title>
        </c:otherwise>
    </c:choose>
</head>
<body>
<a href="${request.contextPath}?lang=en"><spring:message code="language.en"/></a>
<a href="${request.contextPath}?lang=ru"><spring:message code="language.ru"/></a>
<c:url value="/addProduct" var="addUrl"/>
<c:url value="/editProduct" var="editUrl"/>
<form action="${empty product.series ? addUrl : editUrl}" name="product" method="POST">
    <c:choose>
        <c:when test="${!empty product.series}">
            <p><spring:message code="films.page.edit"/></p>
            <input type="hidden" name="id" value="${product.id}">
        </c:when>
        <c:otherwise>
            <p><spring:message code="product.add"/></p>
        </c:otherwise>
    </c:choose>
    <p><sec:authorize access="hasRole('ROLE_ADMIN')">
    <input type="text" name="series" placeholder="series" value="${product.series}" maxlength="100" required>
        </sec:authorize>
    <p><sec:authorize access="hasRole('ROLE_ADMIN')">
    <input type="text" name="name" placeholder="name" value="${product.name}" maxlength="100" required>
    </sec:authorize>
    <p><sec:authorize access="hasRole('ROLE_ADMIN')">
    <input type="text" name="brand" placeholder="brand" value="${product.brand}" maxlength="100" required>
    </sec:authorize>
    <p><sec:authorize access="hasRole('ROLE_ADMIN')">
    <input type="number" name="price" placeholder="price" value="${product.price}" required>
    </sec:authorize>
    <p><sec:authorize access="hasRole('ROLE_ADMIN')">
    <input type="number" name="quantity" placeholder="quantity" value="${product.quantity}" required>
    </sec:authorize>
    <p><sec:authorize access="hasRole('ROLE_ADMIN')">
    <input type="text" name="picture" placeholder="picture" value="${product.picture}" maxlength="20" required>
    </sec:authorize>
    <p><input type="text" name="comment" placeholder="comment" value="${product.comment}" maxlength="20" required>
    <p><sec:authorize access="hasRole('ROLE_ADMIN')">
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
    <option value="REPAIRKIT"><spring:message code="product.section.repairkit"/></option>
    <option value="ADAPTERS"><spring:message code="product.section.adapters"/></option>
    <option value="TIRES"><spring:message code="product.section.tires"/></option>
    <option value="FORK"><spring:message code="product.section.fork"/></option>
    <option value="BEARING"><spring:message code="product.section.bearing"/></option>
</select>
</sec:authorize>

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
