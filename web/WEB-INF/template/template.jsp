<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%--<tiles:importAttribute name="javascripts"/>--%>
<tiles:importAttribute name="stylesheets"/>

<html>
  <head>
      <%--<title>MapEvent in Action!</title>--%>
      <style type="text/css">
        html, body { height: 100%; margin: 0; padding: 0; }
        /*#map { height: 83%; }*/
      </style>

          <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />--%>
          <%--<c:forEach var="css" items="${stylesheets}">--%>
              <%--<link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">--%>
          <%--</c:forEach>--%>
  </head>
  <body>
    <tiles:insertAttribute name="header" />
    <tiles:insertAttribute name="body" />
    <tiles:insertAttribute name="footer" />
  </body>
</html>
