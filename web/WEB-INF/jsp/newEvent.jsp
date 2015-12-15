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
            <%--<form>--%>
                <div class="block">
                    <div class="title">
                        <h4>Что:</h4>
                    </div>

                    <input type="text" class="form-control">
                </div>

                <div class="block map">
                    <div class="title">
                        <h4>Где:</h4>
                    </div>
                    <input id="pac-input" class="controls" placeholder = "Начните..." type="text" />

                    <div id="map"></div>
                </div>

                <div class="block">
                    <div class="title">
                        <h4>Здесь?</h4>
                    </div>
                    <p>sssss</p>
                </div>

                <div class="block">

                    <div class="title">
                        <h4>Когда:</h4>
                    </div>

                    <div class='col-md-3'>
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker6'>
                                <input type='text' class="form-control"/>
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
                                <input type='text' class="form-control"/>
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

                    <textarea class="form-control" rows="5"></textarea>
                </div>
            <%--</form>--%>
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
            });
        </script>
        <script type="text/javascript">
            var map;
            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
//                    current pos
                    center: {lat: -34.397, lng: 150.644},
                    zoom: 10,
                    disableDefaultUI: true,
                    draggableCursor:'auto'
                });
//
//                var styles = [
//                    {
//                        featureType: "transit",
//                        stylers: [
//                            {visibility: "off"}
//                        ]
//                    }
//                ];
//                var styledMap = new google.maps.StyledMapType(styles,
//                        {name: "Styled Map"});
//                map.mapTypes.set('map_style', styledMap);
//                map.setMapTypeId('map_style');
//
//                map.setOptions({styles: styles});

//                this.getPanes().overlayMouseTarget.appendChild(map);
//                var me = this;
//                map.event.addDomListener(div, 'click', function() {
//                    google.maps.event.trigger(me, 'click');
//                });

                var input = document.getElementById('pac-input');
                var searchBox = new google.maps.places.SearchBox(input);
                map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

                map.addListener('bounds_changed', function() {
                    searchBox.setBounds(map.getBounds());
                });

                var markers = [];
                searchBox.addListener('places_changed', function() {
                    var places = searchBox.getPlaces();

                    if (places.length == 0) {
                        return;
                    }

                    markers.forEach(function(marker) {
                        marker.setMap(null);
                    });
                    markers = [];

                    var bounds = new google.maps.LatLngBounds();
                    places.forEach(function(place) {
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

                        if (place.geometry.viewport) {
                            bounds.union(place.geometry.viewport);
                        } else {
                            bounds.extend(place.geometry.location);
                        }
                    });
                    map.fitBounds(bounds);
                });

                google.maps.event.addListener(map, 'click', function(event) {
                    console.log(event);
                    var lat = event.latLng.lat();
                    var lng = event.latLng.lng();
                    // populate yor box/field with lat, lng
                    console.log("Lat=" + lat + "; Lng=" + lng);
                });

            }

        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                var nowDate = new Date();
                var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(),
                        nowDate.getHours(), nowDate.getMinutes(), 0, 0);

                $('#datetimepicker6').data("DateTimePicker").minDate(today);
                //$('#datetimepicker7').data("DateTimePicker").minDate(today);
            });
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1Oq4jskDM9UEBBbDzWSioDqzY1R434mk&callback=initMap&libraries=places">
        </script>
        <c:forEach var="script" items="${javascripts}">
            <script src="<c:url value="${script}"/>"></script>
        </c:forEach>
    </tiles:putAttribute>
</tiles:insertDefinition>