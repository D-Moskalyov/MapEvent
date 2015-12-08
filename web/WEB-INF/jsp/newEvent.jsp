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

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/new-event.css"/>

        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script type="text/javascript" src="http://momentjs.com/downloads/moment.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/transition.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/collapse.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>


        <div class="container">
            <div class="main-content">
                <div class="content">
                    <div id="map"></div>
                </div>

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
            </div>
        </div>



        <script type="text/javascript">
            $(function () {
                $('#datetimepicker6').datetimepicker({
                    //startDate: today
                });
                $('#datetimepicker7').datetimepicker({
                    //startDate: today,
                    useCurrent: false //Important! See issue #1075
                });
                $("#datetimepicker6").on("dp.change", function (e) {
                    $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
                });
                $("#datetimepicker7").on("dp.change", function (e) {
                    $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
                });
            });
        </script>
        <script type="text/javascript">
//            var nowDate = new Date();
//            var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(),
//                    nowDate.getHours(), nowDate.getMinutes(), 0, 0);
//
//            var startDate = new Date();
//            var fechaFin = new Date();
//            var FromEndDate = new Date();
//            var ToEndDate = new Date();

            var map;
            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: -34.397, lng: 150.644},
                    zoom: 8
                });
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1Oq4jskDM9UEBBbDzWSioDqzY1R434mk&callback=initMap">
        </script>
        <c:forEach var="script" items="${javascripts}">
            <script src="<c:url value="${script}"/>"></script>
        </c:forEach>
    </tiles:putAttribute>
</tiles:insertDefinition>