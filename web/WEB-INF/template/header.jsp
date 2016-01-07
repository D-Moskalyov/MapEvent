<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css"/>
<%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>--%>

<div id="head">
    <img src="../../resources/images/logo.png" class="logo" id="logo">
    <div class="right">
        <button type="button" id="log" class="btn btn-default">Вход</button>
        <button type="button" id="reg"class="btn btn-default">Регистрация</button>
        <button type="button" id="nev"class="btn btn-default">Новое событие</button>
    </div>
</div>

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

