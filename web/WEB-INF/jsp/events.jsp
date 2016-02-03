<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<tiles:insertDefinition name="eventsPageTemplate">
    <tiles:putAttribute name="body">

        <%--<tiles:importAttribute name="javascripts"/>--%>
        <%--<tiles:importAttribute name="stylesheets"/>--%>

        <c:forEach var="css" items="${stylesheets}">
            <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
        </c:forEach>

        <title>Events</title>

        <%--<securiry:csrfMetaTags />--%>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/event.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/events.js"></script>

        <div>
            <c:forEach var="event" items="${events}">
                <p>${event.evID}<p>
            </c:forEach>
        </div>


        <c:forEach var="script" items="${javascripts}">
            <script src="<c:url value="${script}"/>"></script>
        </c:forEach>

    </tiles:putAttribute>
</tiles:insertDefinition>