<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profile.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/profile.js"></script>

        <spring:url value="/user/profile.json" var="formJsonUrlProfile"/>
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="active" id="profileLi"><a href="#home" data-toggle="tab">Profile</a></li>
                <li id="passwordLi"><a href="#profile" data-toggle="tab">Password</a></li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane active in" id="home">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><security:authentication
                                            property="principal.username"/></h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-3 col-lg-3 " align="center"><img alt="User Pic"
                                                                                            src="/resources/images/no-photo.png"
                                                                                            class="img-circle img-responsive">
                                        </div>
                                        <div class=" col-md-9 col-lg-9 ">
                                            <table class="table table-user-information">
                                                <tbody>
                                                <tr>
                                                    <td>Full Name:</td>
                                                    <td><security:authentication property="principal.fullName"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Email</td>
                                                    <td><security:authentication property="principal.email"/></td>
                                                </tr>
                                                <tr>
                                                    <td>Gender</td>
                                                    <td><security:authentication property="principal.gender"/></td>
                                                </tr>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                                    <%--<div class="panel-footer">--%>
                                    <%--<a data-original-title="Broadcast Message" data-toggle="tooltip" type="button"--%>
                                    <%--class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>--%>
                                    <%--<span class="pull-right">--%>
                                    <%--<a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button"--%>
                                    <%--class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>--%>
                                    <%--<a data-original-title="Remove this user" data-toggle="tooltip" type="button"--%>
                                    <%--class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>--%>
                                    <%--</span>--%>
                                    <%--</div>--%>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="password">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><security:authentication
                                            property="principal.username"/></h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class=" col-md-9 col-lg-9 ">
                                            <form id="change-pass-form" class="text-left" method="post">
                                                <div class="change-pass-form-main-message"></div>
                                                <div class="main-login-form">
                                                    <div class="login-group">
                                                        <div class="form-group">
                                                            <%--<label for="change_password" class="sr-only">New password</label>--%>
                                                            <input type="password" class="form-control" id="change_password" name="change_password" placeholder="New password">
                                                        </div>
                                                        <div class="form-group">
                                                            <%--<label for="change_password_confirm" class="sr-only">Confirm Password</label>--%>
                                                            <input type="password" class="form-control" id="change_password_confirm" name="change_password_confirm" placeholder="Confirm Password">
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="login-button"><i class="fa fa-chevron-right"></i></button>
                                                </div>
                                            </form>
                                            <%--<table class="table table-user-information">--%>
                                                <%--<tbody>--%>
                                                <%--<tr>--%>
                                                    <%--<td>New password:</td>--%>
                                                    <%--<td>--%>
                                                        <%--<input type="password" id="pss" class="form-control">--%>
                                                    <%--</td>--%>
                                                <%--</tr>--%>
                                                <%--<tr>--%>
                                                    <%--<td>Confirm password:</td>--%>
                                                    <%--<td>--%>
                                                        <%--<input type="password" id="pssConf" class="form-control">--%>
                                                    <%--</td>--%>
                                                <%--</tr>--%>
                                                <%--<tr>--%>
                                                    <%--<td>--%>
                                                        <%--<button type="submit" id="changePssConf" class="btn btn-primary">--%>
                                                            <%--Change--%>
                                                        <%--</button>--%>
                                                    <%--</td>--%>
                                                <%--</tr>--%>
                                                <%--</tbody>--%>
                                            <%--</table>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
