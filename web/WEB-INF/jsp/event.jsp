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

    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <c:if test="${eventWithTags.event.cover == '' || eventWithTags.event.cover == null}">
            <img src="${pageContext.request.contextPath}/resources/images/def_evnt_img.png" id="img-title">
          </c:if>
          <c:if test="${eventWithTags.event.cover != '' && eventWithTags.event.cover != null}}">
            <img id="img-title" src="${eventWithTags.event.cover}">
          </c:if>
        </div>

        <div class="col-md-8">
          <h2 class="row">
            ${eventWithTags.event.title}
          </h2>
          <div class="row" id="category">
            ${eventWithTags.event.category.title}
          </div>
          <div class="row" id="description">
            ${eventWithTags.event.description}
          </div>
          <div class="row" id="date">
            ${eventWithTags.event.start} - ${eventWithTags.event.finish}
          </div>
          <div class="row" id="owner">
            ${eventWithTags.event.user.fullName}
          </div>
        </div>

        <div class="col-md-1" id="fav">
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
        </div>
      </div>

      <div class="row center-block" id="address">
          ${eventWithTags.event.place.addressLine1}, ${eventWithTags.event.place.addressLine2},
          ${eventWithTags.event.place.city}, ${eventWithTags.event.place.country}
        <div id="latlng">
            lat: ${eventWithTags.event.place.lat}, lng: ${eventWithTags.event.place.lng}
        </div>
      </div>
      <div class="row" id="map">
        <img width="600" id="staticMap"/>
      </div>

      <c:if test="${!eventWithTags.event.haveImgs}">

      </c:if>
    </div>

    <c:forEach var="script" items="${javascripts}">
      <script src="<c:url value="${script}"/>"></script>
    </c:forEach>

    <script>
      var userFromELtoJS = '${user}';
      var eventFromELtoJS = '${eventWithTags.event.evID}';
      var favFromELtoJS = '${eventWithTags.favorite}';
      var myEvFromELtoJS = '${eventWithTags.myEvent}';
      var latFromELtoJS = '${eventWithTags.event.place.lat}';
      var lngFromELtoJS = '${eventWithTags.event.place.lng}';
      var favURLFromELtoJS = '${favURL}';
    </script>
  </tiles:putAttribute>
</tiles:insertDefinition>