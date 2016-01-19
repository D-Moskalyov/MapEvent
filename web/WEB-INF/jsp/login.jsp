<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="loginTemplate">
    <tiles:putAttribute name="body">

        <%--<tiles:importAttribute name="javascripts"/>--%>
        <%--<tiles:importAttribute name="stylesheets"/>--%>

        <c:forEach var="css" items="${stylesheets}">
            <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
        </c:forEach>

        <title>Login</title>

        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login-reg.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login-reg.js"></script>

        <div class="text-center" style="padding:50px 0">

            <spring:url value="/user/login.json" var="formJsonUrlLog"/>

            <div class="logo">login</div>
            <!-- Main Form -->
            <div class="login-form-1">
                <%--<form:errors path="Ajax not available"/>--%>
                <form id="login-form" class="text-left" method="post">
                    <div class="login-form-main-message"></div>
                    <div class="main-login-form">
                        <div class="login-group">
                            <div class="form-group">
                                <label for="lg_username" class="sr-only">Username</label>
                                <input type="text" class="form-control" id="lg_username" name="lg_username" placeholder="username">
                            </div>
                            <div class="form-group">
                                <label for="lg_password" class="sr-only">Password</label>
                                <input type="password" class="form-control" id="lg_password" name="lg_password" placeholder="password">
                            </div>
                            <div class="form-group login-group-checkbox">
                                <input type="checkbox" id="lg_remember" name="lg_remember">
                                <label for="lg_remember">remember</label>
                            </div>
                        </div>
                        <button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
                    </div>
                    <div class="etc-login-form">
                        <p>forgot your password? <a href="/user/forgot">click here</a></p>
                        <p>new user? <a href="/user/registration">create new account</a></p>
                    </div>
                </form>
            </div>
            <!-- end:Main Form -->
        </div>
        <%--<csrf disabled="true"/>--%>
        <script>
            var formJsonUrlFromELtoJSLog = '${formJsonUrlLog}';
            var pathToRedirectLog = '${param.path}';
        </script>

        <c:forEach var="script" items="${javascripts}">
            <script src="<c:url value="${script}"/>"></script>
        </c:forEach>

    </tiles:putAttribute>
</tiles:insertDefinition>
