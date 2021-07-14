<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.table>tr>td{
	text-align: center;
}
.search {
    position: relative;
    text-align: center;
    width: 300px;
    margin: 0 auto;
}
input {
    width: 100%;
    border-radius: 20px;
    border: 1px solid #bbb;
    margin: 10px 0;
    padding: 10px 12px;
    font-family: fontAwesome;
    background-color: #F1FAF8;
}
.fa-search {
    position: absolute;
    right: 15px;
    top: 10px;
    margin: 0;
    }
</style>
</head>
<body>
	<jsp:include page="../../admin/common/header.jsp"></jsp:include> 
	 <section id="product" class="product">

		<div class="container">		
				<div class="row">
				<div class="head_title text-left fix">
		 	<p role="presentation" style="font-weight:800; font-size:25px; color:black; margin-top:10px;">검토 게시판</p>
                        </div>	
					 <div class="col-md-20">
					 		
                                    <!-- Nav tabs -->
                  
                                    <ul class="nav nav-tabs" role="tablist">
                                    <c:if test="${ empty category or category eq 0 }">
                                    	<li role="presentation" class="active"><a onclick="location.href='${pageContext.servletContext.contextPath }/admin/reviewList?nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="free" role="tab" data-toggle="tab">정보공유게시판</a></li>
                                        <li role="presentation"><a onclick="location.href='${pageContext.servletContext.contextPath }/admin/reviewList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="info" role="tab" data-toggle="tab">프렌들리게시판</a></li>
                                    </c:if>
                                    <c:if test="${ category eq 1 }">
                                    	<li role="presentation" ><a onclick="location.href='${pageContext.servletContext.contextPath }/admin/reviewList?&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="free" role="tab" data-toggle="tab">정보공유게시판</a></li>
                                        <li role="presentation" class="active"><a onclick="location.href='${pageContext.servletContext.contextPath }/admin/reviewList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="info" role="tab" data-toggle="tab">프렌들리</a></li>
                                    </c:if>
                                    <p style="float:right;">총 건의글 :${total}개</p>
                                    </ul>
							<div class="container-fluid" style="margin-top: 15px;">
								<form action="${pageContext.servletContext.contextPath }/admin/reviewList" method="get" class="d-flex">	
						        <input type="hidden" name="cntPerPage" value="${ paging.cntPerPage }"/>
						        <input type="hidden" name="nowPage" value="${ paging.nowPage }"/>
						        <input type="hidden" name="category" value="${ requestScope.category }"/>
									<c:choose>
									    <c:when test="${ !empty requestScope.searchValue }">
					   					    <select id="searchCondition" name="searchCondition" style="margin-left: -540px; margin-top: 10px;">
					   					    <!-- select 박스 -->
					   					    <!-- ~를 선택했을 때 value를 넘겨줌 -->
												<option value="userId" <c:if test="${requestScope.searchCondition eq 'userId'}">selected</c:if>>유저ID</option>
												<option value="boardTitle" <c:if test="${requestScope.searchCondition eq 'boardTitle'}">selected</c:if>>글 제목</option>
											</select>
											<!-- input 값도 넘겨줌 -->
									        <input type="search" id="searchValue" name="searchValue" value="${ requestScope.searchValue }"
									        aria-label="Search"  class="form-control me-2"
									        style="width: 300px; border-radius: 15px; background-color: #F1FAF8; float:left; height:40px; margin-left:80px;">
									    </c:when>
									    <c:otherwise>
										    <select id="searchCondition" name="searchCondition" style="margin-left: -540px; margin-top: 10px;">
												<option value="userId" >유저ID</option>
												<option value="boardTitle">글 제목</option>
											</select>
									        <input id="searchValue" name="searchValue" placeholder="검색어를 입력하세요" 
									        aria-label="Search"  class="form-control me-2" type="search" 
									        style="width: 300px; border-radius: 15px; background-color: #F1FAF8; float:left; height:40px; margin-left:80px;">
									    </c:otherwise>
									</c:choose>
									<button class="btn btn-outline-success" type="submit" 
									style="float: left; margin-left: 30px; width: 10px; border-radius: 50px; height:40px" >Search</button>
								</form>
								</div>
                                    <!-- Tab panes -->
                                    <div class="tab-content" style="padding:0px;">
                                        <div role="tabpanel" class="tab-pane active" id="all">								              	
											<table class="table table-hover" style="text-align:center;">
												<thead>
													<tr>
														<th style="text-align:center;">글쓴이(유저아이디)</th>
														<th style="text-align:center;">글 제목</th>
														<th style="text-align:center;">작성일자</th>
														<c:if test="${empty sortValue}">
														<th onclick="location.href='${pageContext.servletContext.contextPath }/admin/reviewList?sortValue=1&nowPage=${paging.nowPage}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&category=${category}&cntPerPage=${paging.cntPerPage}'" style="text-align:center;">진행상황</th>
														</c:if>
														<c:if test="${sortValue eq 1}">
														<th onclick="location.href='${pageContext.servletContext.contextPath }/admin/reviewList?sortValue=2&nowPage=${paging.nowPage}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&category=${category}&cntPerPage=${paging.cntPerPage}'" style="text-align:center;">진행상황</th>
														</c:if>
														<c:if test="${sortValue eq 2}">
														<th onclick="location.href='${pageContext.servletContext.contextPath }/admin/reviewList?sortValue=&nowPage=${paging.nowPage}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&category=${category}&cntPerPage=${paging.cntPerPage}'" style="text-align:center;">진행상황</th>
														</c:if>
													</tr>
														
												</thead>
												<tbody>
													<c:forEach items="${reviewList}" var="board">
													<tr onclick="location.href='${pageContext.servletContext.contextPath }/admin/reviewDetail?boardCode=${ board.boardCode }&category=${category}'">
														<td>${board.userId}(${board.userName})</td>
														<td>${board.boardTitle }</td>
														<td>${board.postDate }</td>
														<td>${board.state }</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
											<c:if test="${ requestScope.total  eq 0}">
                              <p style="text-align:center;">검색 결과가 없습니다</p>
                           </c:if>
											<div style="display: block; text-align: center;">	
				                              <div style="float: right;">
				        <c:choose>
                        <c:when test="${ !empty requestScope.searchValue }">
						<select id="cntPerPage" name="sel" onchange="selChangeSearch()">
						
							<option value="5"
								<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
							<option value="10"
								<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
							<option value="15"
								<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
							<option value="20"
								<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
						</select>
						</c:when>
						<c:otherwise>
						<select id="cntPerPage" name="sel" onchange="selChange()">
						
							<option value="5"
								<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
							<option value="10"
								<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
							<option value="15"
								<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
							<option value="20"
								<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
						</select>
						</c:otherwise>
						</c:choose>
					</div> <!-- 옵션선택 끝 -->
                            	<c:choose>
                            	<c:when test="${ !empty requestScope.searchValue }">
                            	<ul class="pagination">
								<c:if test="${paging.startPage != 1 }">
									<li><a href="${pageContext.servletContext.contextPath }/admin/reviewList?category=${category}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<li><a>${p }</a></li>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<li><a href="${pageContext.servletContext.contextPath }/admin/reviewList?category=${category}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<li><a href="${pageContext.servletContext.contextPath }/admin/reviewList?category=${category}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
								</c:if>
								</ul>
								</c:when>
								
								<c:otherwise>
								<ul class="pagination">
								<c:if test="${paging.startPage != 1 }">
									<li><a href="${pageContext.servletContext.contextPath }/admin/reviewList?category=${category}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<li><a>${p }</a></li>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<li><a href="${pageContext.servletContext.contextPath }/admin/reviewList?category=${category}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<li><a href="${pageContext.servletContext.contextPath }/admin/reviewList?category=${category}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
								</c:if>
								</ul>
								</c:otherwise>
								</c:choose>
							</div>
                        </div>
                   </div>		
                                        	</div>
                                   		</div>
                    </div>
       		  		
    </section><!-- End off Product section -->
	

	<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 

</body>
 <script>
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href="${pageContext.servletContext.contextPath }/admin/reviewList?nowPage=${paging.nowPage}&category=${category}&cntPerPage="+sel;
		}
		function selChangeSearch() {
			var sel = document.getElementById('cntPerPage').value;
			location.href="${pageContext.servletContext.contextPath }/admin/reviewList?nowPage=${paging.nowPage}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&category=${category}&cntPerPage="+sel;
		}
	 </script>
</html>
