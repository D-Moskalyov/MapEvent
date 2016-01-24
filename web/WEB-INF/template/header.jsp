<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="securiry" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false"%>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css"/>
<%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>--%>
<%--<html use-expressions='true'>--%>

<securiry:csrfMetaTags />

<div id="head">
    <img src="../../resources/images/logo.png" class="logo" id="logo">
    <div class="right">
        <%--<security:authentication property="principal.username" />--%>
        <%--<security:authentication property="principal.authorities" />--%>

        <%--<c:if test="${pageContext.request.userPrincipal.name != null}">--%>
                <%--Welcome : ${pageContext.request.userPrincipal.name}--%>
        <%--</c:if>--%>

        <c:url value="/user/logout" var="logoutUrl" />

        <securiry:authorize access="hasRole('ROLE_ANONYMOUS')">
            <button type="button" id="log" class="btn btn-default">Вход</button>
            <button type="button" id="reg"class="btn btn-default">Регистрация</button>
        </securiry:authorize>
        <securiry:authorize access="hasRole('ROLE_USER')">
            <button type="button" id="nev"class="btn btn-default">Новое событие</button>
            <button type="button" id="usPage"class="btn btn-default">Профиль</button>
            <button type="button" id="logout"class="btn btn-default">Выход</button>
            <form id="logoutForm" action="${logoutUrl}" method="post" >
                <input type="hidden" name='${_csrf.parameterName}' value='${_csrf.token}' />
            </form>
        </securiry:authorize>
    </div>
</div>
<%--</html>--%>
<script>
    var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
    var csrfToken = $("meta[name='_csrf']").attr("content");
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#logo').click(function(){
            window.location.href='/map';
        });
        $('#log').click(function(){
            window.location.href='/user/login';
        });
        $('#reg').click(function(){
            window.location.href='/user/registration';
        });
        $('#nev').click(function(){
            window.location.href='/event/newevent';
        });
        $('#usPage').click(function(){
            <securiry:authorize access="hasRole('ROLE_USER')">
                console.log("<securiry:authentication property='principal.username'/>");
                window.location.href='/user/profile';
            </securiry:authorize>
        });
        $('#logout').click(function(){
            console.log($('#logoutForm'));
            $('#logoutForm').submit();
            //window.location.href='/user/logout';
            <%--console.log('${pageContext.request.contextPath}/j_spring_security_logout');--%>
            <%--window.location.href='${pageContext.request.contextPath}/static/j_spring_security_logout';--%>
            //window.location.href='/j_spring_security_logout/';
        });

//        $('#log').click(function() {
//            $.ajax({
//                type: "GET",
//                url: '/user/login',
//                success: function(data){
//                    alert(data);
//                },
//                error: function(){
//                    alert('errorLog');
//                }
//            });
//        });

    });
</script>

