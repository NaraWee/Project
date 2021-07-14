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
		padding: 5px;
		line-height: 2.5;
		font-weight: 500;
		width: auto;
	}
	th a:hover{
		color: #6eceda !important;
	}

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

.h4{
	text-align: center;
	font-size: 2em;
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
<div class=" banner-booking"> <!--상단 메뉴바-->
	<div class=" container">
		<h3>예약 관리</h3> 
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
			<nav>
			<div class="col-md-3 blog-sidebar">
			<ul>
				<li class="blog-list" style=" font-size: 1.3em; font-weight: 600;"><a href="/bonggeuda/owner/bookingList" style="color: #6eceda;">실시간 예약 현황</a></li>
				<li class="blog-list"><a href="/bonggeuda/owner/bookingPastList">지난 예약</a></li>
				<li class="blog-list"><a href="/bonggeuda/owner/book/question">고객 문의</a></li>
			</ul>
			</nav>

		</div>
		<table class="type09" style="color:black;">
			<thead>
				<tr>
					<th scope="cols" colspan="4"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">예약번호</th>
					<td><c:out value="${ requestScope.bookContentDTO.bookNo }"/></td>
					<th scope="row">예약일시</th>
					<td><c:out value="${ requestScope.bookContentDTO.bookRequestDate }"/></td>
				</tr>
				<tr>
					<th scope="row">숙소명</th>
					<td><c:out value="${ requestScope.bookContentDTO.accomoName }"/></td>
					<th scope="row">객실명</th>
					<td><c:out value="${ requestScope.bookContentDTO.roomName }"/></td>
				</tr>
				<tr>
					<th scope="row">예약자</th>
					<td><c:out value="${ requestScope.bookContentDTO.bookUserName }"/></td>
					<th scope="row">인원</th>
					<td><c:out value="${ requestScope.bookContentDTO.bookPersonnel }"/></td>
				</tr>
				<tr>
					<th scope="row">연락처</th>
					<td><c:out value="${ requestScope.bookContentDTO.userPhone }"/></td>
					<th scope="row">이메일</th>
					<td>
					<c:out value="${ requestScope.bookContentDTO.email }"/>
					
					</td>
				</tr>
				<tr>
					<th scope="row">체크인</th>
					<td><c:out value="${ requestScope.bookContentDTO.bookCheckDate }"/> / <c:out value="${ requestScope.bookContentDTO.bookCheckIn }"/></td>
					<th scope="row">체크아웃</th>
					<td><c:out value="${ requestScope.bookContentDTO.bookCheckoutDate }"/> / 11:00 </td>
				</tr>
				<tr>
					<th scope="row">결제금액</th>
					<td><c:out value="${ requestScope.bookContentDTO.paymentFee }"/></td>
					<th scope="row">결제수단</th>
					<td><c:out value="${ requestScope.bookContentDTO.paymentMethod }"/></td>
				</tr>
				<tr>
					<th scope="row">요청사항</th>
					<td colspan="3"><c:out value="${ requestScope.bookContentDTO.request }"/></td>
				</tr>
			</tbody>
		</table>
		<table class="type09">
			<thead>
				<tr>
					<th scope="cols"></th>
					<th scope="cols"></th>
				</tr>
			</thead>
		</table>
		<br>
		<div style="display: inline-flex; margin-left: 345px;">
		<form action="/bonggeuda/owner/bookAllow" method="get">
		<button class="submit-btn" type="submit" style="margin-top: 10px; margin-bottom: 10px; margin-right: 30px; width: 90px;" >
			<input type="hidden" name="bookNo" value="${requestScope.bookContentDTO.bookNo}">
			<input type="hidden" name="email" value="${requestScope.bookContentDTO.email}">
			<input type="hidden" name="bookRequestDate" value="${requestScope.bookContentDTO.bookCheckDate}">
			<input type="hidden" name="bookCheckInTime" value="${requestScope.bookContentDTO.bookCheckIn}">
			<input type="hidden" name="bookCheckoutDate" value="${requestScope.bookContentDTO.bookCheckoutDate}">
			
			<input type="hidden" name="accomoName" value="${ requestScope.bookContentDTO.accomoName }">
			<input type="hidden" name="roomName" value="${ requestScope.bookContentDTO.roomName }">
			<input type="hidden" name="bookUserName" value="${requestScope.bookContentDTO.bookUserName}">
			예약 승인
		</button>
		</form>
		
		<button class="submit-btn" type="submit" style="margin-top: 10px; margin-bottom: 10px; width: 90px;" onclick="location.href='#pop01'" >
			예약 거절
		</button>
		</div>
		
		<!-- 예약거절 팝업창 -->
		<div id="pop01" class="overlay">
			<div class="popup">
				<a href="#none" class="close">&times;</a>
					<p style="font-size: 20px; color: red; padding-bottom: 10px; margin-left: 30px;">예약 거절</p>

					<div class="cont-step cont-step_02" id="contStep02" style="display: block;">
						<div class="cont-step_preface">
							<h4 class="h4">예약 거절 사유를 적어 주세요 </h4>
							<br>
						</div>
						<!-- 거절이유 -->
						<form action="/bonggeuda/owner/bookReject" method="get">
						<ul class="reason-list" style="text-align: left;">
							<li>
								<div class="reason-innder-box reason-innder-box6"  style="margin-bottom: 10px;">
									<textarea class="rejectrReasonTextarea" placeholder="고객님께 전달드릴 예약 거절 사유를 적어주세요. 수정 불가능 하오니 신중히 적어주세요." name="rejectReson"></textarea>
								</div>
							</li>
							</ul>
						<div class="password-wrap" style="text-align: center;" >
						
							<input type="hidden" name="bookNo" value="${requestScope.bookContentDTO.bookNo}"/>
							<input type="hidden" name="bookNo" value="${requestScope.bookContentDTO.bookNo}">
							<input type="hidden" name="email" value="${requestScope.bookContentDTO.email}">
							<input type="hidden" name="bookRequestDate" value="${requestScope.bookContentDTO.bookCheckDate}">
							<input type="hidden" name="bookCheckInTime" value="${requestScope.bookContentDTO.bookCheckIn}">
							<input type="hidden" name="bookCheckoutDate" value="${requestScope.bookContentDTO.bookCheckoutDate}">
		
							<input type="hidden" name="accomoName" value="${ requestScope.bookContentDTO.accomoName }">
							<input type="hidden" name="roomName" value="${ requestScope.bookContentDTO.roomName }">
							<input type="hidden" name="bookUserName" value="${requestScope.bookContentDTO.bookUserName}">
														
							<div class="button-wrap"><button type="submit" class="submit-btn">거절하기</button></div>
						</div>
						</form>
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

					function alertReject(){
						alert("예약 거절 되었습니다.");
					};
					
					function alertAccept(){
						alert("예약 승인 되었습니다.")
						location.href="booking.html";
					};
					
				</script>
					


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
</div>
<!--//footer-->
</body>
</html>