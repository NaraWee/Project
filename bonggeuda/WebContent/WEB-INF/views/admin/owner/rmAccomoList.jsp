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
<title>RM Accomo List</title>
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
				<span>업체 관리</span>
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
							<li class="blog-list" id="rmList"
								style="color: #6eceda; font-size: 1.3em; font-weight: 600;">숙소
								등록신청 리스트</li>
							<li class="blog-list" id="ownerList"><a>업체 정보 확인</a></li>
							<li class="blog-list" id="bList"><a>블랙리스트 업체</a></li>
						</ul>
				</nav>
				<table class="table" style="width: 800px;">
					<div class="tab">
						<span class="tab_btn active" data-toggle="tab">숙소 등록/수정 신청
							리스트</span>

						<form id="sortForm"
							action="${ pageContext.servletContext.contextPath }/owner/rmlist"
							method="get">
							<c:choose>
								<c:when test="${ !empty requestScope.sortCondition1 }">
									<select id="sortCondition1" name="sortCondition1">
										<option value="Y"
											<c:if test="${requestScope.sortCondition1 eq 'Y'}">selected</c:if>>처리
											완료</option>
										<option value="N"
											<c:if test="${requestScope.sortCondition1 eq 'N'}">selected</c:if>>처리
											대기</option>
									</select>
								</c:when>
								<c:otherwise>
									<select id="sortCondition" name="sortCondition1">
										<option value="N">처리 대기</option>
										<option value="Y">처리 완료</option>
									</select>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${ !empty requestScope.sortCondition2 }">
									<select id="sortCondition2" name="sortCondition2">
										<option value="EN"
											<c:if test="${requestScope.sortCondition2 eq 'EN'}">selected</c:if>>등록</option>
										<option value="RM"
											<c:if test="${requestScope.sortCondition2 eq 'RM'}">selected</c:if>>수정</option>
									</select>
								</c:when>
								<c:otherwise>
									<select id="sortCondition2" name="sortCondition2">
										<option value="EN">등록</option>
										<option value="RM">수정</option>
									</select>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${ !empty requestScope.sortCondition3 }">
									<select id="sortCondition3" name="sortCondition3">
										<option value="accomo"
											<c:if test="${requestScope.sortCondition3 eq 'accomo'}">selected</c:if>>숙소</option>
										<option value="room"
											<c:if test="${requestScope.sortCondition3 eq 'room'}">selected</c:if>>객실</option>
									</select>
								</c:when>
								<c:otherwise>
									<select id="sortCondition3" name="sortCondition3">
										<option value="accomo">숙소</option>
										<option value="room">객실</option>
									</select>
								</c:otherwise>
							</c:choose>


							<button type="submit">정렬</button>
						</form>

					</div>
					<thead>
					<c:choose>
						<c:when test="${requestScope.sortCondition3 eq 'accomo'}">
							<th>요청 번호</th>
							<th>업체 번호</th>
							<th>등록/수정</th>
							<th>대표자명</th>
							<th>상호명</th>
							<th>업종</th>
							<th>처리 상태</th>
						</c:when>
						<c:otherwise>
							<th>요청 번호</th>
							<th>등록/수정</th>
							<th>객실 가격</th>
							<th>객실명</th>
							<th>인원수</th>
							<th>처리상태</th>
							
						</c:otherwise>
					
					</c:choose>
					
	
					</thead>
					<tbody>

						<c:choose>
							<c:when test="${ empty requestScope.searchRmInfo}">
								<c:choose>
									<c:when test="${requestScope.sortCondition3 eq 'accomo'}">
										<c:forEach var="accomo"
											items="${requestScope.pageAccomoList }">
											<tr>
												<td><c:out value="${accomo.requestNo }"></c:out></td>
												<td><c:out value="${accomo.ownerNo }"></c:out></td>
												<td><c:choose>
														<c:when test="${accomo.rmType eq 'RM'}">
												수정
        										</c:when>
														<c:otherwise>
												등록
         									</c:otherwise>
													</c:choose></td>
												<td><c:out value="${accomo.ceoName }"></c:out></td>
												<td><c:out value="${accomo.accomoName }"></c:out></td>
												<td><c:out value="${accomo.accomoType }"></c:out></td>
												<td><c:choose>
														<c:when test="${accomo.approvalYn eq 'Y'}">
												처리 완료
        									</c:when>
														<c:otherwise>
												처리 대기
         									</c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:when test="${requestScope.sortCondition3 eq 'room' }">
										<c:forEach var="room" items="${requestScope.pageRoomList }">
											<tr>
												<td><c:out value="${room.requestNo }"></c:out></td>
												<td><c:choose>
														<c:when test="${room.rmType eq 'RM'}">
												수정
        										</c:when>
														<c:otherwise>
												등록
         									</c:otherwise>
													</c:choose></td>
												<td><c:out value="${room.roomFee }"></c:out></td>
												<td><c:out value="${room.roomName }"></c:out></td>
												<td><c:out value="${room.roomMax }"></c:out></td>
												<td><c:choose>
														<c:when test="${room.approvalYn eq 'Y'}">
												처리 완료
        									</c:when>
														<c:otherwise>
												처리 대기
         									</c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>
									</c:when>
								</c:choose>

							</c:when>

							<c:otherwise>
								<tr>
									<td><c:out value="${searchRmInfo.requestNo }"></c:out></td>
									<td><c:out value="${searchRmInfo.ownerNo }"></c:out></td>
									<td><c:choose>
											<c:when test="${searchRmInfo.rmType eq 'RM'}">
												수정
        									</c:when>
											<c:otherwise>
												등록
         									</c:otherwise>
										</c:choose></td>
									<td><c:out value="${searchRmInfo.ceoName }"></c:out></td>
									<td><c:out value="${searchRmInfo.accomoName }"></c:out></td>
									<td><c:out value="${searchRmInfo.accomoType }"></c:out></td>
									<td><c:choose>
											<c:when test="${searchRmInfo eq Y}">
												처리 완료
        									</c:when>
											<c:otherwise>
												처리 대기
         									</c:otherwise>
										</c:choose></td>
								</tr>
							</c:otherwise>

						</c:choose>
					</tbody>
				</table>
				<form
					action="${pageContext.servletContext.contextPath }/owner/rmsearch"
					method="get">
					<label style="color: #6eceda; font-size: 1.3em; font-weight: 600;">상호명
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

		</div>

	</div>
	<!--//blog-->
			<script>
				$("#rmList").click(function() {
					location.href = "${pageContext.servletContext.contextPath}/owner/rmlist";
					});
				
				$("#ownerList").click(function() {
					location.href = "${pageContext.servletContext.contextPath}/owner/list";
					});
				
				$("#bList").click(function() {
					location.href = "${pageContext.servletContext.contextPath}/owner/blist";
					});
				
			</script>

	<script>
	const link = "${ pageContext.servletContext.contextPath }/owner/rmlist";
	const searchLink = "${ pageContext.servletContext.contextPath }/owner/rmsearch";

	if (document.getElementById("startPage")) {
		const $startPage = document.getElementById("startPage");
		$startPage.onclick = function() {
			location.href = link + "?currentPage=1&sortCondition1=${ requestScope.sortCondition1}&sortCondition2=${ requestScope.sortCondition2}&sortCondition3=${ requestScope.sortCondition3}";
		}
	}

	if (document.getElementById("prevPage")) {
		const $prevPage = document.getElementById("prevPage");
		$prevPage.onclick = function() {
			location.href = link
					+ "?currentPage=${ requestScope.pageInfo.pageNo - 1 }&sortCondition1=${ requestScope.sortCondition1}&sortCondition2=${ requestScope.sortCondition2}&sortCondition3=${ requestScope.sortCondition3}";
		}
	}

	if (document.getElementById("nextPage")) {
		const $nextPage = document.getElementById("nextPage");
		$nextPage.onclick = function() {
			location.href = link
					+ "?currentPage=${ requestScope.pageInfo.pageNo + 1 }&sortCondition1=${ requestScope.sortCondition1}&sortCondition2=${ requestScope.sortCondition2}&sortCondition3=${ requestScope.sortCondition3}";
		}
	}

	if (document.getElementById("maxPage")) {
		const $maxPage = document.getElementById("maxPage");
		$maxPage.onclick = function() {
			location.href = link
					+ "?currentPage=${ requestScope.pageInfo.maxPage }&sortCondition1=${ requestScope.sortCondition1}&sortCondition2=${ requestScope.sortCondition2}&sortCondition3=${ requestScope.sortCondition3}";
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

			/* td클릭시 이벤트 */
			$tds[i].onclick = function() {

				location.href = "${pageContext.servletContext.contextPath}"
						+ "/owner/rmdetail?requestNo="
						+ this.parentNode.children[0].innerText
						+ "&sortCondition1=${requestScope.sortCondition1}"
						+ "&sortCondition2=${requestScope.sortCondition2}"
						+ "&sortCondition3=${requestScope.sortCondition3}";
			}

		}

	}

	function pageButtonAction(text) {
		location.href = link + "?currentPage=" + text + "&sortCondition1=${ requestScope.sortCondition1}&sortCondition2=${ requestScope.sortCondition2}&sortCondition3=${ requestScope.sortCondition3}";
	}

	function seachPageButtonAction(text) {
		location.href = searchLink
				+ "?currentPage="
				+ text
				+ "&searchCondition=${ requestScope.searchCondition}&searchValue=${ requestScope.searchValue}";
	}
	
	</script>


</body>
</html>