<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트</title>
<style>

.table>tr>td{
	text-align: center;
}


</style>
<script>

function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	location.href="${ pageContext.servletContext.contextPath }/admin/blackList?nowPage=${paging.nowPage}&cntPerPage="+sel;
}


</script>

</head>
<body>
	<jsp:include page="../../admin/common/header.jsp"></jsp:include> 
	
	 <section id="product" class="product">

		<div class="container">		
				<div class="row">
					 <div class="head_title text-left fix">
		 	<p role="presentation" style="font-weight:800; font-size:25px; color:black; margin-top:10px;">유저 관리</p>
                        </div>
					 <div class="col-md-20">
					 		
                             <!-- Nav tabs -->
                              <ul class="nav nav-tabs" role="tablist">
                                 <c:if test="${ empty category }">
	                        		<li role="presentation" class="active"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/blackList?nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="all" role="tab" data-toggle="tab">All</a></li>
	                                <li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/blackList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">차단된 유저</a></li>
	                                <li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/blackList?category=2&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">탈퇴한 유저</a></li>
                                 </c:if>
                                 <c:if test="${ category eq 1 }">
	                                <li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/blackList?nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="all" role="tab" data-toggle="tab">All</a></li>
	                                <li role="presentation" class="active"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/blackList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">차단된 유저</a></li>
                                 	<li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/blackList?category=2&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">탈퇴한 유저</a></li>
                                 </c:if>
                                  <c:if test="${ category eq 2 }">
	                                <li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/blackList?nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="all" role="tab" data-toggle="tab">All</a></li>
	                                <li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/blackList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">차단된 유저</a></li>
                                 	<li role="presentation" class="active"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/blackList?category=2&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">탈퇴한 유저</a></li>
                                 </c:if>
                                 <p style="float:right;">총 유저 수 : ${ requestScope.total }명</p>
                            </ul>    
                           
                  				<div class="container-fluid" style="margin-top: 15px;">
                 				 <!-- 검색폼 시작 -->
								    <form action="${ pageContext.servletContext.contextPath }/admin/blackList" method="get" class="d-flex">
								  	<input type="hidden" name="cntPerPage" value="${ paging.cntPerPage }"/>
							        <input type="hidden" name="nowPage" value="${ paging.nowPage }"/>
							        <input type="hidden" name="category" value="${ requestScope.category }"/>
									<c:choose>
									    <c:when test="${ !empty requestScope.searchValue }">
											<!-- input 값도 넘겨줌 -->
									        <input type="search" id="searchValue" name="searchValue" value="${ requestScope.searchValue }"
									        aria-label="Search"  class="form-control me-2" type="search" 
									        style="width: 300px; border-radius: 15px; background-color: #F1FAF8; float:left; height:40px; margin-left: 0px;">
									    </c:when>
									    <c:otherwise>
									        <input id="searchValue" name="searchValue" placeholder="유저명을 입력하세요" 
									        aria-label="Search"  class="form-control me-2" type="search" 
									        style="width: 300px; border-radius: 15px; background-color: #F1FAF8; float:left; height:40px; margin-left: 0px;">
									    </c:otherwise>
									</c:choose>
									<button class="btn btn-outline-success" type="submit" 
									style="float: left; margin-left: 30px; width: 10px; border-radius: 50px; height:40px" >Search</button>
								</form>
								</div>
                  
							
							
                                    <!-- Tab panes -->
                                    <div class="tab-content" style="padding:0px;">
                                        <div role="tabpanel" class="tab-pane active" id="profile">	
	                                      							              	
											<table class="table table-hover" style="text-align:center; padding-top:15px">
												<thead>
													<tr>
														<th style="text-align:center;">유저이름(유저아이디)</th>
														<th style="text-align:center;">이메일</th>
														<th style="text-align:center;">탈퇴여부</th>
														<th style="text-align:center;">신고누적횟수</th>
														<th style="text-align:center;">차단여부</th>
													</tr>
														
												</thead>
												<tbody>
												<c:choose>
												<c:when test="${ empty category }">
											
												<c:forEach var="user" items="${ requestScope.userList }">
													<tr>
														<td>${ user.name }(${ user.id })</td>
														<td>${ user.email }</td>
														<td>${ user.withdrawYn }</td>
														<td>${ user.reportCount }</td>
														<td>
															<c:choose>
																<c:when test="${user.reportCount >= 3}">
																	Y
																</c:when>
																<c:otherwise>
																	N
																</c:otherwise>
														    </c:choose>
														</td>
													</tr>
													
												</c:forEach>
												</c:when>
												
												<c:when test="${ category eq 1 }">
												<c:forEach var="user" items="${ requestScope.userList }">
													<tr>
														<td>${ user.name }(${ user.id })</td>
														<td>${ user.email }</td>
														<td>${ user.withdrawYn }</td>
														<td>${ user.reportCount }</td>
														<td>
															<c:choose>
																<c:when test="${user.reportCount >= 3}">
																	Y
																</c:when>
																<c:otherwise>
																	N
																</c:otherwise>
														    </c:choose>
														</td>
													</tr>
												</c:forEach>
												</c:when>
												
												<c:when test="${ category eq 2 }">
												<c:forEach var="user" items="${ requestScope.userList }">
													<tr>
														<td>${ user.name }(${ user.id })</td>
														<td>${ user.email }</td>
														<td>${ user.withdrawYn }</td>
														<td>${ user.reportCount }</td>
														<td>
															<c:choose>
																<c:when test="${user.reportCount >= 3}">
																	Y
																</c:when>
																<c:otherwise>
																	N
																</c:otherwise>
														    </c:choose>
														</td>
													</tr>
												</c:forEach>
												</c:when>
												
												</c:choose>
											
												</tbody>
											</table>
											
									  <c:if test="${ requestScope.total  eq 0}">
										<p style="text-align:center;">검색 결과가 없습니다</p>
									</c:if>
											
							<!-- 페이징 몇 개씩 볼지 선택 -->
                            <div style="display: block; text-align: center;">	
				              <div style="float: right;">
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
							</div> 
                            
                            
                            	
						<!-- 페이징 버튼 -->
						<ul class="pagination">
							<c:if test="${ empty requestScope.searchValue }">
		                        <c:if test="${paging.startPage != 1 }">
		                           <li><a href="${ pageContext.servletContext.contextPath }/admin/blackList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
		                        </c:if>
		                        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		                           <c:choose>
		                              <c:when test="${p == paging.nowPage }">
		                                 <li><a>${p }</a></li>
		                              </c:when>
		                              <c:when test="${p != paging.nowPage }">
		                                 <li><a href="${ pageContext.servletContext.contextPath }/admin/blackList?category=${category}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
		                              </c:when>
		                           </c:choose>
		                        </c:forEach>
		                        <c:if test="${paging.endPage != paging.lastPage}">
		                           <li><a href="${ pageContext.servletContext.contextPath }/admin/blackList?category=${category}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
		                        </c:if>
		                     </c:if>
		                     
		                     <c:if test="${ not empty requestScope.searchValue }">
		                        <c:if test="${paging.startPage != 1 }">
		                           <li><a href="${ pageContext.servletContext.contextPath }/admin/blackList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchValue=${requestScope.searchValue}">&lt;</a></li>
		                        </c:if>
		                        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		                           <c:choose>
		                              <c:when test="${p == paging.nowPage }">
		                                 <li><a>${p }</a></li>
		                              </c:when>
		                              <c:when test="${p != paging.nowPage }">
		                                 <li><a href="${ pageContext.servletContext.contextPath }/admin/blackList?category=${category}&nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchValue=${requestScope.searchValue}">${p }</a></li>
		                              </c:when>
		                           </c:choose>
		                        </c:forEach>
		                        <c:if test="${paging.endPage != paging.lastPage}">
		                           <li><a href="${ pageContext.servletContext.contextPath }/admin/blackList?category=${category}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchValue=${requestScope.searchValue}">&gt;</a></li>
		                        </c:if>
		                     </c:if>
		                     
	                       </ul>
					</div>
									
                                      			
                                   
                    </div>
																
                 </div>
       		  </div>		
    </section><!-- End off Product section -->
	

	<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 

</body>
</html>