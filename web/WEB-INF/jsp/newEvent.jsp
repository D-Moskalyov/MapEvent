<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

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
        <script type="text/javascript" src="http://momentjs.com/downloads/moment.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/transition.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/collapse.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>


        <div class="container">
            <div class="block">

                <%--<form:form modelAttribute="diningForm">--%>
                    <%--<form:input path="firstName"/>--%>
                    <%--<form:errors path="firstName"/>--%>
                    <%--…--%>
                <%--</form:form>--%>

                <div class="title">
                    <h4>Что:</h4>
                </div>

                <input type="text" id="what" class="form-control">

                <div class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Выберите
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
                </div>
            </div>

            <div class="block map">
                <div class="title">
                    <h4>Где:</h4>
                </div>
                <input id="pac-input" class="controls" placeholder="Начните..." type="text"/>

                <div id="map"></div>
            </div>

            <div class="block">
                <div class="title">
                    <h4>Здесь?</h4>
                </div>
                <p class="address" id="where"></p>
            </div>

            <div class="block">

                <div class="title">
                    <h4>Когда:</h4>
                </div>

                <div class='col-md-3'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker6'>
                            <input type='text' id="whenSt" class="form-control"/>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                        </div>
                    </div>
                </div>

                <h2>-</h2>

                <div class='col-md-3'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker7'>
                            <input type='text' id="whenFin" class="form-control"/>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="block dest">
                <div class="title">
                    <h4>Описание:</h4>
                </div>

                <textarea class="form-control" id="dest" rows="5"></textarea>
                <button type="button" id="complete" class="btn btn-default" onclick="submit()">Готово</button>
            </div>

            <%--<div class="block">--%>
                <%--<button type="button" id="submit" class="btn btn-default">Готово</button>--%>
            <%--</div>--%>
        </div>


        <script type="text/javascript">
            $(function () {
                $('#datetimepicker6').datetimepicker();
                $('#datetimepicker7').datetimepicker({
                    useCurrent: false //Important! See issue #1075
                });
                $("#datetimepicker6").on("dp.change", function (e) {
                    $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
                });
                $("#datetimepicker7").on("dp.change", function (e) {
                    $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
                });

                $("#datetimepicker6").on("dp.error", function (e) {
                    alert(e.data)
                });

                var nowDate = new Date();
                var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(),
                        nowDate.getHours(), nowDate.getMinutes(), 0, 0);

                $('#datetimepicker6').data("DateTimePicker").minDate(today);

                $(".dropdown-menu li a").click(function () {
                    $(this).parents('.dropdown').find('.dropdown-toggle').html($(this).text() + ' <span class="caret"></span>');
                    //$(this).parents('.dropdown').find('.dropdown-toggle').value($(this).text() + ' <span class="caret"></span>');
                });

                //$("#complete").click(submit);

            });

            //            $(document).ready(function () {
            //                var nowDate = new Date();
            //                var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(),
            //                        nowDate.getHours(), nowDate.getMinutes(), 0, 0);
            //
            //                $('#datetimepicker6').data("DateTimePicker").minDate(today);
            //                //$('#datetimepicker7').data("DateTimePicker").minDate(today);
            //            });
        </script>
        <script type="text/javascript">
            var map;
            var service;
            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
//                    current pos
                    center: {lat: -34.397, lng: 150.644},
                    zoom: 10,
                    disableDefaultUI: true,
                    draggableCursor: 'auto'
                });
                service = new google.maps.places.PlacesService(map);

                google.maps.event.addListener(map, 'click', function (event) {
                    console.log(event);
                    var lat = event.latLng.lat();
                    var lng = event.latLng.lng();
                    var pyrmont = {lat: lat, lng: lng};
                    //console.log("Lat=" + lat + "; Lng=" + lng);

                    service.nearbySearch({
                        location: pyrmont,
                        radius: 30,
                        types: ['establishment']
                    }, function (results, status) {
                        if (status === google.maps.places.PlacesServiceStatus.OK) {
                            console.log(results);
                            var place_id = results[0].place_id;
                            service.getDetails({
                                placeId: place_id
                            }, callback);

                            function callback(place, status) {
                                searchPlace(place, status);
                                markerAndBoundsCreate(place);
                            }
                        }
                    });
                });

                var input = document.getElementById('pac-input');
                var searchBox = new google.maps.places.SearchBox(input);
                map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

                map.addListener('bounds_changed', function () {
                    searchBox.setBounds(map.getBounds());
                });
                searchBox.addListener('places_changed', function () {
                    var places = searchBox.getPlaces();

                    if (places.length == 0) {
                        return;
                    }

                    //var bounds = new google.maps.LatLngBounds();

                    var place = places[0];
                    var place_id = place.place_id;
                    service.getDetails({
                        placeId: place_id
                    }, callback);

                    function callback(place, status) {
                        searchPlace(place, status);
                        markerAndBoundsCreate(place);
                    }

                });
            }

        </script>
        <script type="text/javascript">
            function submit() {
                console.log($('#what').get(0).innerText);
                console.log($('#where').get(0).innerText);
                console.log($('#whenSt').get(0).innerText);
                console.log($('#whenFin').get(0).innerText);
                console.log($('#dest').get(0).innerText);
            }
            function searchPlace(place, status) {
                if (status === google.maps.places.PlacesServiceStatus.OK) {
                    console.log(place);

                    var address_components = place.address_components;
                    var address = document.getElementsByClassName('address');
                    var addressTxt = "";
                    var street_number = "";
                    address_components.forEach(function (item) {
                        var types = item.types;
                        types.forEach(function (type) {
                            switch (type) {
                                case 'street_number':
                                    street_number = ", " + item.long_name;
                                    break;
                                case 'route':
                                    addressTxt = item.long_name + street_number + ", ";
                                    break;
                                case 'locality':
                                    addressTxt = addressTxt + item.long_name + ", ";
                                    break;
                                case 'administrative_area_level_1':
                                    addressTxt = addressTxt + item.long_name + ", ";
                                    break;
                                case 'country':
                                    addressTxt = addressTxt + item.long_name;
                                    break;
                                default:
                                    break;
                            }
                        });
                    });
                    console.log(addressTxt);
                    $("p.address").text(addressTxt);
                }
            }
            function markerAndBoundsCreate(place) {
                var markers = [];
                markers.forEach(function (marker) {
                    marker.setMap(null);
                });
                markers = [];
                var icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };

                markers.push(new google.maps.Marker({
                    map: map,
                    icon: icon,
                    title: place.name,
                    position: place.geometry.location
                }));


                var bounds = new google.maps.LatLngBounds();
                if (place.geometry.viewport) {
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }

                map.fitBounds(bounds);
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1Oq4jskDM9UEBBbDzWSioDqzY1R434mk&callback=initMap&libraries=places">
        </script>
        <c:forEach var="script" items="${javascripts}">
            <script src="<c:url value="${script}"/>"></script>
        </c:forEach>
    </tiles:putAttribute>
</tiles:insertDefinition>