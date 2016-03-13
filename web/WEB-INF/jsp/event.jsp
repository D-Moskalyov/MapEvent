<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<tiles:insertDefinition name="eventPageTemplate">
  <tiles:putAttribute name="body">

    <%--<tiles:importAttribute name="javascripts"/>--%>
    <%--<tiles:importAttribute name="stylesheets"/>--%>

    <c:forEach var="css" items="${stylesheets}">
      <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
    </c:forEach>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/event.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/event.js"></script>

    <spring:url value="/user/favorite.json" var="favURL"/>

    <c:if test="${user != 0}">
      <c:if test="${eventWithTags.favorite}">
        <img src="${pageContext.request.contextPath}/resources/images/favoriteOn.ico" class="favorite" id="img-fav-on">
        <img src="${pageContext.request.contextPath}/resources/images/favoriteOff.png" style="display: none" visible = true class="favorite" id="img-fav-off">
      </c:if>
      <c:if test="${!eventWithTags.favorite}">
        <img src="${pageContext.request.contextPath}/resources/images/favoriteOn.ico" style="display: none" visible = true class="favorite" id="img-fav-on">
        <img src="${pageContextrequest.contextPath}/resources/images/favoriteOff.png" class="favorite" id="img-fav-off">
      </c:if>
      <c:if test="${eventWithTags.myEvent}">
        <a href="/event/edit/${eventWithTags.event.evID}">Редактировать</a>
      </c:if>
    </c:if>

    <div class="container">
      <div>
        <c:if test="${!eventWithTags.event.haveImgs}">
          <img src="${pageContext.request.contextPath}/resources/images/def_evnt_img.png" id="img-title">
        </c:if>
        <c:if test="${eventWithTags.event.haveImgs}">
          <img id="img-title">
        </c:if>
      </div>
      <h2>
          ${eventWithTags.event.title}
      </h2>
      <div>
          ${eventWithTags.event.category.title}
      </div>
      <div>
          ${eventWithTags.event.discription}
      </div>
      <div>
          ${eventWithTags.event.start} - ${eventWithTags.event.finish}
      </div>
      <div>
          ${eventWithTags.event.user.fullName}
      </div>
      <div>
          ${eventWithTags.event.place.city} : ${eventWithTags.event.place.addressLine1}
      </div>
    </div>

    <c:forEach var="script" items="${javascripts}">
      <script src="<c:url value="${script}"/>"></script>
    </c:forEach>

    <script>
      var userFromELtoJS = '${user}';
      var eventFromELtoJS = '${eventWithTags.event.evID}';
      var favFromELtoJS = '${eventWithTags.favorite}';
      var myEvFromELtoJS = '${eventWithTags.myEvent}';
      var favURLFromELtoJS = '${favURL}';
    </script>
  </tiles:putAttribute>
</tiles:insertDefinition>