<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm page</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/confirm.css"/>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/confirm.js"></script>
</head>
<body>
  <p class="message text-center" id="mess">cdscsvsv</p>
</body>
</html>
<script type="text/javascript">
  var title = "${Title}";
  var message = "${Message}";
</script>
