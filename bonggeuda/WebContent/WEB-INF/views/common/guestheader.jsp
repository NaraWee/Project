<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉그다숙박</title>
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.servletContext.contextPath }/resources/guest/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${pageContext.servletContext.contextPath }/resources/guest/js/scripts.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/guest/js/event.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/styles.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<!-- <link href="css/common.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/product.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
<div class="header">
	<div class="container">
		<!--logo-->
			<div class="logo">
				<h1><a href="${ pageContext.servletContext.contextPath }">Bonggeuda</a></h1>
			</div>
		<!--//logo-->
		<!-- 상단메뉴바 -->
		<c:if test="${empty sessionScope.member }">
		<div class="top-nav">
			<ul class="right-icons">
				<%-- <li><span ><a  href="${ pageContext.servletContext.contextPath }">메인페이지</a></span></li>
				<li><a  href="${ pageContext.servletContext.contextPath }/usernotice/select">더보기</a></li>
				<li><a  href="${ pageContext.servletContext.contextPath }/point/select">마이페이지</a></li> --%>
				<li><a  href="${pageContext.servletContext.contextPath }/login/test"><i class="glyphicon glyphicon-user"> </i>로그인</a></li>
			</ul>
			<!-- //상단메뉴바 -->
			</div>
		</c:if>
		
		<c:if test="${!empty sessionScope.member }">
		<div class="top-nav">
			<ul class="right-icons">
				<li><span ><a  href="${ pageContext.servletContext.contextPath }">메인페이지</a></span></li>
				<li><a  href="${ pageContext.servletContext.contextPath }/usernotice/select">더보기</a></li>
				<li><a  href="${ pageContext.servletContext.contextPath }/point/select">마이페이지</a></li>
				<li><a><strong>${sessionScope.member.nickName}</strong> 님 환영합니다.</a></li>
				<%-- <li><a  href="${pageContext.servletContext.contextPath }/login/test"><i class="glyphicon glyphicon-user"> </i>로그인</a></li> --%>
			</ul>
			<!-- //상단메뉴바 -->
			</div>

		</c:if>
		
		<div class="clearfix"> </div>
		</div>
		<div class="clearfix" > </div>
    </div>	
</body>
</html>