<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>봉그다 숙박숙박 :: 예약 관리</title>
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
<style>
	div.tab, div.tab-content {
		  margin-left: 20%;
		  margin-right: 4.8%;
	}
	.table tbody tr th{
		background: white;
	}
	table.table tr th{
		text-align: center;
		padding: 3px;
		line-height: 2.5;
		font-weight: 500;
		width: auto;
	}
	th a:hover{
		color: #6eceda !important;
	}
	.table > tbody > tr > td{
		padding: 0px;
	}
	table.table tr td {
    text-align: -webkit-right;
	}
	table.table tr td.midName{
		text-align: center;
	}
	.pagination {
    	margin-top: auto;
	}
 </style>
</head>
<body>
<!--header-->
<!--header-->
<div class="header">
	<div class="container">
		<!--logo-->
			<div class="logo">
				<h1><a href=/bonggeuda/owner/main>Bonggeuda</a></h1>
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
<div class=" banner-manage"> <!--상단 메뉴바-->
	<div class=" container">
		<h3>매출 내역</h3> 
	<!---->
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
			<c:forEach var="sales" items="${ requestScope.selectSales }">
			<div id="content" class="sub_wrap more_wrap">
				<div class="align_rt">
					<!-- Tab -->
					<div class="tab">
						<span class="tab_btn active"><c:out value="${ sales.accomoName }"></c:out></span>
						<span class="tab_btn" onclick="location.href='booking_sales2.html'">다른숙소명</a></span>
					</div>
				</div>
			</div>
			<table class="table" style="width: 1000px;">
				<thead>
					<tr>
						<th  style="background: #eaeaea;"><b>숙소명</b></th>
					</tr>
				</thead>
				<tbody>
				   	<tr>
						<th><c:out value="${ sales.accomoName }"></c:out></th>
					</tr>
				</tbody>
			</table>
			<br>
			</c:forEach>
			<table class="table" style="width: 1000px; margin-left: 135px; color:black;">
				<thead>
					<tr>
						<th colspan="4" style="background: #eaeaea;"><b>${ requestScope.accomoName } 의 총 예약건수 &nbsp;:&nbsp; ${ requestScope.bookingCount } 회 &nbsp;&nbsp;/ &nbsp;&nbsp;총 매출 &nbsp;:&nbsp; ${ requestScope.sumSalePrice } 원 </b></th>
					</tr>
 					<!-- <th><b>기간</b></th> -->
					<th><b>예약 가능</b></th>
					<th><b>보유 객실</b></th>
				</thead>
				<tbody>
				<c:forEach var="roomNames" items="${ requestScope.roomNamsList }">
				<tr>
					<!-- <th rowspan="rowspanCount">2021 - 05</th> -->
					<td>예약 가능</td>
					<td>${ roomNames }</td>
				</tr>
				</c:forEach>
				</tbody>
			 </table>
			 <div class="tab_each" style="display:block">
			</div>
			 <br>
		</div>
	</div>
</div>
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