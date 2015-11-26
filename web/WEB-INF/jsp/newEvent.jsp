<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="newEventTemplate">
    <tiles:putAttribute name="body">
        <html>
        <head>
            <title>New Event</title>
        </head>
        <body>
            NEW EVENT
        </body>
        </html>
    </tiles:putAttribute>
</tiles:insertDefinition>