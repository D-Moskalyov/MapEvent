<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="mainTemplate">
    <tiles:putAttribute name="body">

        <%--<tiles:importAttribute name="javascripts"/>--%>
        <%--<tiles:importAttribute name="stylesheets"/>--%>

        <c:forEach var="css" items="${stylesheets}">
            <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
        </c:forEach>

        <title>MapEvent in Action!</title>


        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css" />
        <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">--%>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main-style.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/checkbox.css"/>

        <%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>--%>
        <%--<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>--%>
        <script type="text/javascript" src="http://momentjs.com/downloads/moment.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/transition.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/collapse.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>


        <div class="container">

            <div id="sidebar">

                <form>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="allChk"/>
                        <label for="allChk">Всё</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="businessChk"/>
                        <label for="businessChk">Бизнес</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="cinemaChk"/>
                        <label for="cinemaChk">Кино</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="concertChk"/>
                        <label for="concertChk">Концерт</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="dancingChk"/>
                        <label for="dancingChk">Танцы</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="exhibitionsChk"/>
                        <label for="exhibitionsChk">Выставки</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="gamesChk"/>
                        <label for="gamesChk">Игры</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="festivalsChk"/>
                        <label for="festivalsChk">Фестивали</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="meetingChk"/>
                        <label for="meetingChk">Встречи</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="theatreChk"/>
                        <label for="theatreChk">Театр</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="sportChk"/>
                        <label for="sportChk">Спорт</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="questChk"/>
                        <label for="questChk">Квесты</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="charityChk"/>
                        <label for="charityChk">Благотворительность</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="comedyChk"/>
                        <label for="comedyChk">Comedy</label>
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


        <c:forEach var="script" items="${javascripts}">
            <script src="<c:url value="${script}"/>"></script>
        </c:forEach>

        <script type="text/javascript">
            var map;
            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: -34.397, lng: 150.644},
                    zoom: 10,
                    disableDefaultUI: true
                });
            }
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("[data-toggle]").click(function () {
                    var toggle_el = $(this).data("toggle");

              //var myClass = $(toggle_el).attr("class");
              //alert(myClass);

//              var checked = document.forms[0];
//              var txt = "";
//              var i;
//              for (i = 0; i < checked.length; i++) {
//                if (checked[i].checked) {
//                  txt = txt + checked[i].id + " ";
//                }
//              }
//              alert(txt);


                    $(toggle_el).toggleClass("open-sidebar");
                });

                $('#allChk').change(function(){
                    var checked = document.forms[0];
                    if(this.checked){
                        for (var i = 0; i < checked.length; i++)
                            checked[i].checked = true;
                    }
                    else{
                        for (var i = 0; i < checked.length; i++)
                            checked[i].checked = false;
                    }
                });
            });
        </script>

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
            });
        </script>


        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1Oq4jskDM9UEBBbDzWSioDqzY1R434mk&callback=initMap&libraries=places">
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>
