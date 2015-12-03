<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<tiles:importAttribute name="javascripts"/>--%>
<%--<tiles:importAttribute name="stylesheets"/>--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%--<c:forEach var="css" items="${stylesheets}">--%>
            <%--<link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">--%>
        <%--</c:forEach>--%>
    </head>
    <body>
        <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="body"/>
        <tiles:insertAttribute name="footer"/>

        <%--<c:forEach var="script" items="${javascripts}">--%>
            <%--<script src="<c:url value="${script}"/>"></script>--%>
        <%--</c:forEach>--%>
    </body>
</html>
