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
<title>봉그다 숙박숙박 :: 신고내역</title>
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
<style>
	.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
  z-index: 900;
}

.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  position: fixed;
  width: 60%;
  padding: 10px;
  max-width: 500px;
  border-radius: 10px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: rgba(255, 255, 255, .9);
  /* "delay" the visibility transition */
  -webkit-transition: opacity .5s, visibility 0s linear .5s;
  transition: opacity .5s, visibility 0s linear .5s;
  z-index: 1;
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
<br><br>
<div class="blog">
	<div class="container">
		<div class="blog-list">
			<nav>
			<div class="col-md-3 blog-sidebar">
			<ul>
				<li class="blog-list"><a href="/bonggeuda/owner/mypage">마이 페이지</a></li>
				<li class="blog-list" style="font-size: 1.3em; font-weight: 600;"><a href="/bonggeuda/owner/mypgeReport" style="color: #6eceda;">신고 내역</a></li>
				<li class="blog-list"><a href="/bonggeuda/owner/settlement" >정산 신청</a></li>
				<li class="blog-list"><a href="/bonggeuda/owner/taxbillList" >세금 계산서 발행</a></li>
			</ul>
			</nav>
		</div>
		<div style="color:black;">
		<table class="type09">
			<thead>
				<tr>
					<th scope="cols"></th>
					<th scope="cols"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><c:out value="${ requestScope.reportDTO.reportTitle }"/></td>
				</tr>
				<tr>
					<th scope="row">작성일</th>
					<td><c:out value="${ requestScope.reportDTO.reportDate }"/></td>
				</tr>
				<tr>
					<th scope="row">처리상태</th>
					<td>
						<c:choose>
							
						<c:when test="${ requestScope.reportDTO.reportStatus eq 'Y'}">
						신고 완료
						</c:when>
						<c:when test="${ requestScope.reportDTO.reportStatus eq 'N'}">
						신고 대기중
						</c:when>
						<c:when test="${ requestScope.reportDTO.reportStatus eq 'C'}">
						신고 거절  &nbsp&nbsp&nbsp
						
						<button type="submit" class="submit-btn" onclick="location.href='#pop01'">거절 사유</button>
						
						</c:when>
						</c:choose>

					</td>
				</tr>
			</tbody>
		</table>
		<br>
		<p>
		<img src="${pageContext.servletContext.contextPath }/${ requestScope.imagePath }" style="width: 360px; height: 230px;">
			<br><br><br>
			<div>
			 
			 <c:out value="${ requestScope.reportDTO.reportReason }"/>
			</div>
		</p>
		<br>
		<table class="type09">
			<thead>
				<tr>
					<th scope="cols"></th>
					<th scope="cols"></th>
				</tr>
			</thead>
		</table>
		</div>
	</div>
</div>
<!-- 승인거절 팝업창 -->
<div id="pop01" class="overlay">
	<div class="popup">
		<a href="#none" class="close">&times;</a>
			<p style="font-size: 20px; color: red; padding-bottom: 10px;">신고 처리가 불가능합니다.</p>
			<div class="cont-step cont-step_02" id="contStep02" style="display: block;">
				<br>
				<!-- 신고불가이유 -->
				<ul class="reason-list" style="text-align: left;">
					<li>
						<label for="reasonRdo0"><c:out value="${ requestScope.rejectReason }"/></label>
					</li>
					</ul>
				</ul>
				<br>
				<div class="password-wrap">
					<div class="button-wrap" style="text-align: center;">
						<button class="submit-btn"  style="background-color: orange; " onclick="location.href='#none'">
						닫기
						</button>
					</div>
				</div>
			</div>
			<script>
			$(document).ready(function(){
				// 라디오버튼 클릭시 이벤트 발생
				$("input:radio[name=radios]").click(function(){
			 
					if($("input[name=radios]:checked").val() == "OTHER"){
						$("input:text[name=reason]").attr("disabled",false);
						// radio 버튼의 value 값이 OTHER이라면 활성화
			 
					}else {
						  $("input:text[name=reason]").attr("disabled",true);
						// 그 외에는 비활성화
					}
				});
			});
			</script>
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