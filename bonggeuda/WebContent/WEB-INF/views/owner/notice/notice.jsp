<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function() {
		// Add minus icon for collapse element which is open by default
		$(".collapse.show").each(function() {
			$(this).siblings(".card-header").find(".btn i").html("remove");
			$(this).prev(".card-header").addClass("highlight");
		});

		// Toggle plus minus icon on show hide of collapse element
		$(".collapse").on('show.bs.collapse', function() {
			$(this).parent().find(".card-header .btn i").html("remove");
		}).on('hide.bs.collapse', function() {
			$(this).parent().find(".card-header .btn i").html("add");
		});
	});
</script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,500|Open+Sans">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>봉그다 숙박숙박 :: 공지사항</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/styles.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/responsiveslides.min.js"></script>
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<style>
div.tab, div.tab-content {
	margin-left: 20%;
	margin-right: 4.8%;
}

.table tbody tr th {
	background: white;
}

table.table tr th {
	text-align: center;
	padding: 5px;
	line-height: 2.5;
	font-weight: 500;
	width: auto;
}

th a:hover {
	color: #6eceda !important;
}

.container, .container-lg, .container-md, .container-sm, .container-xl {
	max-width: 1300px;
}
</style>
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
				<li><a href="/bonggeuda/owner/registration">숙소등록</a></li>
				<li><a href="/bonggeuda/owner/managementRoom">숙소관리</a></li>
				<li><a href="/bonggeuda/owner/bookingList">예약관리</a></li>
				<li><a href="/bonggeuda/owner/notice">공지사항</a></li>
				<li><a href="/bonggeuda/owner/mypage">마이페이지</a></li>
				<li><a href="/bonggeuda/"><i class="glyphicon glyphicon-user"></i>Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!--header-->
	<!--//-->
	<div class=" banner-notice">
		<!--상단 메뉴바-->
		<div class=" container">
			<h3>공지사항</h3>
			<div class="clearfix"></div>
			<!--initiate accordion-->
			<script type="text/javascript">
				$(function() {
					var menu_ul = $('.menu > li > ul'), menu_a = $('.menu > li > a');
					menu_ul.hide();
					menu_a.click(function(e) {
						e.preventDefault();
						if (!$(this).hasClass('active')) {
							menu_a.removeClass('active');
							menu_ul.filter(':visible').slideUp('normal');
							$(this).addClass('active').next().stop(true, true)
									.slideDown('normal');
						} else {
							$(this).removeClass('active');
							$(this).next().stop(true, true).slideUp('normal');
						}
					});
				});
			</script>
		</div>
	</div>
	<!--//header-->
	<br>
	<br>
	<div class="blog">
		<div class="container">
			<div class="blog-list">
				<nav>
					<div class="col-md-3 blog-sidebar">
						<ul>
							<li class="blog-list" style="font-size: 1.3em; font-weight: 600;">
								<a href="/bonggeuda/owner/notice" style="color: #6eceda;">공지사항</a></li>
							<li class="blog-list"><a href="/bonggeuda/owner/frequently" >자주 묻는 질문</a></li>
							<li class="blog-list"><a href="/bonggeuda/owner/question/list" >1:1 문의</a></li>
							<li class="blog-list"><a href="/bonggeuda/owner/policy" >약관 및 정책</a></li>
						</ul>
					</div>
				</nav>
			<% int i = 0;  %>
			<!--공지사항 토글-->
				<div class="container-xl">
					<div class="row">
						<div class="col-lg-12">
							<div class="accordion" id="accordionExample">
							
								<c:forEach var="notice" items="${ requestScope.selectNotice }">
								<div class="card">
									<div class="card-header" id="headingOne">
										<h2 class="clearfix mb-0">
											<a class="btn btn-link" data-toggle="collapse" data-target="#collapse${ notice.noticeNo }" aria-expanded="true" aria-controls="collapseOne">
												<% i++; %><%= i %>.&nbsp&nbsp<c:out value="${ notice.noticeTitle }"/>
												<i class="material-icons">add</i>
											</a>
										</h2>
									</div>
									<div id="collapse${ notice.noticeNo }" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
										<div class="card-body">
											<c:out value="${ notice.noticeContent }"/>
											<br><br><br>
											<div style="color: lightslategray;">작성자 : 관리자&nbsp&nbsp&nbsp&nbsp작성일 : <c:out value="${ notice.noticeWriteDate }"/></div>
										</div>
									</div>
								</div>
							</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<!--footer-->
		<div class="footer-bottom">
			<div class="container">
				<div class="col-md-4 footer-logo">
					<h2>
						<a href="index.html">Bonggeuda</a>
					</h2>
				</div>
				<div class="col-md-8 footer-class">
					<p>
						© 2021 Bonggeuda SUKBAKSUKBAK. All Rights Reserved | Design by <a
							href="http://w3layouts.com/" target="_blank">Bonggeuda</a>
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
</html>