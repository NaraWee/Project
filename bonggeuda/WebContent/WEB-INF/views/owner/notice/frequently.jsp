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
<!--blog-->
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
			<li style="margin-right: 20px;"><a href="/bonggeuda/owner/frequently" style="color: #6eceda; font-weight: bold;"><span class="tab_btn active"></span>숙소관리</a></li>
			<li style="margin-right: 20px;"><a href="/bonggeuda/owner/frequently2">예약관리</a></li>
			<li style="margin-right: 20px;"><a href="/bonggeuda/owner/frequently3">기타</a></li>
		</ul> 
	</div>
	<div id="cont_area"><!-- 본문 콘텐츠-->
		<div class="cont_inner" id="policy_page" style="min-height: 435px; text-align: left; float: left; width: 850px;">
			<br><br>
			<div style="font-weight: bold;">Q. 회원 가입 이후에 객실등록은 어떻게 하나요?</div><br>
			<p style="background: #e9ebebbe;">
				<br>
				(1) 회원 가입은 별도의 가입비용 발생 없이 가입자의 이메일, 비밀번호만 입력하면 누구나 가입이 가능합니다.<br>
				(2) 가입 이후 4단계 (마이페이지 작성, 소개 작성, 정책 작성, 객실 등록)을 모두 완료하시면 등록 요청이 완료 됩니다.
				<br><br>
			</p>
			<br>
			<div style="font-weight: bold;">Q. 숙소 소개 작성시 주의사항이 궁금해요.</div><br>
			<p style="background: #e9ebebbe;">
				<br>
				(1) 정보 등록 항목은 필수 정보와 부가 정보로 나뉘며 부가 정보 항목은는 기입할 내용이 없으면 작성하지 않으셔도 됩니다.<br>
				(2) 우측 끝 “?” 아이콘은 화면 뷰가 어떻게 앱에서 표시되는지 미리 볼 수 있는 화면 이미지 입니다.<br>
				(3) 작성시 어려움이 있으실 경우, ‘예시 문구 및 화면보기’를 클릭하여 알맞은 예시를 확인할 수 있습니다.
				<br><br>
			</p>
			<br>
			<div style="font-weight: bold;">Q. 숙소 정책 설정 시 주의사항이 궁금해요.</div><br>
			<p style="background: #e9ebebbe;">
				<br>
				(1) 이용시간, 예약 유형, 예약 마감 시간 설정, 성수기 설정, 연박 할인 등 주요 정책(규칙)을 설정할 수 있습니다.<br>
				(2) 예약 유형, 예약 마감 시간 설정, 연박 할인 설정은 11/15일 등록 및 변경이 가능합니다.
				<br><br>
			</p>
		</div>
	</div>
	<div class="clearfix"> </div>
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