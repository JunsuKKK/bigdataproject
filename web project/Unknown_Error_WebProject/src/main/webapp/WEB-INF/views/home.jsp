<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/unknownerror.css" rel="stylesheet">
<script src="resources/js/main.js"></script>
<body>
	<div class="fulloverlay">
		<div class="container">
			<div class="form-main">
				<div class="form-logo">
					<img src="resources/img/logo.png">
				</div>
				<form method="POST">
					<input type="text" class="form-control"
						placeholder="Unknown Error 검색" id="keyword_input" name="keyword">
				</form>
				<div class="form-list"></div>
			</div>
		</div>
	</div>

</body>
</html>