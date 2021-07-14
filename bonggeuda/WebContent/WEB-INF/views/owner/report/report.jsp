<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>봉그다 숙박숙박 :: 신고</title>

<link href="${pageContext.servletContext.contextPath }/resources/owner/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/jquery.min.js"></script>

<script src="${pageContext.servletContext.contextPath }/resources/owner/js/scripts.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/event.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/owner/css/styles.css" rel="stylesheet">

<link href="${pageContext.servletContext.contextPath }/resources/owner/css/style.css" rel="stylesheet" type="text/css" media="all" />	

<script src="${pageContext.servletContext.contextPath }/resources/owner/js/responsiveslides.min.js"></script>


	<meta charset="UTF-8" />

	<link rel="shortcut icon" href="../favicon.ico"> 
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/resources/owner/css/default.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/resources/owner/css/component.css" />
	<script src="${pageContext.servletContext.contextPath }/resources/owner/js/modernizr.custom.js"></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
</head>
<body>
<!--header-->
<div class="header">
	<div class="container">
		<!--logo-->
			<div class="logo">
				<h1><a href="/bonggeuda/owner/main">Bonggeuda</a></h1>
			</div>
		<!--//logo-->
		<div class="top-nav">
			<ul class="right-icons">
				<li><a href="registration.html">숙소등록</a></li>
				<li><a href="/bonggeuda/owner/managementRoom">숙소관리</a></li>
				<li><a href="/bonggeuda/owner/bookingList">예약관리</a></li>
				<li><a href="/bonggeuda/owner/notice">공지사항</a></li>
				<li><a  href="/bonggeuda/owner/mypage">마이페이지</a></li>
				<li><a href="/bonggeuda/"><i class="glyphicon glyphicon-user"></i>Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!--//-->	
<div class=" banner-mypage"> <!--상단 메뉴바-->
	<div class=" container">
		<h3>신고하기</h3> 
	</div>
</div>
<br><br>
<!-- 문의작성 -->
<form action="/bonggeuda/owner/reportWrite" method="post" encType="multipart/form-data">
<input type="hidden" name="userNo" value="${ requestScope.forReort.userNo}">
<input type="hidden" name="ownerNo" value="${ requestScope.forReort.ownerNo}">
<div class="box">
	<div class="list_none" style="display: block; height: 604px; width: 780px; border: 1px solid lightgray; margin: auto;">
		<div class="writeNameBox">
			<div class="writeNameBoxContent">
				<p style="text-align: center; font-weight: bold;">제목 
					<input type="text" class="titleInput" placeholder="제목을 입력하세요." name="reportTitle" required="required">
					
					<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)"   style=" display: inline-flex;">
				</p>
			</div>
		</div>
		<textarea class="wirteContent" style="border-radius: 5px;"  rows="22" name="reportContent" placeholder="상황을 판단할 수 있는 사진과 함께 확실한 사실만 신고해 주시길 바랍니다." required="required"></textarea>
		</div>
		<br>
		<div class="list_none" style="display:block; text-align: center; width: 780px; margin: auto;">
			<button class="submit-btn" type="submit" >신고하기</button>
		</div>
	</div>
</div>
</form>
</body>
<br><br><br><br><br>
<br><br><br><br><br>
<br><br><br><br><br>
<!--footer-->
<div class="footer-bottom">
	<div class="container">
		<div class="col-md-4 footer-logo">
			<h2><a href="index.html">Bonggeuda</a></h2>
		</div>
		<div class="col-md-8 footer-class">
			<p >© 2021 Bonggeuda SUKBAKSUKBAK. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">Bonggeuda</a> </p>
		</div>
	<div class="clearfix"> </div>
	 </div>
</div>
</div>
<!--//footer-->
</body>
</html>