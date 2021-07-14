<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>봉그다 숙박숙박 :: 정산 요청 </title>
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
		padding: 5px;
		line-height: 2.5;
		font-weight: 500;
		width: auto;
	}
	th a:hover{
		color: #6eceda !important;
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
				<li><a  href="/bonggeuda/owner/mypage">마이페이지</a></li>
				<li><a href="/bonggeuda/"><i class="glyphicon glyphicon-user"></i>Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!--//-->	
<div class=" banner-mypage"> <!--상단 메뉴바-->
	<div class=" container">
		<h3>마이페이지</h3> 
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
				<li class="blog-list"><a href="/bonggeuda/owner/mypage">마이 페이지</a></li>
				<li class="blog-list" ><a href="/bonggeuda/owner/mypgeReport" >신고 내역</a></li>
				<li class="blog-list" style="font-size: 1.3em; font-weight: 600;"><a href="/bonggeuda/owner/settlement" style="color: #6eceda;">정산 신청</a></li>
				<li class="blog-list" style=><a href="/bonggeuda/owner/taxbillList" >세금 계산서 발행</a></li>
			</ul>
			</nav>
			<c:forEach var="stl" items="${ requestScope.selectStl }"> 
			<div class="tab">
			    <form action="/bonggeuda/owner/settlement" method="post"> 
			    <span class="tab_btn active">신청 내역</span>
			    <button class="submit-btn" type="submit" style="margin-left:800px;">정산 신청</button>
			    <input type="hidden" value="${ stl.reqStlNo }">
			    </form>
			 </div>
			<table class="table table-hover" style="width: 1000px;">
				<thead>
				    <tr>
						<th><b>번호</b></th>
						<th><b>숙소명</b></th>
						<th><b>신청일</b></th>
						<th><b>정산상태</b></th>
				    </tr>
				</thead>
				<tbody>
				   	<tr>
						<th><c:out value="${ stl.reqStlNo }"/></th>
						<th><c:out value="${ stl.accomoName }"/></th>
						<th><c:out value="${ stl.reqDate }"/></th>
						<th>
						<c:choose>
							<c:when test="${ stl.stlYn eq 'Y'}">
							정산완료
							</c:when>
							<c:when test="${ stl.stlYn eq 'N'}">
							대기중
							</c:when>
						</c:choose>
						</th>
					</tr>   
				</tbody>
			 </table>
			</c:forEach>
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
</div>
<!--//footer-->
</body>
</html>