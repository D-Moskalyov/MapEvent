<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="mainTemplate">
  <tiles:putAttribute name="body">

    <title>MapEvent in Action!</title>
        <style type="text/css">
          .container {
            position: relative;
            height: 88%;
            width: 100%;
            left: 0;
            -webkit-transition:  left 0.4s ease-in-out;
            -moz-transition:  left 0.4s ease-in-out;
            -ms-transition:  left 0.4s ease-in-out;
            -o-transition:  left 0.4s ease-in-out;
            transition:  left 0.4s ease-in-out;
          }
          .container.open-sidebar {
            left: 240px;
          }
          .empty-area {
            position: absolute;
            width: 50px;
            left: 0;
            top: 0;
            height: 100%;
            background: #f3f3f3;
            z-index: 0;
          }
          #sidebar {
            background: #DF314D;
            position: absolute;
            width: 240px;
            height: 100%;
            left: -240px;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
          }
          .main-content {
            width: 100%;
            height: 100%;
            display: block;
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            position: relative;
          }
          .main-content .content{
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            display: block;
            width: 100%;
            height: 100%;
          }
          .main-content .content #map{
            height: 100%;
          }
          /*.content.open-sidebar {
            position: absolute;
            left: -240px;
          }*/
          .main-content #sidebar-toggle {
            background: #DF314D;
            /*border-radius: 3px;*/
            display: block;
            position: relative;
            padding: 10px 7px;
            float: left;
          }
          .main-content #sidebar-toggle .bar{
            display: block;
            width: 18px;
            margin-bottom: 3px;
            height: 2px;
            background-color: #fff;
            border-radius: 1px;
          }
          .main-content #sidebar-toggle .bar:last-child{
            margin-bottom: 0;
          }

          .check {
            margin: 5px;
          }
          .checkbox {
            vertical-align: top;
            margin: 0 3px 0 0;
            width: 17px;
            height: 17px;
          }
          .checkbox + label {
            cursor: pointer;
          }
          .checkbox:not(checked) {
            position: absolute;
            opacity: 0;
          }
          .checkbox:not(checked) + label {
            position: relative;
            padding: 0 0 0 32px;
          }
          .checkbox:not(checked) + label:before {
            content: '';
            position: absolute;
            top: 1px;
            left: 0;
            width: 25px;
            height: 13px;
            border-radius: 7px;
            background: #CDD1DA;
            box-shadow: inset 0 1px 1px rgba(0,0,0,.2);
          }
          .checkbox:not(checked) + label:after {
            content: '';
            position: absolute;
            top: 1px;
            left: 2px;
            width: 11px;
            height: 11px;
            border-radius: 5px;
            background: #FFF;
            box-shadow: 0 1px 2px rgba(0,0,0,.3);
            transition: all .2s;
          }
          .checkbox:checked + label:before {
            background: #9FD468;
          }
          /* Сдвигаем переключатель чекбокса, когда он включен. */
          .checkbox:checked + label:after {
            left: 13px;
          }
          /* Показываем получение фокуса. */
          .checkbox:focus + label:before {
            box-shadow: 0 0 0 3px rgba(255,255,0,.5);
          }
        </style>
    <div class="container">
      <div id="sidebar">
        <form>
          <div class="check">
            <input type="checkbox" class="checkbox" id="businessChk" />
            <label for="businessChk">Бизнес</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="cinemaChk" />
            <label for="cinemaChk">Кино</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="concertChk" />
            <label for="concertChk">Концерт</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="dancingChk" />
            <label for="dancingChk">Танцы</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="exhibitionsChk" />
            <label for="exhibitionsChk">Выставки</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="gamesChk" />
            <label for="gamesChk">Игры</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="festivalsChk" />
            <label for="festivalsChk">Фестивали</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="meetingChk" />
            <label for="meetingChk">Встречи</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="theatreChk" />
            <label for="theatreChk">Театр</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="sportChk" />
            <label for="sportChk">Спорт</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="questChk" />
            <label for="questChk">Квесты</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="charityChk" />
            <label for="charityChk">Благотворительность</label>
          </div>
          <div class="check">
            <input type="checkbox" class="checkbox" id="comedyChk" />
            <label for="comedyChk">Comedy</label>
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
        <script type="text/javascript">
          var map;
          function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
              center: {lat: -34.397, lng: 150.644},
              zoom: 8
            });
          }
        </script>

         <script type="text/javascript">
          $(document).ready(function() {
            $("[data-toggle]").click(function() {
              var toggle_el = $(this).data("toggle");
//              var myClass = $(toggle_el).attr("class");
//              alert(myClass);
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
          });
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1Oq4jskDM9UEBBbDzWSioDqzY1R434mk&callback=initMap">
        </script>
      <%--</body>--%>
    <%--</html>--%>
  </tiles:putAttribute>
</tiles:insertDefinition>
