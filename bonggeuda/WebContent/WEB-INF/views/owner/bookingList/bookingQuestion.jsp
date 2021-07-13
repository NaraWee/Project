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
.table tbody tr th {
    background: white;
}
table.table tr th {
    text-align: center;
    padding: 5px;
    line-height: 2.5;
    font-weight: 500;
    width: auto;
}
th a:hover {
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
				<li><a href="/bonggeuda/owner/mypage">마이페이지</a></li>
				<li><a href="/bonggeuda/"><i class="glyphicon glyphicon-user"></i>Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!--header-->
<!--//-->
<div class=" banner-booking">
    <!--상단 메뉴바-->
    <div class=" container">
        <h3>예약 관리</h3>
        <!---->
        <div class="clearfix"></div>
        <!--initiate accordion-->
        <script type="text/javascript">
            $(function () {
                var menu_ul = $('.menu > li > ul'),
                    menu_a = $('.menu > li > a');
                menu_ul.hide();
                menu_a.click(function (e) {
                    e.preventDefault();
                    if (!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul
                            .filter(':visible')
                            .slideUp('normal');
                        $(this)
                            .addClass('active')
                            .next()
                            .stop(true, true)
                            .slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this)
                            .next()
                            .stop(true, true)
                            .slideUp('normal');
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
							<li class="blog-list"><a href="/bonggeuda/owner/bookingPastList">지난 예약</a></li>
							<li class="blog-list" style=" font-size: 1.3em; font-weight: 600;"><a href="/bonggeuda/owner/book/question" style="color: #6eceda;">고객 문의</a></li>
						</ul>
                    </div>
			    </nav>
			<div class="tab">
			   <span class="tab_btn active">문의 내역</span>
			</div>
			<c:if test="${ !empty selectQuestion }">
			<table class="table table-hover" style="width: 1000px;">
				<thead>
					<tr>
						<th><b>번호</b></th>
						<th><b>제목</b></th>
						<th><b>작성자</b></th>
						<th><b>작성일</b></th>
						<th><b>답변</b></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="qlist" items="${ selectQuestion }">
					<tr>
						<th><c:out value="${ qlist.rowNum }"/></th>
						<th>
	 						<a href="${ pageContext.servletContext.contextPath }/owner/book/answer?qnaNo=${ qlist.qnaNo }">
								<c:out value="${ qlist.qnaTitle }"/>
							</a>
						</th>
						<th><c:out value="${ qlist.writer }"/></th>
						<th><c:out value="${ qlist.qnaDate }"/></th>
						<th>
						<c:choose>
							<c:when test="${ qlist.answerYn eq 'Y'}">
							답변 완료
							</c:when>
							<c:when test="${ qlist.answerYn eq 'N'}">
							대기중
							</c:when>
						</c:choose>
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
			
			<c:if test="${ empty selectQuestion }">
			<div class="list_none" style="display: block;">
			<br>
			<b>등록된 문의가 없습니다.</b>
			<br><br>
			<p>
				봉그다 숙박숙박은 회원님들의 소중한 의견에 귀 기울여
				<br>
				신속하고 정확하게 답변 드리도록 하겠습니다.
			</p>
			</div>
		</c:if>
			
		</div>
	</div>
</div>
<br><br><br><br><br>
<br><br><br><br><br>
<br><br><br><br><br>
<!--footer-->
<div class="footer-bottom">
    <div class="container">
        <div class="col-md-4 footer-logo">
            <h2>
                <a href="index.html">Bonggeuda</a>
            </h2>
        </div>
        <div class="col-md-8 footer-class">
            <p >© 2021 Bonggeuda SUKBAKSUKBAK. All Rights Reserved | Design by
                <a href="http://w3layouts.com/" target="_blank">Bonggeuda</a>
            </p>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
</div>
<script>
		const link = "${ pageContext.servletContext.contextPath }/owner/book/question";
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
<!--//footer-->
</body>
</html>