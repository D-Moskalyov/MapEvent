<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tiles:insertDefinition name="eventsPageTemplate">
    <tiles:putAttribute name="body">

        <%--<tiles:importAttribute name="javascripts"/>--%>
        <%--<tiles:importAttribute name="stylesheets"/>--%>

        <c:forEach var="css" items="${stylesheets}">
            <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
        </c:forEach>

        <jsp:useBean id="date" class="java.util.Date" />

        <title>Events</title>

        <%--<securiry:csrfMetaTags />--%>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/events.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/events.js"></script>

        <spring:url value="/user/favorite.json" var="favURL"/>

        <div class="container">
            <c:forEach var="eventWithTags" items="${eventsWithTags}">

                <c:if test="${date > eventWithTags.event.finish}">
                <div class="row red" class="ev-list-elem" id="ev-list-elem">
                </c:if>
                <c:if test="${date < eventWithTags.event.finish}">
                    <c:if test="${date < eventWithTags.event.start}">
                <div class="row green" class="ev-list-elem" id="ev-list-elem">
                    </c:if>
                    <c:if test="${date > eventWithTags.event.start}">
                <div class="row yellow" class="ev-list-elem" id="ev-list-elem">
                    </c:if>
                </c:if>

                    <div class="col-md-2">
                        <c:if test="${eventWithTags.event.cover == '' || eventWithTags.event.cover == null}">
                            <img src="${pageContext.request.contextPath}/resources/images/def_evnt_img.png" id="img-title">
                        </c:if>
                        <c:if test="${eventWithTags.event.cover != '' && eventWithTags.event.cover != null}}">
                            <img id="img-title" src="${eventWithTags.event.cover}">
                        </c:if>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-12">
                                <h3><a href="/event/${eventWithTags.event.evID}">${eventWithTags.event.title}</a></h3>
                                <div id="category">${eventWithTags.event.category.title}</div>
                                <div id="owner">${eventWithTags.event.user.userName}</div>
                            </div>
                            <div class="col-md-12">
                                <div id="date">${eventWithTags.event.start} - ${eventWithTags.event.finish}</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2" id="${eventWithTags.event.evID}">
                        <c:if test="${eventWithTags.favorite}">
                            <img src="${pageContext.request.contextPath}/resources/images/favoriteOn.ico" class="favorite" id="img-fav-on">
                            <img src="${pageContext.request.contextPath}/resources/images/favoriteOff.png" style="display: none" class="favorite" id="img-fav-off">
                        </c:if>
                        <c:if test="${!eventWithTags.favorite}">
                            <img src="${pageContext.request.contextPath}/resources/images/favoriteOn.ico" style="display: none" class="favorite" id="img-fav-on">
                            <img src="${pageContext.request.contextPath}/resources/images/favoriteOff.png" class="favorite" id="img-fav-off">
                        </c:if>
                        <c:if test="${eventWithTags.myEvent}">
                            <a href="/event/edit/${eventWithTags.event.evID}" id="edit">Редактировать</a>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>


        <c:forEach var="script" items="${javascripts}">
            <script src="<c:url value="${script}"/>"></script>
        </c:forEach>

        <script>
            var userFromELtoJS = '${user}';
            var favURLFromELtoJS = '${favURL}';
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>