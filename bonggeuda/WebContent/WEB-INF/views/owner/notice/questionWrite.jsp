<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<style>
div.tab {
    margin-left: 20%;
    margin-right: 20%;
	width: 850px;
}

div.tab_each, div.list_none {
	margin-left: 20%;
    margin-right: 20%;
}

.inquiry .tab_each{display:none}
.inquiry .tab_each:first-child{display:block}
.inquiry .tab{display:none}
.tab_each{clear:both;border-top:1px solid rgba(0,0,0,0.08)}
</style>
<title>봉그다 숙박숙박 :: 1:1 문의</title>
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
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
<div class=" banner-notice"> <!--상단 메뉴바-->
	<div class=" container">
		<h3>1:1 문의</h3> 
	<div class="clearfix"> </div>
		<!--initiate accordion-->
		<script type="text/javascript">
			$(function() {
			    var menu_ul = $('.menu > li > ul'),
			           menu_a  = $('.menu > li > a');
			    menu_ul.hide();
			    menu_a.click(function(e) {
			        e.preventDefault();
			        if(!$(this).hasClass('active')) {
			            menu_a.removeClass('active');
			            menu_ul.filter(':visible').slideUp('normal');
			            $(this).addClass('active').next().stop(true,true).slideDown('normal');
			        } else {
			            $(this).removeClass('active');
			            $(this).next().stop(true,true).slideUp('normal');
			        }
			    });
			});
		</script>
	</div>
</div>
<!--blog-->
<br><br>
<div class="blog">
<div class="container">
	<div class="blog-list">
		<nav>
		<div class="col-md-3 blog-sidebar">
		<ul>
			<li class="blog-list"><a href="/bonggeuda/owner/notice">공지사항</a></li>
			<li class="blog-list"><a href="/bonggeuda/owner/frequently">자주 묻는 질문</a></li>
			<li class="blog-list" style="font-size: 1.3em; font-weight: 600;"><a href="/bonggeuda/owner/question/list" style="color: #6eceda;">1:1 문의</a></li>
			<li class="blog-list"><a href="/bonggeuda/owner/policy">약관 및 정책</a></li>
		</ul>
		</nav>
	<form action="${ pageContext.servletContext.contextPath }/owner/question/write" method="post">
	<div id="content" class="sub_wrap more_wrap">
	<div class="align_rt">
		<!-- Tab -->
		<div class="tab">
			<span class="tab_btn" onclick="location.href='/bonggeuda/owner/question/list'">나의 문의 내역</span>
			<span class="tab_btn active">새 문의 작성</span>
		</div>
		<br>
		<!-- 문의작성 -->
		<div class="list_none" style="display: block; height: 604px; width: 850px; border: 1px solid lightgray;">
			<div class="writeNameBox">
				<div class="writeNameBoxContent" style="margin: auto;">
					<p style="text-align: center; font-weight: bold;">제목&nbsp&nbsp&nbsp<input type="text" name="title" style="border-radius: revert; font-weight: normal;" class="titleInput" placeholder=" 제목을 입력하세요." required></p>
				</div>
			</div>
			<textarea class="wirteContent" style="width: 827px; height: 512px; margin-top: 15px;" rows="22" name="content" placeholder="문의 사항을 적어주세요." required="required"></textarea>
		</div>
		<br>
		<div class="list_none" style="display:block; text-align: center; width: 850px;">
			<button class="submit-btn" type="submit">작성 완료</button>
		</div>
	</div>
	</div>
	</form>
</div>
</div>
</div>
</div>
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
</body>
</html>