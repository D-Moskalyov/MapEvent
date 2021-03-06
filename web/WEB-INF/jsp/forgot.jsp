<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="securiry" uri="http://www.springframework.org/security/tags" %>

<tiles:insertDefinition name="loginTemplate">
    <tiles:putAttribute name="body">

        <%--<tiles:importAttribute name="javascripts"/>--%>
        <%--<tiles:importAttribute name="stylesheets"/>--%>

        <c:forEach var="css" items="${stylesheets}">
            <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
        </c:forEach>

        <title>Forgot</title>

        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

        <securiry:csrfMetaTags />

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login-reg.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login-reg.js"></script>

        <div class="text-center" style="padding:50px 0">

            <spring:url value="/user/forgot.json" var="formJsonUrlForg"/>

            <div class="logo">forgot password</div>
            <!-- Main Form -->
            <div class="login-form-1">
                <form id="forgot-password-form" class="text-left" method="post">
                    <div class="etc-login-form">
                        <p>When you fill in your registered email address, you will be sent instructions on how to reset your password.</p>
                    </div>
                    <div class="login-form-main-message"></div>
                    <div class="main-login-form">
                        <div class="login-group">
                            <div class="form-group">
                                <label for="fp_email" class="sr-only">Email address</label>
                                <input type="text" class="form-control" id="fp_email" name="fp_email" placeholder="email address">
                            </div>
                        </div>
                        <button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
                    </div>
                    <div class="etc-login-form">
                        <p>already have an account? <a href="/user/login">login here</a></p>
                        <p>new user? <a href="/user/registration">create new account</a></p>
                    </div>
                </form>
            </div>
            <!-- end:Main Form -->
        </div>

        <script>
            var formJsonUrlFromELtoJSForg = '${formJsonUrlForg}';
            var pathToRedirectForg = '${param.path}';

//            var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
//            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
//            var csrfToken = $("meta[name='_csrf']").attr("content");
        </script>

        <c:forEach var="script" items="${javascripts}">
            <script src="<c:url value="${script}"/>"></script>
        </c:forEach>

    </tiles:putAttribute>
</tiles:insertDefinition>