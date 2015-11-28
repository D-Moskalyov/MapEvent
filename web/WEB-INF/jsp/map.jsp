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
          #map { height: 85%; }
        </style>
      <%--</head>--%>
      <%--<body>--%>

        <div id="map"></div>
        <script type="text/javascript">

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
      <%--</body>--%>
    <%--</html>--%>
  </tiles:putAttribute>
</tiles:insertDefinition>
