<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<tiles:insertDefinition name="eventsPageTemplate">
    <tiles:putAttribute name="body">

        <%--<tiles:importAttribute name="javascripts"/>--%>
        <%--<tiles:importAttribute name="stylesheets"/>--%>

        <c:forEach var="css" items="${stylesheets}">
            <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
        </c:forEach>

        <title>Events</title>

        <%--<securiry:csrfMetaTags />--%>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/events.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/events.js"></script>

        <div>
            <c:forEach var="events" items="${eventsWithTags}">
                <p>${events.event.evID}<p>
            </c:forEach>
        </div>

        <div class="row" class="ev-list-elem" id="ev-list-elem">
            <div class="col-md-2">
                <img src="" id="img-title">
            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-12">
                        <h3>Title</h3>
                        <div id="cat">Category</div>
                    </div>
                    <div class="col-md-12">
                        <p>aboutaboutaboutaboutaboutabout aboutaboutabout</p>
                    </div>
                    <div class="col-md-12">
                        <div id="time">Time</div>
                    </div>
                </div>
            </div>
        </div>


        <c:forEach var="script" items="${javascripts}">
            <script src="<c:url value="${script}"/>"></script>
        </c:forEach>

    </tiles:putAttribute>
</tiles:insertDefinition>