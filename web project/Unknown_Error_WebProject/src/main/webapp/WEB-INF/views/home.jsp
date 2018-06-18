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
<script src="resources/js/mainjs.js"></script>
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
				<div class="listform">
					<select id="city" name="city" class="form-control">
						<option value="관악산">관악산</option>
						<option value="서울" selected>서울</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>
						<option value="강화도">강화도</option>
						<option value="백령도">백령도</option>
						<option value="인천">인천</option>
						<option value="광주">광주</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="동두천">동두천</option>
						<option value="수원">수원</option>
						<option value="양평">양평</option>
						<option value="이천">이천</option>
						<option value="파주">파주</option>
						<option value="강릉">강릉</option>
						<option value="대관령">대관령</option>
						<option value="동해">동해</option>
						<option value="북강릉">북강릉</option>
						<option value="북춘천">북춘천</option>
						<option value="삼척">삼척</option>
						<option value="속초">속초</option>
						<option value="영월">영월</option>
						<option value="원주">원주</option>
						<option value="인제">인제</option>
						<option value="정선군">정선군</option>
						<option value="철원">철원</option>
						<option value="춘천">춘천</option>
						<option value="태백">태백</option>
						<option value="홍천">홍천</option>
						<option value="보은">보은</option>
						<option value="제천">제천</option>
						<option value="청주">청주</option>
						<option value="추풍령">추풍령</option>
						<option value="금산">금산</option>
						<option value="보령">보령</option>
						<option value="부여">부여</option>
						<option value="서산">서산</option>
						<option value="천안">천안</option>
						<option value="홍성">홍성</option>
						<option value="고창">고창</option>
						<option value="군산">군산</option>
						<option value="남원">남원</option>
						<option value="부안">부안</option>
						<option value="순창군">순창군</option>
						<option value="임실">임실</option>
						<option value="장수">장수</option>
						<option value="전주">전주</option>
						<option value="정읍">정읍</option>
						<option value="강진군">강진군</option>
						<option value="고흥">고흥</option>
						<option value="광양시">광양시</option>
						<option value="목포">목포</option>
						<option value="무안">무안</option>
						<option value="보성군">보성군</option>
						<option value="순천">순천</option>
						<option value="여수">여수</option>
						<option value="영광군">영광군</option>
						<option value="완도">완도</option>
						<option value="장흥">장흥</option>
						<option value="주암">주암</option>
						<option value="진도군">진도군</option>
						<option value="해남">해남</option>
						<option value="흑산도">흑산도</option>
						<option value="경주시">경주시</option>
						<option value="구미">구미</option>
						<option value="문경">문경</option>
						<option value="봉화">봉화</option>
						<option value="상주">상주</option>
						<option value="안동">안동</option>
						<option value="영덕">영덕</option>
						<option value="영주">영주</option>
						<option value="영천">영천</option>
						<option value="울릉도">울릉도</option>
						<option value="울진">울진</option>
						<option value="의성">의성</option>
						<option value="청송군">청송군</option>
						<option value="포항">포항</option>
						<option value="거제">거제</option>
						<option value="거창">거창</option>
						<option value="김해시">김해시</option>
						<option value="남해">남해</option>
						<option value="밀양">밀양</option>
						<option value="북창원">북창원</option>
						<option value="산청">산청</option>
						<option value="양산시">양산시</option>
						<option value="의령군">의령군</option>
						<option value="진주">진주</option>
						<option value="창원">창원</option>
						<option value="통영">통영</option>
						<option value="함양군">함양군</option>
						<option value="합천">합천</option>
						<option value="고산">고산</option>
						<option value="서귀포">서귀포</option>
						<option value="성산">성산</option>
						<option value="제주">제주</option>
						<option value="성산포">성산포</option>
					</select>
				</div>
				<div class="keyword_list">
					<table class="tdc">
						<c:forEach items="${list}" var="keywordVO">
							<tr>
								<td><c:if test="${keywordVO.flag==0}">
										<button
											onclick="var city=document.getElementById('city').value; location.href='/graph?keyword=${keywordVO.keyword}&city='+city"
											disabled="disabled" id="${keywordVO.keyword}">${keywordVO.keyword}</button>
										<img id="img_${keywordVO.keyword}" class="loading"
											src="resources/img/loading.gif">
									</c:if> <c:if test="${keywordVO.flag==1}">
										<button
											onclick="var city=document.getElementById('city').value; location.href='/graph?keyword=${keywordVO.keyword}&city='+city"
											id="${keywordVO.keyword}">${keywordVO.keyword}</button>
										<img id="img_${keywordVO.keyword}" class="loading"
											src="resources/img/check_img.png">
									</c:if></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>