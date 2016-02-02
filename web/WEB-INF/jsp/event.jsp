<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<tiles:insertDefinition name="eventPageTemplate">
  <tiles:putAttribute name="body">

    <%--<tiles:importAttribute name="javascripts"/>--%>
    <%--<tiles:importAttribute name="stylesheets"/>--%>

    <c:forEach var="css" items="${stylesheets}">
      <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
    </c:forEach>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myEvent.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/event.js"></script>

    <c:if test="${event.uID == user}">
      <p>yes<p>
    </c:if>

    <spring:url value="/user/favorite.json" var="favURL"/>

    <div id="favNo" class="favorite">favNo</div>
    <div id="favYes" style="display: none" visible = true class="favorite">favYes</div>

    <c:forEach var="script" items="${javascripts}">
      <script src="<c:url value="${script}"/>"></script>
    </c:forEach>

    <script>
      var userFromELtoJS = '${user}';
      var eventFromELtoJS = '${event.evID}';
      var favURLFromELtoJS = '${favURL}';
    </script>
  </tiles:putAttribute>
</tiles:insertDefinition>