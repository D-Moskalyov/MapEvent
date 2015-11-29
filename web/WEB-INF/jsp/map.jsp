<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="mainTemplate">
  <tiles:putAttribute name="body">
    <%--<html>--%>
      <%--<head>--%>
        <title>MapEvent in Action!</title>
        <style type="text/css">
          /*html, body { height: 100%; margin: 0; padding: 0; }*/
          /*#map {*/
            /*/!*height: 85%;*/
            /*border-top: 1px solid blue;*!/*/
          /*}*/
          .container {
            position: relative;
            height: 85%;
            width: 100%;
            left: 0;
            border-bottom: 1px solid #C9223D;
            -webkit-transition:  left 0.4s ease-in-out;
            -moz-transition:  left 0.4s ease-in-out;
            -ms-transition:  left 0.4s ease-in-out;
            -o-transition:  left 0.4s ease-in-out;
            transition:  left 0.4s ease-in-out;
          }
          .container.open-sidebar {
            left: 240px;
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
            padding-left: 60px;
            float: left;
            width: 100%;
            height: 100%;
          }
          .main-content .content #map{
            width: 100%;
            height: 100%;
          }
          .main-content #sidebar-toggle {
            background: #DF314D;
            border-radius: 3px;
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
        </style>
      <%--</head>--%>
      <%--<body>--%>
    <div class="container">
      <div id="sidebar">
      </div>

        <div class="main-content">
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
    <%--<div id="map"></div>--%>
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
