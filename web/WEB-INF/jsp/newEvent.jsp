<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<tiles:insertDefinition name="newEventTemplate">
    <tiles:putAttribute name="body">

        <%--<tiles:importAttribute name="javascripts"/>--%>
        <%--<tiles:importAttribute name="stylesheets"/>--%>

        <c:forEach var="css" items="${stylesheets}">
            <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
        </c:forEach>

        <title>New myEvent</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/new-event.css"/>

        <%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>--%>
        <script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/transition.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/collapse.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/new-event.js"></script>


        <div class="container">
            <spring:url value="/event/newevent" var="formUrl"/>
            <spring:url value="/event/newevent.json" var="formJsonUrl"/>

            <form:form modelAttribute="newEventForm" class="form-horizontal" action="${formUrl}" method="post"
                       id="new-event-form" accept-charset="UTF-8">
                <fieldset>
                    <div class="block">
                        <div class="title">
                            <h4>Что:</h4>
                        </div>
                        <div class="contentForm">
                            <div class="check-group" class="controls" class="control-group" id="validTitle">
                                <form:input type="text" path="what" class="form-control"/>
                                <span class="help-inline"><form:errors path="validTitle"/></span>
                            </div>
                        </div>
                    </div>
                    <div class="block">
                        <div class="title">
                            <h4/>
                        </div>
                        <div class="contentForm">
                            <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" id="buttonTogle" type="button" data-toggle="dropdown">
                                    Выберите
                                    категорию
                                    <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Бизнес</a></li>
                                    <li><a href="#">Кино</a></li>
                                    <li><a href="#">Концерты</a></li>
                                    <li><a href="#">Танцы</a></li>
                                    <li><a href="#">Выставки</a></li>
                                    <li><a href="#">Игры</a></li>
                                    <li><a href="#">Фестивали</a></li>
                                    <li><a href="#">Театр</a></li>
                                    <li><a href="#">Спорт</a></li>
                                    <li><a href="#">Квесты</a></li>
                                    <li><a href="#">Благотворительность</a></li>
                                    <li><a href="#">Встречи</a></li>
                                    <li><a href="#">Comedy</a></li>
                                </ul>
                                <div class="check-group" id="category">
                                    <form:input type="hidden" path="category" id="categoryID"/>
                                    <span class="help-inline"><form:errors path="category"/></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="block map">
                        <div class="title">
                            <h4>Где:</h4>
                        </div>
                        <div class="contentForm">
                            <input id="pac-input" class="controls" placeholder="Начните..." type="text"/>

                            <div id="map" style="width: 100%; height: 300px"></div>
                        </div>

                    </div>

                    <div class="block">
                        <div class="title">
                            <h4>Здесь?</h4>
                        </div>
                        <div class="contentForm">
                            <p class="address" id="where"></p>

                            <div class="check-group" id="validAddress">
                                <form:input type="hidden" path="street_number" id="street_numberID"/>
                                <form:input type="hidden" path="route" id="routeID"/>
                                <form:input type="hidden" path="locality" id="localityID"/>
                                <form:input type="hidden" path="administrative_area_level_1"
                                            id="administrative_area_level_1ID"/>
                                <form:input type="hidden" path="country" id="countryID"/>
                                <form:input type="hidden" path="lat" id="latID"/>
                                <form:input type="hidden" path="lng" id="lngID"/>
                                <form:input type="hidden" path="placeID" id="placeIDID"/>
                                <span class="help-inline"><form:errors path="validAddress"/></span>
                            </div>
                        </div>
                    </div>

                    <div class="block">
                        <div class="title">
                            <h5>Когда:</h5>
                        </div>
                    </div>
                    <div class="block">
                        <div class="title">
                            <h4>Начало:</h4>
                        </div>
                        <div class="contentForm">
                            <div class='col-md-3'>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker6'>
                                        <div class="check-group" id="whenStart">
                                            <form:input path="whenStart" type='text' class="form-control"/>
                                        </div>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="block">
                        <div class="title">
                            <h4>Окончание:</h4>
                        </div>
                        <div class="contentForm">
                            <div class='col-md-3'>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker7'>
                                        <div class="check-group" id="whenFinish">
                                            <form:input path="whenFinish" type='text' class="form-control"/>
                                        </div>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <div class="check-group" id="validDate">
                                    <span class="help-inline"><form:errors path="validDate"/></span>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="block dest">
                        <div class="title">
                            <h4>Описание:</h4>
                        </div>
                        <div class="contentForm">
                            <div class="check-group" id="validDest">
                                <form:textarea path="description" id="textArea" class="form-control" rows="5"/>
                                <span class="help-inline"><form:errors path="validDest"/></span>
                            </div>
                        </div>
                    </div>

                    <div class="block form-actions">
                        <div class="title">
                            <h4/>
                        </div>
                        <div class="contentForm">
                            <button type="submit" class="btn btn-primary">Готово</button>
                            <c:if test="${newEventForm.edit}">
                                <button id="deleteBtn" type="button" class="btn btn-primary">Удалить</button>
                            </c:if>
                        </div>
                    </div>
                </fieldset>
            </form:form>
        </div>

        <script>
            var whenStartFromELtoJS = '${newEventForm.whenStart}';
            var evIDFromELtoJS = '${newEventForm.id}';
            var whenFinishFromELtoJS = '${newEventForm.whenFinish}';
            var isEditFromELtoJS = '${newEventForm.edit}';
            var formJsonUrlFromELtoJS = '${formJsonUrl}';
            //var deleteJsonUrl = '${formJsonUrl}';
            var placeIDFromELtoJS = '${newEventForm.placeID}';
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1Oq4jskDM9UEBBbDzWSioDqzY1R434mk&callback=initMap&libraries=places">
        </script>
        <c:forEach var="script" items="${javascripts}">
            <script src="<c:url value="${script}"/>"></script>
        </c:forEach>
    </tiles:putAttribute>
</tiles:insertDefinition>