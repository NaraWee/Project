<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<style>
	div.mmiddle {
    margin-left: 25%;
    margin-right: 25%;
	}
	.point_list li, .point_list span, .point_list p{
		font-size: 18px;
	}
	.point_list li {
		padding-bottom: 10px;
		padding-top: 10px;
    	height: auto;
    	border-bottom: 1px solid rgba(0,0,0,0.2);
		width: 575px;
	}
	.tab {
		width: 740px;
	}
	.point_list .col_red {
		color: #6eceda;
	}
	.point_list p {
		margin-top: 5px;
	}

	table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    width: 740px;
	}


	table.type09 thead th {
    	/* padding: 10px; */
    	font-weight: bold;
    	vertical-align: top;
    	/* color: #369; */
   	 	border-bottom: 2px solid #ccc;
	}

	table.type09 tbody th {
    	width: 110px;
    	padding: 10px;
    	font-weight: bold;
    	vertical-align: top;
    	border-bottom: 1px solid #ccc;
    	background: #f3f6f7;
    	text-align: center;
	}

	table.type09 td {
    	width: 350px;
    	padding: 10px;
    	vertical-align: top;
    	border-bottom: 1px solid #ccc;
	}

	
	</style>
<title>봉그다 숙박숙박</title>
<link href="${ pageContext.servletContext.contextPath }/resources/guest/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ pageContext.servletContext.contextPath }/resources/guest/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${ pageContext.servletContext.contextPath }/resources/guest/js/scripts.js"></script>
<link href="${ pageContext.servletContext.contextPath }/resources/guest/css/styles.css" rel="stylesheet">
<!--//menu-->
<!--theme-style-->
<link href="${ pageContext.servletContext.contextPath }/resources/guest/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
<!--header-->
<jsp:include page="../../common/guestheader.jsp"/>

<div class=" banner-buying">
	<div class=" container">
	<h3><span>마이페이지</span></h3> 

	<div class="clearfix"> </div>      		
	</div>
</div>
<!--//header-->
<!--blog-->
<div class="blog">
<div class="container">
	<h3></h3>
	<div class="blog-list">
		<nav>
		<div class="col-md-3 blog-sidebar">
		<ul style="padding-top: 70px;">
			<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/point/select">포인트</a></li>
			<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/coupon/select">쿠폰함</a></li>
			<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/userbooklist/select">예약 내역</a></li>
			<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/usermyinfo/select">내 정보 관리</a></li>
			<li class="blog-list" style=" font-size: 1.3em; font-weight: 600;"><a href="${ pageContext.servletContext.contextPath }/userreportlist/select" style="color: #6eceda;">신고내역</a></li>
		</ul>
		</div>
		</nav>
	</div>

	<div class="mmiddle">
	<div class="tab">
		<span class="tab_btn active">신고 내역</span>
	</div>

	<div id="cont_area"><!-- 본문 콘텐츠-->
		<div class="cont_inner" id="policy_page" style="min-height: 435px; text-align: left; float: left;">
			<div id="home" class="tab-pane fade in active">
			 
				<table class="type09" style="margin-top: 20px;">
					<thead>
						<tr>
							<th scope="cols"></th>
							<th scope="cols"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td colspan="3"><c:out value="${ requestScope.userReportContent.reportTitle }"/></td>
						</tr>
						<tr>
							<th scope="row">신고업체</th>
							<td><c:out value="${ requestScope.userReportContent.accomoName }"/></td>
							<th scope="row">작성일</th>
							<td><c:out value="${ requestScope.userReportContent.reportDate }"/></td>
						</tr>
					</tbody>
				</table>
				<br>
				<p>
					<c:out value="${ requestScope.userReportContent.reportReason }"/>
				</p>
				<br>
					<c:forEach var="arr" items="${ userReportImg }" varStatus="st">
				<c:if test="${ arr.thumbnailPath ne null }">
					<img src="${ pageContext.servletContext.contextPath }/${ arr.thumbnailPath }" style="width: 30%">
				</c:if>
					</c:forEach>
				<br><br>
				<table class="type09">
					<thead>
						<tr>
							<th scope="cols"></th>
							<th scope="cols"></th>
						</tr>
					</thead>
				</table>
				<div>
					<textarea class="form-control textarea-layer" style="resize:none; width: 700px; height: 120px; margin-top: 10px;" disabled><c:out value="${ requestScope.userReportContent.reportAnswer }"/></textarea>
				</div>
				
			</div>
		</div>
	</div>
	</div>

	<div class="clearfix"> </div>
</div>

</div>
<!--//blog-->
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