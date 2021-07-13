<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<style>
 table.table tr th{
         text-align: center;
         padding: 5px;
         line-height: 2.5;
         font-weight: 500;
         width: auto;
     }
div.tab, div.tab-content {
	margin-left: 25%;
	margin-right: 5%;
}
</style>
<title>Real Home A Real Estate Category Flat Bootstarp Resposive
	Website Template | Blog :: w3layouts</title>
<link
	href="${pageContext.servletContext.contextPath }/resources/admin/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="${pageContext.servletContext.contextPath }/resources/admin/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script
	src="${pageContext.servletContext.contextPath }/resources/admin/js/scripts.js"></script>
<link
	href="${pageContext.servletContext.contextPath }/resources/admin/css/styles.css"
	rel="stylesheet">
<!--//menu-->
<!--theme-style-->
<link
	href="${pageContext.servletContext.contextPath }/resources/admin/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 




</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body style="background: white;">
	<!--header-->
	<div class="header">
		<div class="container">
			<!--logo-->
			<div class="logo">
				<h1>
					<a href="index.html">Bonggeuda</a>
				</h1>
			</div>
			<!--//logo-->
			<div class="top-nav">
				<ul class="right-icons">
					<li><span ><a  href="${ pageContext.servletContext.contextPath }/user/list">사용자관리</a></span></li>
            <li onclick="location.href='${pageContext.servletContext.contextPath}/owner/list'"><a>업체관리</a></li>
            <li><a  href="${ pageContext.servletContext.contextPath }/user/booklist">예약현황</a></li>
            <li onclick="location.href='${pageContext.servletContext.contextPath}/sales/paylist'"><a>매출관리</a></li>
            <li><a  href="${ pageContext.servletContext.contextPath }/qna/list">문의&신고</a></li>
            <li><a  href="${ pageContext.servletContext.contextPath }/notice/list">공지&이벤트</a></li>
				</ul>


				<div class="clearfix"></div>
				<!---pop-up-box---->


			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!--//-->
	<!-- <div class=" banner-buying">
		<div class=" container">
			<h3>
				<span>매출 관리</span>
			</h3>

			<div class="clearfix"></div>
		</div>
	</div> -->
	<!--//header-->
	<!--blog-->
	<div class="blog">
		<div class="container">
			<div class="blog-list">
				<nav>
					<div class="col-md-3 blog-sidebar">
						<ul>
							<li class="blog-list" onclick="location.href='${pageContext.servletContext.contextPath}/sales/canclelist'"><a>결제 취소 내역</a></li>
							<li class="blog-list" onclick="location.href='${pageContext.servletContext.contextPath}/sales/stlrequest'"><a>업체정산</a></li>
							<li class="blog-list" onclick="location.href='${pageContext.servletContext.contextPath}/sales/paylist'"><a style="color: #6eceda; font-size: 1.3em; font-weight: 600;">사용자
									결제 내역</a></li>
							<li class="blog-list" onclick="location.href='${pageContext.servletContext.contextPath}/sales/taxrequest'"><a>세금 계산서 발행</a></li>
						</ul>
				</nav>
				<table class="table" style="width: 800px;">
					<div class="tab">
						<span class="tab_btn active" data-toggle="tab">사용자 결제 내역</span>
					</div>
					<thead>
						<tr>
							<th>결제번호</th>
							<th>유저명</th>
							<th>결제방식</th>
							<th>결제일</th>
							<th>결제금액</th>
							<th>숙소명</th>
							<!-- <th>업체 운영 숙소 정보</th> -->
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${ empty requestScope.searchPay}">

								<c:forEach var="pay" items="${requestScope.payList }">
									<tr>
										<td><c:out value="${pay.paymentNo }"></c:out></td>
										<td><c:out value="${pay.userName }"></c:out></td>
										<td><c:out value="${pay.paymentMethod }"></c:out></td>
										<td><c:out value="${pay.paymentTime }"></c:out></td>
										<td><c:out value="${pay.paymentAmount }"></c:out></td>
										<td><c:out value="${pay.accomoName }"></c:out></td>
									</tr>
								</c:forEach>

							</c:when>

							<c:otherwise>
								<tr>
									<td><c:out value="${searchOwner.ownerNo }"></c:out></td>
									<td><c:out value="${searchOwner.ownerId }"></c:out></td>
									<td><c:out value="${searchOwner.signDate }"></c:out></td>
									<td><c:out value="${searchOwner.phone }"></c:out></td>
								</tr>
							</c:otherwise>

						</c:choose>
					</tbody>
				</table>
				<form
					action="${pageContext.servletContext.contextPath }/owner/search"
					method="get">
					<label style="color: #6eceda; font-size: 1.3em; font-weight: 600;">유저명
						 검색</label> <input type="text" name="searchValue" style="width: 150px;">
					<button type="submit" id="searchButton" style="margin-right: 15%">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</form>
			</div>


			<div class="pagingArea" align="center" style="margin-right: 20%">
				<c:choose>
					<c:when test="${ empty requestScope.searchValue }">
						<button id="startPage"><<</button>

						<c:if test="${ requestScope.pageInfo.pageNo <= 1 }">
							<button disabled><</button>
						</c:if>
						<c:if test="${ requestScope.pageInfo.pageNo > 1 }">
							<button id="prevPage"><</button>
						</c:if>

						<c:forEach var="p" begin="${ requestScope.pageInfo.startPage }"
							end="${ requestScope.pageInfo.endPage }" step="1">
							<c:if test="${ requestScope.pageInfo.pageNo eq p }">
								<button disabled>
									<c:out value="${ p }" />
								</button>
							</c:if>
							<c:if test="${ requestScope.pageInfo.pageNo ne p }">
								<button onclick="pageButtonAction(this.innerText);">
									<c:out value="${ p }" />
								</button>
							</c:if>
						</c:forEach>

						<c:if
							test="${ requestScope.pageInfo.pageNo >= requestScope.pageInfo.maxPage }">
							<button disabled>></button>
						</c:if>
						<c:if
							test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
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

						<c:forEach var="p" begin="${ requestScope.pageInfo.startPage }"
							end="${ requestScope.pageInfo.endPage }" step="1">
							<c:if test="${ requestScope.pageInfo.pageNo eq p }">
								<button disabled>
									<c:out value="${ p }" />
								</button>
							</c:if>
							<c:if test="${ requestScope.pageInfo.pageNo ne p }">
								<button onclick="seachPageButtonAction(this.innerText);">
									<c:out value="${ p }" />
								</button>
							</c:if>
						</c:forEach>

						<c:if
							test="${ requestScope.pageInfo.pageNo >= requestScope.pageInfo.maxPage }">
							<button disabled>></button>
						</c:if>
						<c:if
							test="${ requestScope.pageInfo.pageNo < requestScope.pageInfo.maxPage }">
							<button id="searchNextPage">></button>
						</c:if>

						<button id="searchMaxPage">>></button>
					</c:otherwise>
				</c:choose>
			</div>
			</nav>

			<script>
				$("#rmList")
						.click(
								function() {
									location.href = "${pageContext.servletContext.contextPath}/owner/rmlist";
								});

				$("#ownerList")
						.click(
								function() {
									location.href = "${pageContext.servletContext.contextPath}/owner/list";
								});

				$("#bList")
						.click(
								function() {
									location.href = "${pageContext.servletContext.contextPath}/owner/blist";
								});
			</script>

			<script>
				const link = "${ pageContext.servletContext.contextPath }/sales/paylist";
				const searchLink = "${ pageContext.servletContext.contextPath }/owner/search";

				if (document.getElementById("startPage")) {
					const $startPage = document.getElementById("startPage");
					$startPage.onclick = function() {
						location.href = link + "?currentPage=1";
					}
				}

				if (document.getElementById("prevPage")) {
					const $prevPage = document.getElementById("prevPage");
					$prevPage.onclick = function() {
						location.href = link
								+ "?currentPage=${ requestScope.pageInfo.pageNo - 1 }";
					}
				}

				if (document.getElementById("nextPage")) {
					const $nextPage = document.getElementById("nextPage");
					$nextPage.onclick = function() {
						location.href = link
								+ "?currentPage=${ requestScope.pageInfo.pageNo + 1 }";
					}
				}

				if (document.getElementById("maxPage")) {
					const $maxPage = document.getElementById("maxPage");
					$maxPage.onclick = function() {
						location.href = link
								+ "?currentPage=${ requestScope.pageInfo.maxPage }";
					}
				}

				if (document.getElementById("searchStartPage")) {
					const $searchStartPage = document
							.getElementById("searchStartPage");
					$searchStartPage.onclick = function() {
						location.href = searchLink
								+ "?currentPage=1&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
					}
				}

				if (document.getElementById("searchPrevPage")) {
					const $searchPrevPage = document
							.getElementById("searchPrevPage");
					$searchPrevPage.onclick = function() {
						location.href = searchLink
								+ "?currentPage=${ requestScope.pageInfo.pageNo - 1 }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
					}
				}

				if (document.getElementById("searchNextPage")) {
					const $searchNextPage = document
							.getElementById("searchNextPage");
					$searchNextPage.onclick = function() {
						location.href = searchLink
								+ "?currentPage=${ requestScope.pageInfo.pageNo + 1 }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
					}
				}

				if (document.getElementById("searchMaxPage")) {
					const $searchMaxPage = document
							.getElementById("searchMaxPage");
					$searchMaxPage.onclick = function() {
						location.href = searchLink
								+ "?currentPage=${ requestScope.pageInfo.maxPage }&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
					}
				}

				if (document.getElementsByTagName("td")) {

					const $tds = document.getElementsByTagName("td");
					for (let i = 0; i < $tds.length; i++) {

						$tds[i].onmouseenter = function() {
							this.parentNode.style.color = "#6eceda";
							this.parentNode.style.cursor = "pointer";
						}

						$tds[i].onmouseout = function() {
							this.parentNode.style.color = "black";
						}

						$tds[i].onclick = function() {

							location.href = "${pageContext.servletContext.contextPath}"
									+ "/sales/payinfo?paymentNo="
									+ this.parentNode.children[0].innerText;
						}

					}

				}

				function pageButtonAction(text) {
					location.href = link + "?currentPage=" + text;
				}

				function seachPageButtonAction(text) {
					location.href = searchLink
							+ "?currentPage="
							+ text
							+ "&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
				}
			</script>
		</div>

	</div>
	<!--//blog-->

</body>
</html>