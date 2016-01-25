<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<tiles:insertDefinition name="eventPageTemplate">
  <tiles:putAttribute name="body">

    <%--<tiles:importAttribute name="javascripts"/>--%>
    <%--<tiles:importAttribute name="stylesheets"/>--%>

    <c:forEach var="css" items="${stylesheets}">
      <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
    </c:forEach>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/event.css"/>

    <div>${event}</div>

    <c:forEach var="script" items="${javascripts}">
      <script src="<c:url value="${script}"/>"></script>
    </c:forEach>
  </tiles:putAttribute>
</tiles:insertDefinition>