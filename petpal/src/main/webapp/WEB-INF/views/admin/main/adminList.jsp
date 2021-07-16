<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
      <head>
      <style>
       .table > thead > tr > th {
       text-align: center;
       }
       
        .table > tbody > tr > th {
       text-align: center;
       }
       .table > thead > tr > td {
       text-align: center;
       }
       
        .table > tbody > tr > td {
       text-align: center;
       }
       
       </style>
      </style>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">

        <div class="culmn">
            
            <!-- 헤더  시작 -->
			<jsp:include page="../../admin/common/header.jsp"></jsp:include>
			<!-- 헤더 끝 --> 

             <!-- 관리자관리 바디 시작 -->
             <section>
                <div class="container" style="padding-bottom:10%">
                   
                        <div class="head_title text-left fix">
                            <h2 class="text-uppercase">관리자 관리</h2>
                        </div>
                        
						 <div class="container">
							<div class="col-lg-12">
	                             <div class="col-lg-8" style="padding-left: 0px;">	
		                             <div class="container-fluid" style="margin-top: 15px;">
								    <form action="${pageContext.servletContext.contextPath }/admin/adminList" method="get" class="d-flex">	
						        <input type="hidden" name="cntPerPage" value="${ paging.cntPerPage }"/>
						        <input type="hidden" name="nowPage" value="${ paging.nowPage }"/>
						        <input type="hidden" name="category" value="${ requestScope.category }"/>
									<c:choose>
									    <c:when test="${ !empty requestScope.searchValue }">
					   					    <select id="searchCondition" name="searchCondition" style="margin-left: -540px; margin-top: 10px;">
					   					    <!-- select 박스 -->
					   					    <!-- ~를 선택했을 때 value를 넘겨줌 -->
												<option value="userId" <c:if test="${requestScope.searchCondition eq 'userId'}">selected</c:if>>유저ID</option>
												<option value="userName" <c:if test="${requestScope.searchCondition eq 'userName'}">selected</c:if>>유저명</option>
											</select>
											<!-- input 값도 넘겨줌 -->
									        <input type="search" id="searchValue" name="searchValue" value="${ requestScope.searchValue }"
									        aria-label="Search"  class="form-control me-2"
									        style="width: 300px; border-radius: 15px; background-color: #F1FAF8; float:left; height:40px; margin-left:80px;">
									    </c:when>
									    <c:otherwise>
										    <select id="searchCondition" name="searchCondition" style="margin-left: -540px; margin-top: 10px;">
												<option value="userId" >유저ID</option>
												<option value="userName">유저명</option>
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
									</div>
                                   <div class="col-lg-2">
                                   </div>
	                              <div class="col-lg-2">
	                              <button class="btn btn-outline-success" 
                                   type="button" style="border-radius:10px; margin-right: 20px; float:right; background: white; border:1px solid green; color:green;" 
                                   onclick="location.href='adminAdd'">관리자 등록</button></div>
	                         </div>
						</div>
						
						
                        <!-- 관리자관리 표 -->
                        <div class="container" style="padding-top:2%">
                            <table class="table table-hover">
                                <thead>
                                 <tr>
                                    <th scope="col">관리자 코드</th>
                                    <th scope="col">관리자 아이디</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">이메일</th>
                                    <c:if test="${empty sortValue}">
									<th onclick="location.href='${pageContext.servletContext.contextPath }/admin/adminList?sortValue=1&nowPage=${paging.nowPage}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&category=${category}&cntPerPage=${paging.cntPerPage}'" style="text-align:center;">권한</th>
									</c:if>
									<c:if test="${sortValue eq 1}">
									<th onclick="location.href='${pageContext.servletContext.contextPath }/admin/adminList?sortValue=2&nowPage=${paging.nowPage}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&category=${category}&cntPerPage=${paging.cntPerPage}'" style="text-align:center;">권한</th>
									</c:if>
									<c:if test="${sortValue eq 2}">
									<th onclick="location.href='${pageContext.servletContext.contextPath }/admin/adminList?sortValue=&nowPage=${paging.nowPage}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&category=${category}&cntPerPage=${paging.cntPerPage}'" style="text-align:center;">권한</th>
									</c:if>
                                 </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${adminList}" var="board">
                                  <tr>
                                    <th scope="row">${board.code}</th>
                                    <td>${board.id}</td>
                                    <td onclick="location.href='${ pageContext.servletContext.contextPath }/admin/adminDetail?boardCode=${board.code}'">${board.name}</td>
                                    <td>${board.email}</td>
                                    <c:if test="${board.permisson eq 2}">
                                    <td>서브관리자</td>
                                    </c:if>
                                    <c:if test="${board.permisson eq 3}">
                                    <td>대표관리자</td>
                                    </c:if>
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
									<li><a href="${pageContext.servletContext.contextPath }/admin/adminList?category=${category}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<li><a>${p }</a></li>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<li><a href="${pageContext.servletContext.contextPath }/admin/adminList?category=${category}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<li><a href="${pageContext.servletContext.contextPath }/admin/adminList?category=${category}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
								</c:if>
								</ul>
								</c:when>
								
								<c:otherwise>
								<ul class="pagination">
								<c:if test="${paging.startPage != 1 }">
									<li><a href="${pageContext.servletContext.contextPath }/admin/adminList?category=${category}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<li><a>${p }</a></li>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<li><a href="${pageContext.servletContext.contextPath }/admin/adminList?category=${category}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<li><a href="${pageContext.servletContext.contextPath }/admin/adminList?category=${category}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
								</c:if>
								</ul>
								</c:otherwise>
								</c:choose>
							</div>
                            
                            
                            
                            
                            
                            
                        </div>
                        
                        
                </div><!-- End off container -->
            </section><!-- End off Product section -->
		
			<!-- 푸터 시작 -->
            <footer>
       			<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
            </footer>
			<!-- 푸터 끝 -->



        </div>
</body>

 <script>
		function selChange() {
			var sel = document.getElementById('cntPerPage').value;
			location.href="${pageContext.servletContext.contextPath }/admin/adminList?nowPage=${paging.nowPage}&category=${category}&cntPerPage="+sel;
		}
		function selChangeSearch() {
			var sel = document.getElementById('cntPerPage').value;
			location.href="${pageContext.servletContext.contextPath }/admin/adminList?nowPage=${paging.nowPage}&searchValue=${requestScope.searchValue}&searchCondition=${requestScope.searchCondition}&category=${category}&cntPerPage="+sel;
		}
	 </script>
     
</html>