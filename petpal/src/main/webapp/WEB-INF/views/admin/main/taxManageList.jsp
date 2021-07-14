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
select { -webkit-appearance: none; /* 네이티브 외형 감추기 */
-moz-appearance: none; appearance: none; 
background: url(이미지 경로) no-repeat 95% 50%; /* 화살표 모양의 이미지 */ } 
/* IE 10, 11의 네이티브 화살표 숨기기 */ 

select::-ms-expand { display: none; }

select { width: 150px; /* 원하는 너비설정 */
 padding: .8em .5em; /* 여백으로 높이 설정 */ 
 font-family: inherit; /* 폰트 상속 */ 
 background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
 border: 1px solid #999; 
 border-radius: 0px; /* iOS 둥근모서리 제거 */ 
 -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
 -moz-appearance: none; 
 appearance: none; 
 float:left;}
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
<script>

function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	location.href="${ pageContext.servletContext.contextPath }/admin/taxManageList?nowPage=${paging.nowPage}&cntPerPage="+sel;
}

function monthChange() {
	var month = document.getElementById('monthChange').value;
	location.href="${ pageContext.servletContext.contextPath }/admin/taxManageList?category=${paging.category}&nowPage=${paging.nowPage}&cntPerPage=${paging.cntPerPage}&month="+month; 
}

</script>

