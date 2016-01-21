<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css"/>
<%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>--%>
<%--<html use-expressions='true'>--%>
<div id="head">
    <img src="../../resources/images/logo.png" class="logo" id="logo">
    <div class="right">
        <%--<security:authentication property="principal.username" />--%>
        <%--<security:authentication property="principal.authorities" />--%>

        <%--<c:if test="${pageContext.request.userPrincipal.name != null}">--%>
                <%--Welcome : ${pageContext.request.userPrincipal.name}--%>
        <%--</c:if>--%>
        <security:authorize access="hasRole('ROLE_ANONYMOUS')">
            <button type="button" id="log" class="btn btn-default">Вход</button>
            <button type="button" id="reg"class="btn btn-default">Регистрация</button>
        </security:authorize>
        <security:authorize access="hasRole('ROLE_USER')">
            <button type="button" id="nev"class="btn btn-default">Новое событие</button>
            <button type="button" id="usPage"class="btn btn-default">Профиль</button>
            <button type="button" id="logout"class="btn btn-default">Выход</button>
        </security:authorize>
    </div>
</div>
<%--</html>--%>
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
            <security:authorize access="hasRole('ROLE_USER')">
                console.log("<security:authentication property='principal.username'/>");
                window.location.href='/user/profile';
            </security:authorize>
        });
        $('#logout').click(function(){
            window.location.href='/user/logout';
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

