<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
div.tab, div.tab-content {
	margin-left: 25%;
	margin-right: 5%;
}
</style>
<title>Settlement</title>
<link
	href="${pageContext.servletContext.contextPath }/resources/admin/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<%-- <script
   src="${pageContext.servletContext.contextPath }/resources/js/jquery.min.js"></script>

<script
   src="${pageContext.servletContext.contextPath }/resources/js/scripts.js"></script>
 --%>
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

			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="blog">
		<div class="container">
			<div class="blog-list">
				<nav>
					<div class="col-md-3 blog-sidebar">
						<ul>
							<li class="blog-list" onclick="location.href='${pageContext.servletContext.contextPath}/sales/canclelist'"><a>결제 취소 내역</a></li>
							<li class="blog-list" onclick="location.href='${pageContext.servletContext.contextPath}/sales/stlrequest'"><a style="color: #6eceda; font-size: 1.3em; font-weight: 600;">업체정산</a></li>
							<li class="blog-list" onclick="location.href='${pageContext.servletContext.contextPath}/sales/paylist'"><a>사용자
									결제 내역</a></li>
							<li class="blog-list" onclick="location.href='${pageContext.servletContext.contextPath}/sales/taxrequest'"><a>세금 계산서 발행</a></li>
						</ul>
				</nav>

					<table class="table table-bordered" style="width: 850px;">
					
						<div class="tab">


						<c:choose>
							<c:when test="${empty requestScope.prePerList }">

								<span class="tab_btn active"><c:out value="${stlList[0].accomoName }"></c:out> 의 정산내역</span>
							</c:when>
							<c:otherwise>

								<span class="tab_btn active"><c:out value="${prePerList[0].accomoName }"></c:out> 의 정산내역</span>

							</c:otherwise>

						</c:choose>

					</div>
						<tr>
							<th>정산일</th>
							<th>정산 합 판매액</th>
							<th>정산 합 수수료</th>
							<th>정산 합 단가</th>
							<th>정산 합 공급가</th>
							<th>정산 합 세액</th>
							<th>정산액</th>
							<th>지급상태</th>
						</tr>
						
						<c:forEach var="stl" items="${requestScope.stlList }">
							<tr>
								<td><c:out value="${stl.stlDate }"></c:out></td>
								<td><c:out value="${stl.monthAmount }"></c:out></td>
								<td><c:out value="${stl.monthFee }"></c:out></td>
								<td><c:out value="${stl.preTaxAmount }"></c:out></td>
								<td><c:out value="${stl.supplyPrice }"></c:out></td>
								<td><c:out value="${stl.monthTaxPrice }"></c:out></td>
								<td><c:out value="${stl.finalStlAmount }"></c:out></td>
								<td>지급완료</td>
							</tr>

						</c:forEach>

					</table>

				<div class="pagingArea" align="center" style="margin-left: 6%">
					<button id="startPage1"><<</button>

					<c:if test="${ requestScope.pageInfo1.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.pageInfo1.pageNo > 1 }">
						<button id="prevPage1"><</button>
					</c:if>

					<c:forEach var="p" begin="${ requestScope.pageInfo1.startPage }"
						end="${ requestScope.pageInfo1.endPage }" step="1">
						<c:if test="${ requestScope.pageInfo1.pageNo eq p }">
							<button disabled>
								<c:out value="${ p }" />
							</button>
						</c:if>
						<c:if test="${ requestScope.pageInfo1.pageNo ne p }">
							<button onclick="pageButtonAction1(this.innerText);">
								<c:out value="${ p }" />
							</button>
						</c:if>
					</c:forEach>

					<c:if
						test="${ requestScope.pageInfo1.pageNo >= requestScope.pageInfo1.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if
						test="${ requestScope.pageInfo1.pageNo < requestScope.pageInfo1.maxPage }">
						<button id="nextPage1">></button>
					</c:if>

					<button id="maxPage1">>></button>

				</div>



				<br><br>
					<table class="table table-bordered"
						style="width: 850px; margin-left: 285px;">
						<div class="tab">


						<c:choose>
							<c:when test="${empty requestScope.prePerList }">

								<span class="tab_btn active"><c:out value="${stlList[0].accomoName }"></c:out> 의 미정산 매출 내역</span>
							</c:when>
							<c:otherwise>

								<span class="tab_btn active"><c:out value="${prePerList[0].accomoName }"></c:out> 의 미정산 매출 내역</span>

							</c:otherwise>

						</c:choose>



						<c:choose>
							<c:when test="${empty requestScope.prePerList }">
								
								<button style="height: 40px">정산할 매출 내역이 없습니다.</button>
							
							</c:when>
							<c:otherwise>
							
								<button id="stlButton" style="height: 40px">미정산건 정산하기</button>
							
							</c:otherwise>
						
						</c:choose>
						
						</div>

						<tr>
							<th>매출 일</th>
							<th>매출 객실</th>
							<th>건 판매액</th>
							<th>건 수수료</th>
							<th>건 단가</th>
							<th>공급가</th>
							<th>건 세액</th>
							<th>건 정산 예정액</th>
							<th>지급상태</th>
						</tr>
						<c:forEach var="pre" items="${requestScope.prePerList }">
							<tr>
								<td><c:out value="${pre.saleDate }"></c:out></td>
								<td><c:out value="${pre.roomName }"></c:out></td>
								<td><c:out value="${pre.salePrice }"></c:out></td>
								<td><c:out value="${pre.fee }"></c:out></td>
								<td><c:out value="${pre.preTaxPrice }"></c:out></td>
								<td><c:out value="${pre.supplyPrice }"></c:out></td>
								<td><c:out value="${pre.taxPrice }"></c:out></td>
								<td><c:out value="${pre.finalStlPrice }"></c:out></td>
								<td>지급대기</td>
							</tr>
						</c:forEach>
					</table>

				<div class="pagingArea" align="center" style="margin-left: 6%">
					<button id="startPage2"><<</button>

					<c:if test="${ requestScope.pageInfo2.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.pageInfo2.pageNo > 1 }">
						<button id="prevPage2"><</button>
					</c:if>

					<c:forEach var="p" begin="${ requestScope.pageInfo2.startPage }"
						end="${ requestScope.pageInfo2.endPage }" step="1">
						<c:if test="${ requestScope.pageInfo2.pageNo eq p }">
							<button disabled>
								<c:out value="${ p }" />
							</button>
						</c:if>
						<c:if test="${ requestScope.pageInfo2.pageNo ne p }">
							<button onclick="pageButtonAction2(this.innerText);">
								<c:out value="${ p }" />
							</button>
						</c:if>
					</c:forEach>

					<c:if
						test="${ requestScope.pageInfo2.pageNo >= requestScope.pageInfo2.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if
						test="${ requestScope.pageInfo2.pageNo < requestScope.pageInfo2.maxPage }">
						<button id="nextPage2">></button>
					</c:if>

					<button id="maxPage2">>></button>

				</div>

				<br> <br>
					<table class="table table-bordered"
						style="width: 850px; margin-left: 285px;">
						<div class="tab">
						
						
						<c:choose>
							<c:when test="${empty requestScope.prePerList }">

								<span class="tab_btn active"><c:out value="${stlList[0].accomoName }"></c:out> 의 건별 정산내역</span>
							</c:when>
							<c:otherwise>

								<span class="tab_btn active"><c:out value="${prePerList[0].accomoName }"></c:out> 의 건별 정산내역</span>

							</c:otherwise>

						</c:choose>
						
						</div>
						<tr>
							<th>정산 일</th>
							<th>매출 일</th>
							<th>매출 객실</th>
							<th>건 판매액</th>
							<th>건 수수료</th>
							<th>건 단가</th>
							<th>공급가</th>
							<th>건 세액</th>
							<th>정산액</th>
							<th>지급상태</th>
						</tr>
						<c:forEach var="stl" items="${requestScope.stlPerList }">
							<tr>
								<td><c:out value="${stl.stlDate }"></c:out></td>
								<td><c:out value="${stl.saleDate }"></c:out></td>
								<td><c:out value="${stl.roomName }"></c:out></td>
								<td><c:out value="${stl.salePrice }"></c:out></td>
								<td><c:out value="${stl.fee }"></c:out></td>
								<td><c:out value="${stl.preTaxPrice }"></c:out></td>
								<td><c:out value="${stl.supplyPrice }"></c:out></td>
								<td><c:out value="${stl.taxPrice }"></c:out></td>
								<td><c:out value="${stl.finalStlPrice }"></c:out></td>
								<td>지급완료</td>
							</tr>

						</c:forEach>
					</table>
				<div class="pagingArea" align="center" style="margin-left: 6%">
					<button id="startPage3"><<</button>

					<c:if test="${ requestScope.pageInfo3.pageNo <= 1 }">
						<button disabled><</button>
					</c:if>
					<c:if test="${ requestScope.pageInfo3.pageNo > 1 }">
						<button id="prevPage3"><</button>
					</c:if>

					<c:forEach var="p" begin="${ requestScope.pageInfo3.startPage }"
						end="${ requestScope.pageInfo3.endPage }" step="1">
						<c:if test="${ requestScope.pageInfo3.pageNo eq p }">
							<button disabled>
								<c:out value="${ p }" />
							</button>
						</c:if>
						<c:if test="${ requestScope.pageInfo3.pageNo ne p }">
							<button onclick="pageButtonAction3(this.innerText);">
								<c:out value="${ p }" />
							</button>
						</c:if>
					</c:forEach>

					<c:if
						test="${ requestScope.pageInfo3.pageNo >= requestScope.pageInfo3.maxPage }">
						<button disabled>></button>
					</c:if>
					<c:if
						test="${ requestScope.pageInfo3.pageNo < requestScope.pageInfo3.maxPage }">
						<button id="nextPage3">></button>
					</c:if>

					<button id="maxPage3">>></button>

				</div>
			</div>

			<div class="clearfix"></div>
		</div>
	</div>

	<script>
		const link = "${ pageContext.servletContext.contextPath }/sales/stlinfo";

		if (document.getElementById("stlButton")) {
			const $stlButton = document.getElementById("stlButton");
			$stlButton.onclick = function() {
				location.href = "${ pageContext.servletContext.contextPath }/sales/stl?accomoNo=${prePerList[0].accomoNo}";
			}
		}
		
		if (document.getElementById("statusButton")) {
			const $statusButton = document.getElementById("statusButton");
			$statusButton.onclick = function() {
				location.href = "${ pageContext.servletContext.contextPath }/sales/stl?accomoNo=${stlList[0].accomoNo}&status=Y";
			}
		}

		if (document.getElementById("startPage1")) {
			const $startPage = document.getElementById("startPage1");
			$startPage.onclick = function() {
				location.href = link
						+ "?currentPage1=1&currentPage2=${pageInfo2.pageNo}&currentPage3=${pageInfo3.pageNo}&accomoNo=${prePerList[0].accomoNo}";
			}
		}

		if (document.getElementById("prevPage1")) {
			const $prevPage = document.getElementById("prevPage1");
			$prevPage.onclick = function() {
				location.href = link
						+ "?currentPage1=${ requestScope.pageInfo1.pageNo - 1 }&currentPage2=${pageInfo2.pageNo}&currentPage3=${pageInfo3.pageNo}&accomoNo=${stlList[0].accomoNo}";

			}
		}

		if (document.getElementById("nextPage1")) {
			const $nextPage = document.getElementById("nextPage1");
			$nextPage.onclick = function() {
				location.href = link
						+ "?currentPage1=${ requestScope.pageInfo1.pageNo + 1 }&currentPage2=${pageInfo2.pageNo}&currentPage3=${pageInfo3.pageNo}&accomoNo=${stlList[0].accomoNo}";
			}
		}

		if (document.getElementById("maxPage1")) {
			const $maxPage = document.getElementById("maxPage1");
			$maxPage.onclick = function() {
				location.href = link
						+ "?currentPage1=${ requestScope.pageInfo1.maxPage }&currentPage2=${pageInfo2.pageNo}&currentPage3=${pageInfo3.pageNo}&accomoNo=${stlList[0].accomoNo}";
			}
		}

		function pageButtonAction1(text) {
			location.href = link
					+ "?currentPage1="
					+ text
					+ "&currentPage2=${pageInfo2.pageNo}&currentPage3=${pageInfo3.pageNo}&accomoNo=${stlList[0].accomoNo}";
		}

		if (document.getElementById("startPage2")) {
			const $startPage = document.getElementById("startPage2");
			$startPage.onclick = function() {
				location.href = link
						+ "?currentPage2=1&currentPage1=${pageInfo1.pageNo}&currentPage3=${pageInfo3.pageNo}&accomoNo=${stlList[0].accomoNo}";
			}
		}

		if (document.getElementById("prevPage2")) {
			const $prevPage = document.getElementById("prevPage2");
			$prevPage.onclick = function() {
				location.href = link
						+ "?currentPage2=${ requestScope.pageInfo2.pageNo - 1 }&currentPage1=${pageInfo1.pageNo}&currentPage3=${pageInfo3.pageNo}&accomoNo=${stlList[0].accomoNo}";

			}
		}

		if (document.getElementById("nextPage2")) {
			const $nextPage = document.getElementById("nextPage2");
			$nextPage.onclick = function() {
				location.href = link
						+ "?currentPage2=${ requestScope.pageInfo2.pageNo + 1 }&currentPage1=${pageInfo1.pageNo}&currentPage3=${pageInfo3.pageNo}&accomoNo=${stlList[0].accomoNo}";
			}
		}

		if (document.getElementById("maxPage2")) {
			const $maxPage = document.getElementById("maxPage2");
			$maxPage.onclick = function() {
				location.href = link
						+ "?currentPage2=${ requestScope.pageInfo2.maxPage }&currentPage1=${pageInfo1.pageNo}&currentPage3=${pageInfo3.pageNo}&accomoNo=${stlList[0].accomoNo}";
			}
		}

		function pageButtonAction2(text) {
			location.href = link
					+ "?currentPage2="
					+ text
					+ "&currentPage1=${pageInfo1.pageNo}&currentPage3=${pageInfo3.pageNo}&accomoNo=${stlList[0].accomoNo}";
		}

		if (document.getElementById("startPage3")) {
			const $startPage = document.getElementById("startPage3");
			$startPage.onclick = function() {
				location.href = link
						+ "?currentPage3=1&currentPage1=${pageInfo1.pageNo}&currentPage2=${pageInfo2.pageNo}&accomoNo=${stlList[0].accomoNo}";
			}
		}

		if (document.getElementById("prevPage3")) {
			const $prevPage = document.getElementById("prevPage3");
			$prevPage.onclick = function() {
				location.href = link
						+ "?currentPage3=${ requestScope.pageInfo3.pageNo - 1 }&currentPage1=${pageInfo1.pageNo}&currentPage2=${pageInfo2.pageNo}&accomoNo=${stlList[0].accomoNo}";

			}
		}

		if (document.getElementById("nextPage3")) {
			const $nextPage = document.getElementById("nextPage3");
			$nextPage.onclick = function() {
				location.href = link
						+ "?currentPage3=${ requestScope.pageInfo3.pageNo + 1 }&currentPage1=${pageInfo1.pageNo}&currentPage2=${pageInfo2.pageNo}&accomoNo=${stlList[0].accomoNo}";
			}
		}

		if (document.getElementById("maxPage3")) {
			const $maxPage = document.getElementById("maxPage3");
			$maxPage.onclick = function() {
				location.href = link
						+ "?currentPage3=${ requestScope.pageInfo3.maxPage }&currentPage1=${pageInfo1.pageNo}&currentPage2=${pageInfo2.pageNo}&accomoNo=${stlList[0].accomoNo}";
			}
		}

		function pageButtonAction3(text) {
			location.href = link
					+ "?currentPage3="
					+ text
					+ "&currentPage1=${pageInfo1.pageNo}&currentPage2=${pageInfo2.pageNo}&accomoNo=${stlList[0].accomoNo}";
		}
	</script>

</body>
</html>