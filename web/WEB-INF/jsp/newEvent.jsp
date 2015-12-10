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

        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script type="text/javascript" src="http://momentjs.com/downloads/moment.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/transition.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/collapse.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>


        <div class="container">
            <div class="block">
                <div class="title">
                    <h4>Заголовок:</h4>
                </div>

                <input type="text" class="form-control">
            </div>

            <div class="block map">
                <div class="title">
                    <h4>Место:</h4>
                </div>

                <div id="map"></div>
            </div>

            <div class="block">

                <div class="title">
                    <h4>Начало:</h4>
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
            </div>

            <div class="block">
                <div class="title">
                    <h4>Окончание:</h4>
                </div>

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
        </div>


        <script type="text/javascript">
            $(function () {
                $('#datetimepicker6').datetimepicker({
                    //startDate: date
                    //minDate: 0
//                    Default: false,
//                    Accepts: date
                });
                $('#datetimepicker7').datetimepicker({
                    //startDate: today,
                    useCurrent: false //Important! See issue #1075
                });
                $("#datetimepicker6").on("dp.change", function (e) {
                    $('#datetimepicker7').data("DateTimePicker").minDate(e.date);

//                    $('#datetimepicker6').data("DateTimePicker").minDate(today);
//                    $('#datetimepicker7').data("DateTimePicker").minDate(today);
                });
                $("#datetimepicker7").on("dp.change", function (e) {
                    $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);

//                    $('#datetimepicker6').data("DateTimePicker").minDate(today);
//                    $('#datetimepicker7').data("DateTimePicker").minDate(today);
                });

                $("#datetimepicker6").on("dp.error", function (e) {
                    alert(e.data)
                });
            });
        </script>
        <script type="text/javascript">
            var nowDate = new Date();
            var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(),
                    nowDate.getHours(), nowDate.getMinutes(), 0, 0);
            //
            //            var date = new Date();
            //            date.setDate(date.getDate()-1);
            //
            //            var startDate = new Date();
            //            var fechaFin = new Date();
            //            var FromEndDate = new Date();
            //            var ToEndDate = new Date();

            $('#datetimepicker6').data("DateTimePicker").minDate(today);
            $('#datetimepicker7').data("DateTimePicker").minDate(today);
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