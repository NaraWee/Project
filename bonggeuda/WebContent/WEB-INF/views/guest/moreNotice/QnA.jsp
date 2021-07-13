<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
		
	div.tab, div.tab-content {
    	margin-left: 25%;
    	width: 740px;
	}

	div.tab_each, div.list_none {
		margin-left: 25%;
    	width: 740px;
	}

	.inquiry .tab_each{display:none}
	.inquiry .tab_each:first-child{display:block}
	.inquiry .tab{display:none}
	.tab_each{clear:both;border-top:1px solid rgba(0,0,0,0.08)}

	table.table2{
    	border-collapse: separate;
    	border-spacing: 1px;
    	text-align: left;
    	line-height: 1.5;
		margin-bottom: 20px;
		width: 100%;
    }
	table.table2 tr {
        padding: 8px;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
    }
    table.table2 td {
        padding: 8px;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
    }
	textarea {
		resize: none;
		width: 720px;
	}

	.submit_QnA {
		width: 100px;
		border-radius: 10px;
		background: #6eceda;
		color: white;
		border-style: none;
		box-shadow: 0 3px 0 #0e8c73;
		height: 35px;
	}
	.submit_QnA:hover {
		background-color: #4aa9b6;
		box-shadow: 0 3px 0 #23a188;
	}
	.submit_QnA:active {
		box-shadow: none;
	}
	td > a {
		color: black;
	}
	td > a:hover {
		color: #6eceda;
	}

</style>
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	<h3><span>더보기</span></h3> 

	<div class="clearfix"> </div>      		
	</div>
</div>
<!--//header-->
<!--blog-->
<div class="blog" style="padding-bottom: 20px;">
<div class="container">
	<h3></h3>
	<div class="blog-list">
		<nav>
		<div class="col-md-3 blog-sidebar">
			<ul style="padding-top: 70px;">
				<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/usernotice/select">공지사항</a></li>
				<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/userevent/select">이벤트</a></li>
				<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/userfaq/select">자주 묻는 질문</a></li>
				<li class="blog-list active" style="font-size: 1.3em; font-weight: 600;"><a href="${ pageContext.servletContext.contextPath }/userqnalist/select" style="color: #6eceda;">1:1 문의</a></li>
				<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/userpolicy/select">약관 및 정책</a></li>
			</ul>
		</div>
		</nav>
	</div>


	<div id="content" class="sub_wrap more_wrap">
		<div class="align_rt">
			<!-- Tab -->
			<div class="tab">

				<span class="tab_btn active" data-toggle="tab" href="#home" >나의 문의 내역</span>
				<span class="tab_btn" data-toggle="tab" href="#menu1">새 문의 작성</span>
			</div>
			<% int i=0; %>
			<div class="tab-content">
				<c:if test="${ empty requestScope.userqna  }">
					<div id="home" class="tab-pane fade in active">
			  		<br>등록된 1:1 문의가 없습니다.<br><br>
			  		<b>봉그다 숙박숙박은 회원님들의 소중한 의견에 귀기울여 <br> 신속하고 정확하게 답변드리도록 하겠습니다.</b>
					</div>
				</c:if>
				<c:if test="${ !empty requestScope.userqna }">
					<div id="home" class="tab-pane fade in active">
						<table class="table table-hover" style="margin-top: 20px; width: 740px;">
							<thead>
								<tr>
									<th style="text-align: center;"><b>번호</b></th>
									<th style="text-align: center;"><b>제목</b></th>
									<th style="text-align: center;"><b>문의처</b></th>
									<th style="text-align: center;"><b>작성일</b></th>
									<th style="text-align: center;"><b>답변</b></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="arr" items="${ userqna }" varStatus="st">
								<% i++; %>
						   		<tr>
									<td style="text-align: center;"><%= i %></td>
									<td>							
										<a href="${ pageContext.servletContext.contextPath }/userqnacontent/select?qnaNo=${ arr.qnaNo }&qnaWriter=${ arr.writer }"><c:out value="${ arr.qnaTitle }"/></a>
									</td>
									<td><c:out value="${ arr.writer }"/></td>
									<td><c:out value="${ arr.qnaDate }"/></td>
									<td><c:out value="${ arr.answerYn }"/></td>
								</tr> 
								</c:forEach>  
							</tbody>
				 		</table>
					</div>
				</c:if> 

				<div id="menu1" class="tab-pane fade">

					<form method = "post" action = "${ pageContext.servletContext.contextPath }/adminqna/insert">
						<table  style="padding-top:50px;" align = center width=100% border=0 cellpadding=2 >
							<tr>
								<td bgcolor=white>
									<table class = "table2">
										<tr>
											<td style="width: 50px;">제목</td>
											<td><select id="QnAType" name="QnAType" style="width: 500px;">
												<option value="교환/취소/환불 문의">교환/취소/환불 문의</option>
												<option value="회원정보 수정 및 탈퇴 문의">회원정보 수정 및 탈퇴 문의</option>
												<option value="기타 문의">기타 문의</option>
                           	 					</select>
											</td>
										</tr>
				
										<tr>
										<!-- <td>내용</td> -->
											<td colspan="2"><textarea id="QnAContent" name ="QnAContent" cols=85 rows=15 placeholder="관리자 문의 작성공간입니다. 문의 내용을 입력해주세요"></textarea></td>
										</tr>
									</table>
				
									<center>
										<button class="submit_QnA" onclick="notice();">작성</button>
									</center>
								</td>
							</tr>
						</table>
					</form>
				</div>
		  	</div>
		</div>

		<script>
			function notice(){
				alert("문의가 등록 되었습니다.")
			}
		</script>

		<script>
			let targetLink = document.querySelectorAll('.tab span');
			for(var i = 0; i < targetLink.length; i++) {
				targetLink[i].addEventListener('click', function(e){
        			e.preventDefault();
					for(var x = 0; x < targetLink.length; x++){
            			targetLink[x].classList.remove('active');
            			e.target.classList.add('active');
        			}
				}
			)};
		</script>

	</div>
	
	
	<div class="clearfix" style="margin-bottom: 100px;"> </div>
	
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
		const link = "${ pageContext.servletContext.contextPath }/userqnalist/select";
			
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