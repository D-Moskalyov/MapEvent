<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
      <%--<title>MapEvent in Action!</title>--%>
      <style type="text/css">
        html, body { height: 100%; margin: 0; padding: 0; }
        /*#map { height: 83%; }*/
      </style>
  </head>
  <body>
    <tiles:insertAttribute name="header" />
    <tiles:insertAttribute name="body" />
    <tiles:insertAttribute name="footer" />
  </body>
</html>
