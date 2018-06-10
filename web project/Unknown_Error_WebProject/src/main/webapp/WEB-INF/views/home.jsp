<%@page
	import="org.springframework.web.bind.annotation.SessionAttribute"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/unknownerror.css" rel="stylesheet">
<!-- 제이쿼리 import -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
				<div class="keyword_list">
					<table class="tdc">
						<c:forEach items="${list}" var="keywordVO">
							<tr>
								<td><c:if test="${keywordVO.flag==0}">
										<button
											onclick="location.href='/view?keyword=${keywordVO.keyword}'"
											disabled="disabled" id="${keywordVO.keyword}">${keywordVO.keyword}</button>
										<img id="img_${keywordVO.keyword}" class="loading"
											src="resources/img/loading.gif">
									</c:if>
									<c:if test="${keywordVO.flag==1}">
										<button
											onclick="location.href='/view?keyword=${keywordVO.keyword}'"
											id="${keywordVO.keyword}">${keywordVO.keyword}</button>
										<img id="img_${keywordVO.keyword}" class="loading"
											src="resources/img/check_img.png">
									</c:if>
									</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>

		<div></div>

	</div>

</body>
</html>