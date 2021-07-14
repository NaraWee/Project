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
		padding: 5px;
		line-height: 2.5;
		font-weight: 500;
		width: auto;
	}
	th a:hover{
		color: #6eceda !important;
	}
	.list-btn{
		background:white;
		border:0;
		outline:0;
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
				<li class="blog-list"><a href="/bonggeuda/owner/bookingList">실시간 예약 현황</a></li>
				<li class="blog-list" style=" font-size: 1.3em; font-weight: 600;"><a href="/bonggeuda/owner/bookingPastList" style="color: #6eceda;">지난 예약</a></li>
				<li class="blog-list"><a href="/bonggeuda/owner/book/question">고객 문의</a></li>
				</ul>
                </div>
            </nav>
			
			<div class="tab">
			    <span class="tab_btn active">예약 목록</span>
				<span style="margin-left:600px;">
					<select style="background-color: rgba(0, 0, 0, 0.05); border-radius: 5px;">
						<option>숙소명</option>
						<option>예약자</option>
						<option>예약확인</option>
						<option>이용상태</option>
					</select>
					<input type="text" name="" id="" style="width: 150px;">
					<button>
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</span>
			 </div>
			<c:if test="${ !empty requestScope.bookList }">
			<table class="table table-hover" style="width: 1000px;">
				<thead>
				    <tr>
						<th><b>번호</b></th>
						<th><b>숙소명</b></th>
						<th><b>객실명</b></th>
						<th><b>예약자</b></th>
						<th><b>전화번호</b></th>
						<th><b>예약 인원</b></th>
						<th><b>시작 날짜</b></th>
						<th><b>종료 날짜</b></th>
						<!-- <th><b>예약확인</b></th> -->
						<th><b>이용상태</b></th>
						<th><b>신고</b></th>
				    </tr>
				</thead>
				<tbody>
				<c:forEach var="board" items="${ requestScope.bookList }">
				<form action="/bonggeuda/owner/bookingPastList" method="post">
				<input type="hidden" name="bookNo" value="${board.bookNo}">
				<input type="hidden" name="bookStatusYNC" value="${board.bookStatusYNC}">
				
				   	<tr>
						<th><button type="submit" class="list-btn">${ board.rowNum }</button></th>
						<th><button type="submit" class="list-btn"><c:out value="${ board.accomoName }"/></button></th>
 						<th><button type="submit" class="list-btn"><c:out value="${ board.roomName }"/></button></th>
						<th><button type="submit" class="list-btn"><c:out value="${ board.bookUserName }"/></button></th>
						<th><button type="submit" class="list-btn"><c:out value="${ board.userPhone }"/></button></th> 
						<th><button type="submit" class="list-btn"><c:out value="${ board.bookPersonnel }"/></button></th> 
						<th><button type="submit" class="list-btn"><c:out value="${ board.bookCheckDate }"/></button></th>
						<th><button type="submit" class="list-btn"><c:out value="${ board.bookCheckoutDate }"/></button></th>
<%--  						<th><button type="submit" class="list-btn"><c:out value="${ board.bookApproveYn }"/></button></th>				
 --%>						<th>						
						<c:choose>
							<c:when test="${ board.bookStatusYNC eq 'N' && board.bookApproveYn eq 'Y' }">
								 <button type="submit" class="list-btn"><p style="color: orange;">결제 완료</p></button>
							</c:when>
							<c:when test="${ board.bookStatusYNC eq 'N' && board.bookApproveYn eq 'X' }">
								 <button type="submit" class="list-btn"><p style="color: red;">예약 거절</p></button>
							</c:when>
							<c:when test="${ board.bookStatusYNC eq 'C' && board.bookApproveYn eq 'X' }">
								 <button type="submit" class="list-btn"><p style="color: red;">예약 거절</p></button>
							</c:when>
							<c:when test="${ board.bookStatusYNC eq 'Y' && board.bookApproveYn eq 'Y'}">
								 <button type="submit" class="list-btn"><p style="color: green;">이용 완료</p></button>
							</c:when>
							<c:when test="${ board.bookStatusYNC eq 'C' && board.bookApproveYn eq 'Y'}">
								 <button type="submit" class="list-btn"><p style="color: red;">사용자 환불</p></button>
							</c:when>
							<c:when test="${ board.bookStatusYNC eq 'C' && board.bookApproveYn eq 'N'}">
								 <button type="submit" class="list-btn"><p style="color: red;">사용자 환불</p></button>
							</c:when>
	
						</c:choose>
						</th>
						</form>  
						<th>
							<form action="/bonggeuda/owner/reportWrite" method="get">
							<input type="hidden" name="userNo" value="${board.userNo}">
							
							<input type="hidden" name="ownerNo" value="${board.ownerNo}">
							
							<button type="submit" style="background-color: white;    border: 1px;">
							<button type="submit" style="background-color: white; border: 1px;">
							<img src="${pageContext.servletContext.contextPath }/resources/owner/icon/siren.png" style="width: 26px; height: 26px;">
							</button>
							</form>
						</th>
					</tr>
					 
					</c:forEach>
				</tbody>
			 </table>
			
			
			<%-- 페이지 처리 --%>
		<div class="pagingArea" align="center">
			<c:choose>
			    <c:when test="${ empty requestScope.searchValue }">
				    <button id="startPage"><<</button>
	
					<c:if test="${ requestScope.pageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo > 1 }">
						<button id="prevPage"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }" step="1">
						<c:if test="${ requestScope.pageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.pageInfo.pageNo ne p }">
							<button onclick="pageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.pageInfo.pageNo >= requestScope.pageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
						<button id="nextPage">></button>
					</c:if>
					
					<button id="maxPage">>></button> 
			     </c:when>
			    <c:otherwise>
   				    <button id="searchStartPage"><<</button>
	
					<c:if test="${ requestScope.pageInfo.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo > 1 }">
						<button id="searchPrevPage"><</button>
					</c:if>
		
					<c:forEach var="p" begin="${ requestScope.pageInfo.startPage }" end="${ requestScope.pageInfo.endPage }" step="1">
						<c:if test="${ requestScope.pageInfo.pageNo eq p }">
							<button disabled><c:out value="${ p }"/></button>
						</c:if>
						<c:if test="${ requestScope.pageInfo.pageNo ne p }">
							<button onclick="seachPageButtonAction(this.innerText);"><c:out value="${ p }"/></button>
						</c:if>
					</c:forEach>
					
					<c:if test="${ requestScope.pageInfo.pageNo >= requestScope.pageInfo.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
						<button id="searchNextPage">></button>
					</c:if>
					
					<button id="searchMaxPage">>></button> 
			    </c:otherwise>
			</c:choose>   
		</div>
		<%-- 페이지 처리 --%>
		</c:if>
		
		<c:if test="${ empty requestScope.bookList }">
			<div class="list_none" style="display: block;">
			<br>
			<b>예약 내역이 없습니다.</b>
			<br><br>
			</div>
		</c:if>
		</div>
	</div>
