<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<tiles:insertDefinition name="mainTemplate">
    <tiles:putAttribute name="body">

        <%--<tiles:importAttribute name="javascripts"/>--%>
        <%--<tiles:importAttribute name="stylesheets"/>--%>

        <c:forEach var="css" items="${stylesheets}">
            <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
        </c:forEach>

        <title>MapEvent in Action!</title>


        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css" />

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main-style.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/checkbox.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/InfoBox.css"/>

        <script type="text/javascript" src="http://momentjs.com/downloads/moment-with-locales.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/map.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/map_datetime-picker.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/map_infoBox-def.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/transition.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/collapse.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>

        <spring:url value="/user/favorite.json" var="favURL"/>

        <div class="container">

            <div id="sidebar">

                <form name="formWithCheck">
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="allChk"/>
                        <label for="allChk">Всё</label>
                    </div>
                    <c:forEach var="category" items="${categories}">
                        <div class="check">
                            <input type="checkbox" class="checkbox" id="${category.catID}"/>
                            <label for="${category.catID}">${category.title}</label>
                        </div>
                    </c:forEach>

                    <div class='col-md-12'>
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker6'>
                                <input type='text' class="form-control"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-12'>
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker7'>
                                <input type='text' class="form-control"/>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="main-content">
                <div class="empty-area"></div>
                <a href="#" data-toggle=".container" id="sidebar-toggle">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </a>
                <div class="content">
                    <div id="map"></div>
                </div>
            </div>

        </div>

        <div class="infobox-wrapper">
            <div id="infobox">
                <div class="row">
                    <div class="col-md-4">
                        <img width="60" height="60" id="img-infobox" src=""/>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-10">
                                <a href="" id="title-infobox"></a>
                            </div>
                            <div class="col-md-2">
                                <img width="30" height="30" id="fav-infobox-on" class="favorite" src=""/>
                                <img width="30" height="30" id="fav-infobox-off" class="favorite" src=""/>
                            </div>
                        </div>
                        <div class="row">
                            <div id="category-infobox"></div>
                        </div>
                        <div class="row">
                            <div id="date-start-infobox"></div>
                        </div>
                        <div class="row">
                            <div id="date-finish-infobox"></div>
                        </div>
                        <div class="row">
                            <div id="owner-infobox"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <c:forEach var="script" items="${javascripts}">
            <script src="<c:url value="${script}"/>"></script>
        </c:forEach>

        <script>
            var pageContext = '${pageContext.request.contextPath}';
            var favURLFromELtoJS = '${favURL}';
        </script>

        <script type="text/javascript">
            var map;
            var timeOutToFetchMarker;
            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: -34.397, lng: 150.644},
                    zoom: 11,
                    disableDefaultUI: true
                });

                $.getScript("http://google-maps-utility-library-v3.googlecode.com/svn/trunk/infobox/src/infobox.js");

                google.maps.event.addListener(map, 'click', function (event) {
                    if(infoBox != null)
                        infoBox.setVisible(false);
                });

                google.maps.event.addListener(map, 'idle', function() {
                    clearTimeout(timeOutToFetchMarker);
                    if(map.zoom >= 11)
                        timeOutToFetchMarker = setTimeout(fetchMarkersSRV, 1000);
                });

                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function(position) {
                        var pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        };
                        map.setCenter(pos);
                    });
                }

                myInfoBoxOptions = {
                    content: document.getElementById("infobox")
                    ,maxWidth: 0
                    ,boxStyle: {
                        opacity: 0.8
                        ,width: "280px"
                    }
                    ,pixelOffset: new google.maps.Size(-140, 0)
                    ,closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif"
                    ,infoBoxClearance: new google.maps.Size(1, 1)
                    ,pane: "floatPane"
                    ,enableEventPropagation: false
                };
            }

            function handleLocationError(browserHasGeolocation, infoWindow, pos) {
                //infoWindow.setPosition(pos);
                //infoWindow.setContent(browserHasGeolocation ?
                //        'Error: The Geolocation service failed.' :
                //        'Error: Your browser doesn\'t support geolocation.');
            }
        </script><!--map-->



        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1Oq4jskDM9UEBBbDzWSioDqzY1R434mk&callback=initMap&libraries=places">
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>
