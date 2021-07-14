<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		ul.FAQ_tab {
			font-size: 18px;
		}
		ul.FAQ_tab li a {
			color: darkgray;
		}
		div.txt term-basic-wrap {
			padding-left: 100px;
			padding-right: 100px;
		}
		#cont_area {
    		float: left;
    		width: 800px;
		}
		div.cont_inner span, div.cont_inner div {
			float: left;
			text-align: left;
		}
		div.cont_inner div {
			font-size: 15px;
		}
		div.cont_inner p {
			margin-top: 5px;
		}
		ul {
          padding: 0;
          list-style: none;
        }
		.FAQ_tab{
			margin-left: 50px;
		}
	</style>
<title>봉그다 숙박숙박 :: FAQ</title>
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
		<h3>자주 묻는 질문</h3> 
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
<!--//header-->
<br><br>
<div class="blog">
<div class="container">
	<div class="blog-list">
		<nav>
		<div class="col-md-3 blog-sidebar">
		<ul>
			<li class="blog-list"><a href="/bonggeuda/owner/notice">공지사항</a></li>
			<li class="blog-list" style="font-size: 1.3em; font-weight: 600;"><a href="/bonggeuda/owner/frequently" style="color: #6eceda;">자주 묻는 질문</a></li>
			<li class="blog-list"><a href="/bonggeuda/owner/question/list">1:1 문의</a></li>
			<li class="blog-list"><a href="/bonggeuda/owner/policy">약관 및 정책</a></li>
		</ul>
		</nav>
	<div class="FAQ_tab" data-default="term">
		<ul class="FAQ_tab" style="display: flex;">
			<li style="margin-right: 20px;"><a href="/bonggeuda/owner/frequently">숙소관리</span></a></li>
			<li style="margin-right: 20px;"><a href="/bonggeuda/owner/frequently2" style="color: #6eceda; font-weight: bold;"><span class="tab_btn active"></span>예약관리</a></li>
			<li style="margin-right: 20px;"><a href="/bonggeuda/owner/frequently3">기타</a></li>
		</ul> 
	</div>
	<div id="cont_area"><!-- 본문 콘텐츠-->
		<div class="cont_inner" id="policy_page" style="min-height: 435px; text-align: left; float: left; width: 850px;">
			<br><br>

			<div style="font-weight: bold;">Q. 예약 알림 설정 방법은 어떻게 하나요?</div><br>
			<p style="background: #e9ebebbe;">
				<br>
				로그인 이후 우측 상단 마이페이지 > 예약알리미 접근 하시면 예약 알리미 설정이 가능합니다.<br><br>
				[로그인 > 마이페이지 >예약 알리미]<br>
				간단하게 이름, 문자/FAX/이메일, 번호, 수신 받을 요일, 시간 설정이 가능합니다.
				<br><br>
			</p>
			<br>
			<div style="font-weight: bold;">Q. 예약 관리에 대해 알고 싶어요.</div><br>
			<p style="background: #e9ebebbe;">
				<br>
				객실관리에서 객실을 등록 하신 후 하단의 파란색 ‘저장 및 [실시간 예약관리] 반영’ 버튼을 클릭합니다.<br>
				예약관리 > 실시간 예약관리 페이지에 생성된 객실의 수량과 가격, 개시/마감을 일자별로 설정할 수 있습니다.<br>
				오늘 기준 최대 2개월까지 자동 세팅 됩니다.
				<br><br>
			</p>
			<br>
			<div style="font-weight: bold;">Q. 예약유형 설정은 어떻게 하나요?</div><br>
			<p style="background: #e9ebebbe;">
				<br>
				[숙소관리] > [이용규칙 관리] > [예약 유형] 항목에서 설정이 가능합니다.<br>
				* 실시간 예약 : 승인 절차 없이 바로 예약/확정 시스템<br>
				* 대기예약 : 예약 후 바로 확정이 아닌, 고객의 예약 요청 후 2시간 내에 사장님께서 가능/불가 응답을 주시면 예약이 처리되는 시스템
				<br><br>
			</p>
			<br>
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