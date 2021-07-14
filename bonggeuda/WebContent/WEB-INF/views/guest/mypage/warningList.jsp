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
	td > a {
		color: black;
	}
	td > a:hover {
		color: #6eceda;
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
			<table class="table table-hover" style="margin-top: 20px; width: 740px;">
				<thead>
					<tr>
						<th style="text-align: center;"><b>번호</b></th>
						<th style="text-align: center;"><b>제목</b></th>
						<th style="text-align: center;"><b>신고업체</b></th>
						<th style="text-align: center;"><b>작성일</b></th>
						<th style="text-align: center;"><b>처리여부</b></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="arr" items="${ userreportList }" varStatus="st">
						<tr>
							<td style="text-align: center;"><c:out value="${ arr.rowNum }"/></td>
							<td>							
								<a href="${ pageContext.servletContext.contextPath }/userreportcontent/select?reportedNo=${ arr.reportNo }"><c:out value="${ arr.reportTitle }"/></a>
							</td>
							<td><c:out value="${ arr.accomoName }"/></td>
							<td><c:out value="${ arr.reportDate }"/></td>
							<td><c:out value="${ arr.reportStatus }"/></td>
						</tr> 
					</c:forEach>  
				</tbody>
			 </table>
			</div>
		</div>
	</div>
	</div>


	<div class="clearfix"> </div>
<!-- 	<nav>
		<ul class="pagination">
		  <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
		  <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		  <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
	   </ul>
	   </nav> -->
	   
	   <div class="pagingArea" align="center">
	   	<nav>
			<ul class="pagination">
	   	
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
			</ul>
	   	</nav>  
		</div>
	   
	   
	   <script>
		const link = "${ pageContext.servletContext.contextPath }/userreportlist/select";
			
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
		
		function pageButtonAction(text) {
			location.href = link + "?currentPage=" + text;
		}
		function seachPageButtonAction(text) {
			location.href = searchLink + "?currentPage=" + text + "&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
		}
		</script>
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