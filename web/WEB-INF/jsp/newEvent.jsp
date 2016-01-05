<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="newEventTemplate">
    <tiles:putAttribute name="body">

        <%--<tiles:importAttribute name="javascripts"/>--%>
        <%--<tiles:importAttribute name="stylesheets"/>--%>

        <c:forEach var="css" items="${stylesheets}">
            <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
        </c:forEach>

        <title>New event</title>

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
                        </div>
                    </div>
                </fieldset>
            </form:form>
        </div>


        <%--<script type="text/javascript">--%>
            <%--$(function () {--%>
                <%--&lt;%&ndash;if("${newEventForm.placeID}" != ""){&ndash;%&gt;--%>
                    <%--&lt;%&ndash;var address_route = "${newEventForm.route}";&ndash;%&gt;--%>
                    <%--&lt;%&ndash;var address_street_number = "${newEventForm.street_number}";&ndash;%&gt;--%>
                    <%--&lt;%&ndash;var address_locality = "${newEventForm.locality}";&ndash;%&gt;--%>
                    <%--&lt;%&ndash;var address_administrative_area_level_1 = "${newEventForm.administrative_area_level_1}";&ndash;%&gt;--%>
                    <%--&lt;%&ndash;var address_country = "${newEventForm.country}";&ndash;%&gt;--%>
                    <%--&lt;%&ndash;var address_string = address_route + ', ' + address_street_number + ', ' +&ndash;%&gt;--%>
                            <%--&lt;%&ndash;address_locality + ', ' + address_administrative_area_level_1 + ', ' + address_country;&ndash;%&gt;--%>
                    <%--&lt;%&ndash;console.log(address_string);&ndash;%&gt;--%>
                    <%--&lt;%&ndash;$("p.address").text(address_string);&ndash;%&gt;--%>
                <%--&lt;%&ndash;}&ndash;%&gt;--%>


                <%--$('#datetimepicker6').datetimepicker({--%>
                    <%--locale: 'ru'--%>
                <%--});--%>
                <%--$('#datetimepicker7').datetimepicker({--%>
                    <%--locale: 'ru',--%>
                    <%--useCurrent: false //Important! See issue #1075--%>
                <%--});--%>
                <%--$("#datetimepicker6").on("dp.change", function (e) {--%>
                    <%--$('#datetimepicker7').data("DateTimePicker").minDate(e.date);--%>
                <%--});--%>
                <%--$("#datetimepicker7").on("dp.change", function (e) {--%>
                    <%--$('#datetimepicker6').data("DateTimePicker").maxDate(e.date);--%>
                <%--});--%>

                <%--$("#datetimepicker6").on("dp.error", function (e) {--%>
                    <%--alert(e.data)--%>
                <%--});--%>

                <%--var nowDate = new Date();--%>
                <%--var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(),--%>
                        <%--nowDate.getHours(), nowDate.getMinutes(), 0, 0);--%>

                <%--$('#datetimepicker6').data("DateTimePicker").minDate(today);--%>
                <%--//console.log($('#categoryID')[0].value);--%>
                <%--if ($('#categoryID')[0].value != "")--%>
                    <%--$('.dropdown-toggle').html($('#categoryID')[0].value + ' <span class="caret"></span>');--%>

                <%--$(".dropdown-menu li a").click(function () {--%>
                    <%--$(this).parents('.dropdown').find('.dropdown-toggle').html($(this).text() + ' <span class="caret"></span>');--%>
                    <%--$('#categoryID')[0].value = $(this).text();--%>
                    <%--$('#buttonTogle').removeClass('error');--%>
                <%--});--%>

                <%--$("input, textarea").focus(function(){--%>
                    <%--$(this).find('.check-group').removeClass('error');//don't work--%>
                <%--});--%>


                <%--var $form = $('#new-event-form');--%>
                <%--$form.bind('submit', function (e) {--%>
                    <%--// Ajax validation--%>
                    <%--var $inputs = $form.find('input,textarea');--%>
                    <%--var data = collectFormData($inputs);--%>
                    <%--$.post('${formJsonUrl}', data, function (response) {--%>
                        <%--$form.find('.check-group').removeClass('error');--%>
                        <%--$('#buttonTogle').removeClass('error');--%>
                        <%--$('#pac-input').removeClass('error');--%>
                        <%--$form.find('.help-inline').empty();--%>
                        <%--$form.find('.alert').remove();--%>

                        <%--if (response.status == 'FAIL') {--%>
                            <%--for (var i = 0; i < response.errorMessageList.length; i++) {--%>
                                <%--var item = response.errorMessageList[i];--%>
                                <%--switch (item.fieldName) {--%>
                                    <%--case 'validDate':--%>
                                        <%--var $whenStart = $('#whenStart');--%>
                                        <%--//console.log($whenStart);--%>
                                        <%--var $whenFinish = $('#whenFinish');--%>
                                        <%--//console.log($whenFinish);--%>
                                        <%--$whenStart.addClass('error');--%>
                                        <%--$whenFinish.addClass('error');--%>
                                        <%--var $validDate = $('#validDate');--%>
                                        <%--$validDate.find('.help-inline').html(item.message);--%>
                                        <%--break;--%>
                                    <%--case 'validAddress':--%>
                                        <%--//console.log($('#pac-input'));--%>
                                        <%--var $pac_input = $('#pac-input');--%>
                                        <%--$pac_input.addClass('error');--%>
                                        <%--var $checkGroup = $('#' + item.fieldName);--%>
                                        <%--$checkGroup.addClass('error');--%>
                                        <%--$checkGroup.find('.help-inline').html(item.message);--%>
                                        <%--break;--%>
                                    <%--case 'category':--%>
                                        <%--//console.log($('.dropdown-toggle')[0]);--%>
                                        <%--$('#buttonTogle').addClass('error');--%>
                                        <%--var $checkGroup = $('#' + item.fieldName);--%>
                                        <%--$checkGroup.addClass('error');--%>
                                        <%--$checkGroup.find('.help-inline').html(item.message);--%>
                                        <%--break;--%>
                                    <%--default:--%>
                                        <%--var $checkGroup = $('#' + item.fieldName);--%>
                                        <%--$checkGroup.addClass('error');--%>
                                        <%--$checkGroup.find('.help-inline').html(item.message);--%>
                                        <%--break;--%>
                                <%--}--%>
                            <%--}--%>
                        <%--} else {--%>
                            <%--$form.unbind('submit');--%>
                            <%--$form.submit();--%>
                        <%--}--%>
                    <%--}, 'json');--%>

                    <%--e.preventDefault();--%>
                    <%--return false;--%>
                <%--});--%>
            <%--});--%>
        <%--</script>--%>
        <%--<script type="text/javascript">--%>
            <%--var map;--%>
            <%--var service;--%>
            <%--function initMap() {--%>
                <%--map = new google.maps.Map(document.getElementById('map'), {--%>
<%--//                    current pos--%>
                    <%--center: {lat: -34.397, lng: 150.644},--%>
                    <%--zoom: 10,--%>
                    <%--disableDefaultUI: true,--%>
                    <%--draggableCursor: 'auto'--%>
                <%--});--%>
                <%--service = new google.maps.places.PlacesService(map);--%>

                <%--if("${newEventForm.placeID}" != ""){--%>
                    <%--//console.log("${newEventForm.placeID}");--%>
                    <%--service.getDetails({--%>
                        <%--placeId: "${newEventForm.placeID}"--%>
                    <%--}, callback);--%>

                    <%--function callback(place, status) {--%>
                        <%--searchPlace(place, status);--%>
                        <%--markerAndBoundsCreate(place);--%>
                    <%--}--%>
                <%--}--%>

                <%--google.maps.event.addListener(map, 'click', function (event) {--%>
                    <%--var lat = event.latLng.lat();--%>
                    <%--var lng = event.latLng.lng();--%>
                    <%--var pyrmont = {lat: lat, lng: lng};--%>

                    <%--service.nearbySearch({--%>
                        <%--location: pyrmont,--%>
                        <%--radius: 30,--%>
                        <%--types: ['establishment']--%>
                    <%--}, function (results, status) {--%>
                        <%--if (status === google.maps.places.PlacesServiceStatus.OK) {--%>
                            <%--//console.log(results);--%>
                            <%--var place_id = results[0].place_id;--%>
                            <%--service.getDetails({--%>
                                <%--placeId: place_id--%>
                            <%--}, callback);--%>

                            <%--function callback(place, status) {--%>
                                <%--if (searchPlace(place, status))--%>
                                    <%--markerAndBoundsCreate(place);--%>
                            <%--}--%>
                        <%--}--%>
                    <%--});--%>
                <%--});--%>

                <%--var input = document.getElementById('pac-input');--%>
                <%--var searchBox = new google.maps.places.SearchBox(input);--%>
                <%--map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);--%>

                <%--map.addListener('bounds_changed', function () {--%>
                    <%--searchBox.setBounds(map.getBounds());--%>
                <%--});--%>
                <%--searchBox.addListener('places_changed', function () {--%>
                    <%--//console.log("places_changed");--%>
                    <%--var places = searchBox.getPlaces();--%>

                    <%--if (places.length == 0) {--%>
                        <%--return;--%>
                    <%--}--%>

                    <%--var place = places[0];--%>
                    <%--var place_id = place.place_id;--%>
                    <%--service.getDetails({--%>
                        <%--placeId: place_id--%>
                    <%--}, callback);--%>

                    <%--function callback(place, status) {--%>
                        <%--searchPlace(place, status);--%>
                        <%--markerAndBoundsCreate(place);--%>
                    <%--}--%>

                <%--});--%>
            <%--}--%>

        <%--</script>--%>
        <%--<script type="text/javascript">--%>
            <%--function collectFormData(fields) {--%>
                <%--var data = {};--%>
                <%--for (var i = 0; i < fields.length; i++) {--%>
                    <%--var $item = $(fields[i]);--%>
                    <%--if (typeof $item.attr('name') !== 'undefined')--%>
                        <%--data[$item.attr('name')] = $item.val();--%>
                <%--}--%>
                <%--return data;--%>
            <%--}--%>
            <%--function searchPlace(place, status) {--%>
                <%--if (status === google.maps.places.PlacesServiceStatus.OK) {--%>
                    <%--//console.log(place);--%>

                    <%--var address_components = place.address_components;--%>
                    <%--var address = document.getElementsByClassName('address');--%>
                    <%--var addressTxt = "";--%>
                    <%--var street_number = "";--%>
                    <%--var control = 0;--%>
                    <%--address_components.forEach(function (item) {--%>
                        <%--var types = item.types;--%>
                        <%--types.forEach(function (type) {--%>
                            <%--switch (type) {--%>
                                <%--case 'street_number':--%>
                                    <%--street_number = ", " + item.long_name;--%>
                                    <%--control++;--%>
                                    <%--//console.log($('#street_numberID')[0]);--%>
                                    <%--$('#street_numberID')[0].value = item.long_name;--%>
                                    <%--break;--%>
                                <%--case 'route':--%>
                                    <%--addressTxt = item.long_name + street_number + ", ";--%>
                                    <%--control++;--%>
                                    <%--$('#routeID')[0].value = item.long_name;--%>
                                    <%--break;--%>
                                <%--case 'locality':--%>
                                    <%--addressTxt = addressTxt + item.long_name + ", ";--%>
                                    <%--control++;--%>
                                    <%--$('#localityID')[0].value = item.long_name;--%>
                                    <%--break;--%>
                                <%--case 'administrative_area_level_1':--%>
                                    <%--addressTxt = addressTxt + item.long_name + ", ";--%>
                                    <%--control++;--%>
                                    <%--$('#administrative_area_level_1ID')[0].value = item.long_name;--%>
                                    <%--break;--%>
                                <%--case 'country':--%>
                                    <%--addressTxt = addressTxt + item.long_name;--%>
                                    <%--control++;--%>
                                    <%--$('#countryID')[0].value = item.long_name;--%>
                                    <%--break;--%>
                                <%--default:--%>
                                    <%--break;--%>
                            <%--}--%>
                        <%--});--%>
                    <%--});--%>
                    <%--//console.log(addressTxt);--%>

                    <%--if (control == 5) {--%>
                        <%--$('#latID')[0].value = place.geometry.location.lat();--%>
                        <%--$('#lngID')[0].value = place.geometry.location.lng();--%>
                        <%--$('#placeIDID')[0].value = place.place_id;--%>
                        <%--$("p.address").text(addressTxt);--%>
                        <%--return true;--%>
                    <%--}--%>
                    <%--return false;--%>
                <%--}--%>
            <%--}--%>
            <%--function markerAndBoundsCreate(place) {--%>
                <%--var markers = [];--%>
                <%--markers.forEach(function (marker) {--%>
                    <%--marker.setMap(null);--%>
                <%--});--%>
                <%--markers = [];--%>
                <%--var icon = {--%>
                    <%--url: place.icon,--%>
                    <%--size: new google.maps.Size(71, 71),--%>
                    <%--origin: new google.maps.Point(0, 0),--%>
                    <%--anchor: new google.maps.Point(17, 34),--%>
                    <%--scaledSize: new google.maps.Size(25, 25)--%>
                <%--};--%>

                <%--markers.push(new google.maps.Marker({--%>
                    <%--map: map,--%>
                    <%--icon: icon,--%>
                    <%--title: place.name,--%>
                    <%--position: place.geometry.location--%>
                <%--}));--%>


                <%--var bounds = new google.maps.LatLngBounds();--%>
                <%--if (place.geometry.viewport) {--%>
                    <%--bounds.union(place.geometry.viewport);--%>
                <%--} else {--%>
                    <%--bounds.extend(place.geometry.location);--%>
                <%--}--%>

                <%--map.fitBounds(bounds);--%>
            <%--}--%>
        <%--</script>--%>
        <script>
            var formJsonUrlFromELtoJS = '${formJsonUrl}';
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