</head>
<body>
	<jsp:include page="../../admin/common/header.jsp"></jsp:include> 
	
	<!-- sidebar start -->
	<nav class="col-sm-3 sidenav" style="
      position: fixed;
      width: 250px;
      height: 100%;
      margin-left: -20px;
      font-size: 18px;
      text-align:center;
      color:#25213b">
      <ul class="nav nav-pills nav-stacked">
        <li><a href="${ pageContext.servletContext.contextPath }/admin/payList">광고 결제 관리</a></li>
        <hr>
        <li class="active1"><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList">세금계산서 관리</a></li>
      </ul>
    </nav>
    <!-- sidebar end -->
    
	 <section id="product" class="product">

		<div class="container">	
				<div class="row">
		 <div class="head_title text-left fix">
		 	<p role="presentation" style="font-weight:800; font-size:25px; color:black; margin-top:10px;">세금계산서 관리</p>
                        </div>	
					 <div class="col-md-20">
					 		
                                 <!-- Nav tabs -->
                                 <ul class="nav nav-tabs" role="tablist">
                                 <c:if test="${ empty category }">
	                        		<li role="presentation" class="active"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList?nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="all" role="tab" data-toggle="tab">All</a></li>
	                                <li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">납부 전</a></li>
	                                <li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList?category=2&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="messages" role="tab" data-toggle="tab">납부 완료</a></li>
                                 </c:if>
                                 <c:if test="${ category eq 1 }">
	                                <li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList?nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="all" role="tab" data-toggle="tab">All</a></li>
	                                <li role="presentation" class="active"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">납부 전</a></li>
	                                <li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList?category=2&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="messages" role="tab" data-toggle="tab">납부 완료</a></li>
                                 </c:if>
                                 <c:if test="${ category eq 2 }">
                                 	<li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList?nowPage=1&cntPerPage=${paging.cntPerPage}'"  aria-controls="all" role="tab" data-toggle="tab">All</a></li>
	                                <li role="presentation"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList?category=1&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="profile" role="tab" data-toggle="tab">납부 전</a></li>
	                                <li role="presentation" class="active"><a onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList?category=2&nowPage=1&cntPerPage=${paging.cntPerPage}'" aria-controls="messages" role="tab" data-toggle="tab">납부 완료</a></li>
                                 </c:if>
                                 <p style="float:right;">총 광고 수 : ${ requestScope.total }개</p>
                            </ul>  
                                    
							<div class="container-fluid" style="margin-top: 15px;">
							 <div class="container-fluid" style="float:left;">
									<select id="monthChange" name="month" onchange="monthChange()" class="ui search dropdown" style="font-size:15px; text-align:center !important; width:150px;">
												  <option value ="0">월별 조회</option>
												  <option value="01">1월</option>
												  <option value="02">2월</option>
												  <option value="03">3월</option>
												  <option value="04">4월</option>
												  <option value="05">5월</option>
												  <option value="06">6월</option>
												  <option value="07">7월</option>
												  <option value="08">8월</option>
												  <option value="09">9월</option>
												  <option value="10">10월</option>
												  <option value="11">11월</option>
												  <option value="12">12월</option>
												
									</select>
								</div>
								
								     
								    <!-- 검색폼 시작 -->
								    <form action="${ pageContext.servletContext.contextPath }/admin/taxManageList" method="get" class="d-flex">
								  	<input type="hidden" name="cntPerPage" value="${ paging.cntPerPage }"/>
							        <input type="hidden" name="nowPage" value="${ paging.nowPage }"/>
							        <input type="hidden" name="category" value="${ requestScope.category }"/>
									<c:choose>
									    <c:when test="${ !empty requestScope.searchValue }">
											<!-- input 값도 넘겨줌 -->
									        <input type="search" id="searchValue" name="searchValue" value="${ requestScope.searchValue }"
									         aria-label="Search"  class="form-control me-2" type="search" 
									        style="width: 300px; border-radius: 15px; background-color: #F1FAF8; float:left; height:40px; margin-left:90px;">
									    </c:when>
									    <c:otherwise>
									        <input id="searchValue" name="searchValue" placeholder="유저명을 입력하세요" 
									        aria-label="Search"  class="form-control me-2" type="search" 
									        style="width: 300px; border-radius: 15px; background-color: #F1FAF8; float:left; height:40px; margin-left:90px;">
									    </c:otherwise>
									</c:choose>
									<button class="btn btn-outline-success" type="submit" 
									style="float: left; margin-left: 30px; width: 10px; border-radius: 50px; height:40px" >Search</button>
								</form>
								
								
								</div>
                                    <!-- Tab panes -->
                                    <div class="tab-content" style="padding:0px;">
                                        <div role="tabpanel" class="tab-pane active" id="all">		
											<table class="table table-hover text-center" style="text-align:center;">
												<thead>
													<tr>
														<th style="text-align:center;">글쓴이 (유저아이디)</th>
														<th style="text-align:center;">세금계산서 일자</th>
														<th style="text-align:center;">지급 상태</th>
														<th style="text-align:center;">청구 금액</th>
														<th style="text-align:center;">세금계산서 보기</th>
													</tr>
												</thead>
												<tbody>
												
												<c:choose>
												<c:when test="${ empty category }">
												<c:forEach var="adApprove" items="${ requestScope.taxList }">
													<tr onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList/${ adApprove.adCode }'">
													<tr>
														<td>${ adApprove.user.name }(${ adApprove.user.id })</td>
														<td>${ adApprove.taxBillDate }</td>
														<td>${ adApprove.payStatus }</td>
														<td>${ adApprove.price2nd + adApprove.taxPrice }</td>
														<td><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList/${ adApprove.adCode }">view more</a></td>
													</tr>
												</c:forEach>
												</c:when>
													
												<c:when test="${ category eq 1 }">
												<c:forEach var="adApprove" items="${ requestScope.taxList }">
													<tr onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList/${ adApprove.adCode }'">
													<tr>
														<td>${ adApprove.user.name }(${ adApprove.user.id })</td>
														<td>${ adApprove.taxBillDate }</td>
														<td>${ adApprove.payStatus }</td>
														<td>${ adApprove.price2nd + adApprove.taxPrice }</td>
														<td><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList/${ adApprove.adCode }">view more</a></td>
													</tr>
												</c:forEach>
												</c:when>
												
												<c:when test="${ category eq 2 }">
												<c:forEach var="adApprove" items="${ requestScope.taxList }">
													<tr onclick="location.href='${ pageContext.servletContext.contextPath }/admin/taxManageList/${ adApprove.adCode }'">
													<tr>
														<td>${ adApprove.user.name }(${ adApprove.user.id })</td>
														<td>${ adApprove.taxBillDate }</td>
														<td>${ adApprove.payStatus }</td>
														<td>${ adApprove.price2nd + adApprove.taxPrice }</td>
														<td><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList/${ adApprove.adCode }">view more</a></td>
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
						<c:if test="${empty requestScope.searchValue and empty requestScope.month }">
		                        <c:if test="${paging.startPage != 1 }">
		                           <li><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
		                        </c:if>
		                        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		                           <c:choose>
		                              <c:when test="${p == paging.nowPage }">
		                                 <li><a>${p }</a></li>
		                              </c:when>
		                              <c:when test="${p != paging.nowPage }">
		                                 <li><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList?category=${category}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
		                              </c:when>
		                           </c:choose>
		                        </c:forEach>
		                        <c:if test="${paging.endPage != paging.lastPage}">
		                           <li><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList?category=${category}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
		                        </c:if>
	                        </c:if>
	                        
	                        <c:if test="${ not empty requestScope.searchValue }">
		                        <c:if test="${paging.startPage != 1 }">
		                           <li><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchValue=${requestScope.searchValue}">&lt;</a></li>
		                        </c:if>
		                        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		                           <c:choose>
		                              <c:when test="${p == paging.nowPage }">
		                                 <li><a>${p }</a></li>
		                              </c:when>
		                              <c:when test="${p != paging.nowPage }">
		                                 <li><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList?category=${category}&nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchValue=${requestScope.searchValue}">${p }</a></li>
		                              </c:when>
		                           </c:choose>
		                        </c:forEach>
		                        <c:if test="${paging.endPage != paging.lastPage}">
		                           <li><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList?category=${category}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchValue=${requestScope.searchValue}">&gt;</a></li>
		                        </c:if>
	                        </c:if>
	                        
	                         <c:if test="${ not empty requestScope.month }">
		                        <c:if test="${paging.startPage != 1 }">
		                           <li><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&month=${requestScope.month}">&lt;</a></li>
		                        </c:if>
		                        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		                           <c:choose>
		                              <c:when test="${p == paging.nowPage }">
		                                 <li><a>${p }</a></li>
		                              </c:when>
		                              <c:when test="${p != paging.nowPage }">
		                                 <li><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList?category=${category}&nowPage=${p }&cntPerPage=${paging.cntPerPage}&month=${requestScope.month}">${p }</a></li>
		                              </c:when>
		                           </c:choose>
		                        </c:forEach>
		                        <c:if test="${paging.endPage != paging.lastPage}">
		                           <li><a href="${ pageContext.servletContext.contextPath }/admin/taxManageList?category=${category}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&month=${requestScope.month}">&gt;</a></li>
		                        </c:if>
	                        </c:if>
	                        
	                       </ul>
								
							</div>
													
													
														
                               </div>
                             
                          </div>
                    </div>
       		  </div>		
		</div>
    </section><!-- End off Product section -->
	

	<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 

</body>
</html>
