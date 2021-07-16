<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>봉그다 숙박숙박</title>
<link href="${pageContext.servletContext.contextPath }/resources/owner/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/scripts.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/event.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/owner/css/styles.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath }/resources/owner/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/responsiveslides.min.js"></script>
<script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  	</script>
	<meta charset="UTF-8" />
	<link rel="shortcut icon" href="../favicon.ico"> 
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/resources/owner/css/default.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/resources/owner/css/component.css" />
	<script src="${pageContext.servletContext.contextPath }/resources/owner/js/modernizr.custom.js">
</script>
<style>
	.col-md-3 {
		width: 25%;
		height: auto;
		text-align: center;
	}
	.caption h3 {
		font-family: 'nanum';
	}
</style>
</head>
<body >
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
				<li><a id="mypage">마이페이지</a>
				<li><a href="/bonggeuda/"><i class="glyphicon glyphicon-user"></i>Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!--header-->
<!--//-->	
	<div class=" header-right">
		<div class=" banner">
			 <div class="slider">
			    <div class="callbacks_container">
			      <ul class="rslides" id="slider">		       
					 <li>
			          	 <div class="banner1">
			           		<div class="caption">
					          	<h3><span>제주 1등 숙박 예약 사이트 봉그다</span></h3> <!-- 메인화면 문구설정, 총 3페이지 -->
					          	<p>업주 여러분 환영합니다 !</p>
			          		</div>
			          	</div>
			         </li>
					 <li>
			          	 <div class="banner2">
			           		<div class="caption">
								<h3><span>봉그다 숙박숙박과 함께 하세요.</span></h3>
								<p>여러분의 멋진 숙소를 등록해 보세요.</p>
			          		</div>
			          	</div>
			         </li>
			         <li>
			          	 <div class="banner3">
			           		<div class="caption">
								<h3><span>코로나 예방 수칙은 필수로 지켜주세요.</span></h3>
								<p>다양한 고객들과 소통해 보세요.</p>
			          		</div>
			          	</div>
			         </li>		
			      </ul>
			  </div>
			</div>
		</div>
	</div>
	<!--header-bottom-->
	<div class="banner-bottom-top">
			<div class="container">
			<div class="bottom-header">
				<div class="header-bottom">
					<div class=" bottom-head">
						<a href="/bonggeuda/owner/registration" > <!--숙소 등록 페이지로 연결-->
							<div class="buy-media">
								<i class="buy"> </i>
								<h6>숙소 등록</h6>
							</div>
						</a>
					</div>
					<div class=" bottom-head" id="roomManagement">
						<a href="/bonggeuda/owner/managementRoom"> <!--숙소 관리 페이지로 연결-->
							<div class="buy-media">
								<i class="buy"> </i>
								<h6 >숙소 관리</h6>
							</div>
							</a>
					</div>
					<div class=" bottom-head">
						<a href="/bonggeuda/owner/bookingList"> <!--예약 관리 페이지로 연결-->
							<div class="buy-media">
							<i class="pg"> </i>
							<h6>예약 관리</h6>
							</div>
						</a>
					</div>
					<div class=" bottom-head">
						<a href="/bonggeuda/owner/notice"> <!-- 공지사항 페이지로 연결-->
							<div class="buy-media">
							<i class="sell"> </i>
							<h6>Q & A</h6>
							</div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--//header-->
<div class="content">
	<div class="content-grid">
		<div class="container">
			 	<a href="/bonggeuda/owner/managementRoom" class="mask">
			<h3 style="font-family:'nanum';">나의 숙소</h3>
			 	</a>
			 	
			 	<c:forEach var="accomoList" items="${ sessionScope.accomoList }">
			<div class="col-md-4 box_2" style="float: left;">
			 	<a href="/bonggeuda/owner/managementRoom" class="mask" style="margin-top: 10px;">
			 		<img class="img-responsive zoom-img" src="${pageContext.servletContext.contextPath }/${ accomoList.imagePath }" alt="">
			 		<span class="four">${ accomoList.accomoName }</span>
			 	<div class="most-1">
			 	   	<h5><a href="single.html">${ accomoList.accomoName }</a></h5>
			 	    	<p>${ accomoList.accomoType }</p>
			 	</div>
			 	</a>
			 	</div>
			 	</c:forEach>
			</div>
		</div>
	</div>
</div>
<!--footer-->
<div class="footer">
	<div class="container">
		<div class="footer-top-at">
			<div class="col-md-3 amet-sed">
				<h4>Our Company</h4>
				<ul class="nav-bottom">
					<li><a href="about.html">About Us</a></li>
					<li><a href="blog.html">For Sale By Owner Blog</a></li>
					<li><a href="mobile_app.html">Mobile</a></li>
					<li><a href="terms.html">Terms & Conditions</a></li>
					<li><a href="privacy.html">Privacy Policy</a></li>	
					<li><a href="blog.html">Blog</a></li>
					
				</ul>	
			</div>
			<div class="col-md-3 amet-sed ">
				<h4>Work With Us</h4>
					<ul class="nav-bottom">
						<li><a href="single.html">Real Estate Brokers</a></li>
						<li><a href="single.html">Business Development</a></li>
						<li><a href="single.html">Affiliate Programs</a></li>
						<li><a href="contact.html">Sitemap</a></li>
						<li><a href="career.html">Careers</a></li>
						<li><a href="feedback.html">Feedback</a></li>	
					</ul>	
			</div>
			<div class="col-md-3 amet-sed">
				<h4>Customer Support</h4>
				<p>Mon-Fri, 7AM-7PM </p>
				<p>Sat-Sun, 8AM-5PM </p>
				<p>177-869-6559</p>
					<ul class="nav-bottom">
						<li><a href="#">Live Chat</a></li>
						<li><a href="faqs.html">Frequently Asked Questions</a></li>
						<li><a href="suggestion.html">Make a Suggestion</a></li>
					</ul>	
			</div>
			<div class="col-md-3 amet-sed ">
				<h4>Property Services</h4>
				   <ul class="nav-bottom">
						<li><a href="single.html">Residential Property</a></li>
						<li><a href="single.html">Commercial Property</a></li>
						<li><a href="login.html">Login</a></li>
						<li><a href="register.html">Register</a></li>
						<li><a href="typo.html">Short Codes</a></li>	
					</ul>	
					<ul class="social">
						<li><a href="#"><i> </i></a></li>
						<li><a href="#"><i class="gmail"> </i></a></li>
						<li><a href="#"><i class="twitter"> </i></a></li>
						<li><a href="#"><i class="camera"> </i></a></li>
						<li><a href="#"><i class="dribble"> </i></a></li>
					</ul>
			</div>
		<div class="clearfix"> </div>
		</div>
	</div>
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