</div>

<script>
		const link = "${ pageContext.servletContext.contextPath }/owner/bookingPastList";
		//const searchLink = "${ pageContext.servletContext.contextPath }/board/search";
			
		if(document.getElementById("startPage")) {
			const $startPage = document.getElementById("startPage");
			$startPage.onclick = function() {
				location.href = link + "?currentPage=1";
			}
		}
		
		if(document.getElementById("prevPage")) {
			const $prevPage = document.getElementById("prevPage");
			$prevPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.pageInfo.pageNo - 1 }";
			}
		}
		
		if(document.getElementById("nextPage")) {
			const $nextPage = document.getElementById("nextPage");
			$nextPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.pageInfo.pageNo + 1 }";
			}
		}
		
		if(document.getElementById("maxPage")) {
			const $maxPage = document.getElementById("maxPage");
			$maxPage.onclick = function() {
				location.href = link + "?currentPage=${ requestScope.pageInfo.maxPage }";
			}
		}
		
		if(document.getElementById("searchStartPage")) {
			const $searchStartPage = document.getElementById("searchStartPage");
			$searchStartPage.onclick = function() {
				location.href = searchLink + "?currentPage=1&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchPrevPage")) {
			const $searchPrevPage = document.getElementById("searchPrevPage");
			$searchPrevPage.onclick = function() {
				location.href = searchLink + "?currentPage=${ requestScope.pageInfo.pageNo - 1 }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchNextPage")) {
			const $searchNextPage = document.getElementById("searchNextPage");
			$searchNextPage.onclick = function() {
				location.href = searchLink + "?currentPage=${ requestScope.pageInfo.pageNo + 1 }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}
		
		if(document.getElementById("searchMaxPage")) {
			const $searchMaxPage = document.getElementById("searchMaxPage");
			$searchMaxPage.onclick = function() {
				location.href = searchLink + "?currentPage=${ requestScope.pageInfo.maxPage }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
			}
		}
		
/* 		if(document.getElementsByTagName("th")) {
			
			const $tds = document.getElementsByTagName("th");
			for(let i = 0; i < $tds.length; i++) {

				$tds[i].onclick = function() {
					//상세보기 페이지로 이동
					location.href="${pageContext.servletContext.contextPath }/owner/question/content?qnaNo="
						+ this.parentNode.children[0].innerText
				}
			}
		} */
		
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text;
		}
		function seachPageButtonAction(text) {
			location.href = searchLink + "?currentPage=" + text + "&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
		}
</script>
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
</html></html>