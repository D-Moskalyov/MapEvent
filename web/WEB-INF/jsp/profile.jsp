<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="profileTemplate">
  <tiles:putAttribute name="body">

    <%--<tiles:importAttribute name="javascripts"/>--%>
    <%--<tiles:importAttribute name="stylesheets"/>--%>

    <c:forEach var="css" items="${stylesheets}">
      <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
    </c:forEach>

    <title>Profile</title>

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profile.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/profile.js"></script>

    <div class="text-center" style="padding:50px 0">

      <spring:url value="/user/profile.json" var="formJsonUrlProfile"/>


    </div>



    <script>
      var formJsonUrlFromELtoJSProfile = '${formJsonUrlProfile}';
      var pathToRedirectProfile = '${param.path}';
    </script>

    <c:forEach var="script" items="${javascripts}">
      <script src="<c:url value="${script}"/>"></script>
    </c:forEach>

  </tiles:putAttribute>
</tiles:insertDefinition>
