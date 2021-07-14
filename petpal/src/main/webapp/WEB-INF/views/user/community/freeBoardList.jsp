<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
			td > button {
				background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 80px; 
                height: auto; 
                font-size: 13px; 
                font-weight: 500;
                border-radius: 10px;
			}
			td > button:hover {
				background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid;
			}
			td.notbutton > button {
				background-color: rgb(175, 175, 175); 
                color: white;
                border-color: rgb(175, 175, 175); 
                border: 1px solid; 
                width: 80px; 
                height: auto; 
                font-size: 13px; 
                font-weight: 500;
                border-radius: 10px;
			}
            .board > button {
                background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 100px;
                height: 30px;
                font-weight: 500;
                border-radius: 10px;
                margin-right: 10px;
                margin-top: 10px;
                float: right;
            }
            @keyframes blink-effect {
                50% {
                    opacity: 0;
                }
            }
            .blink {
                animation: blink-effect 1s step-end infinite;
            }
			.filtering {
				cursor: pointer;
			}
			.pagination > li > a, .pagination > li > span {
            	color: #19A985 !important;
            }
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
    </head>
            <jsp:include page="../common/userHeader.jsp"/>

        <!-- Preloader -->
        <div id="loading"> 
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object" id="object_one"></div>
                    <div class="object" id="object_two"></div>
                    <div class="object" id="object_three"></div>
                    <div class="object" id="object_four"></div>
                </div>
            </div>
        </div><!--End off Preloader -->

            <!--Home Sections-->

            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left;">커뮤니티</div>
                <c:if test="${ !empty sessionScope.loginUser.code}">
                	<button onclick="location.href='${ pageContext.servletContext.contextPath }/user/insert/freeboard'">게시물 작성</button>
                </c:if>
            </section>

           	<div class="blog-list" style="position: absolute; top:25%; width: 15%; margin-top: 45px;">
				<nav>
					<ul style="margin-left: 30%;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/select/freeboard/list" style="color: #45B99C; font-size: 1.3em; font-weight: 600;">자유게시판</a></li>
						<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list" style="color: #979797;">무료나눔</a></li>
						<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/review" style="color: #979797;">용품리뷰</a></li>
					</ul>
				</nav>
			</div>

            <section id="menutable" class="menutable">
				<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
		           	<table class="table table-hover" style="margin-bottom: 5px;">
			        	<thead>
			                <tr style="background-color: #F1FAF8;">
			                	<th style="border-radius: 21px 0px 0px 0px; width: 20px;"></th>
			                	<th class="filtering" onclick="filtering();" style="text-align: center;"><b>카테고리</b><img src="${ pageContext.servletContext.contextPath }/resources/images/filter.png" style="width:15px; margin-left:10px;"></th>
			                    <th style="text-align: center; width:40%;"><b>제목</b></th>
			                    <th style="text-align: center;"><b>작성자</b></th>
	                            <th style="text-align: center;"><b>조회수</b></th>
			                    <th style="text-align: center; border-radius: 0px 21px 0px 0px;"><b>작성일자</b></th>
			                </tr>
			            </thead>
			            <tbody>
			                <c:forEach var="arr" items="${ freeBoardList }" varStatus="status">
			                	<c:if test="${ arr.category eq '일반' }">
					                <tr class="general" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/freeboard/detail?boardCode=${ arr.boardCode }'">
					                	<td></td>
					                	<td style="text-align: center;"><c:out value="${ arr.category }"/></td>
					                    <td style="text-align: center;"><c:out value="${ arr.boardTitle }"/></td>
					                    <td style="text-align: center;"><c:out value="${ arr.userNickName }"/></td>
					                    <td style="text-align: center;"><c:out value="${ arr.boardViews }"/></td>
					                    <td style="text-align: center;"><c:out value="${ arr.boardPostDate }"/></td>
					                </tr>
				                </c:if>
				                <c:if test="${ arr.category eq '질문' }">
					                <tr class="question" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/freeboard/detail?boardCode=${ arr.boardCode }'">
					                	<td></td>
					                	<td style="text-align: center;"><c:out value="${ arr.category }"/></td>
					                    <td style="text-align: center;"><c:out value="${ arr.boardTitle }"/></td>
					                    <td style="text-align: center;"><c:out value="${ arr.userNickName }"/></td>
					                    <td style="text-align: center;"><c:out value="${ arr.boardViews }"/></td>
					                    <td style="text-align: center;"><c:out value="${ arr.boardPostDate }"/></td>
					                </tr>
				                </c:if>
				                <!-- 광고 끼워넣기 -->
				                <c:if test="${ status.index == 2 }">
				                	<c:forEach var="adarr" items="${ randomAdNonPlace }" varStatus="adStatus">
				                		<c:if test="${ adStatus.index == 0 }">
					                		<tr class="general" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/detail?adCode=${ adarr.adCode }'">
					                			<input type="hidden" value="${ sessionScope.loginUser.code }" name="userCode">
							                	<td></td>
							                	<td class="blink" style="color:red; text-align: center; font-weight: 600; font-size: 1.2em;">AD</td>
							                    <td style="text-align: center;"><c:out value="${ adarr.adTitle }"/></td>
							                    <td style="text-align: center;"><c:out value="${ adarr.companyName }"/></td>
							                    <td style="text-align: center;"></td>
							                    <td style="text-align: center;"></td>
						                	</tr>
					                	</c:if>
				                	</c:forEach>
				                </c:if>
				                <!-- 광고 끼워넣기 -->
				                <c:if test="${ status.index == 5 }">
				                	<c:forEach var="adarr" items="${ randomAdNonPlace }" varStatus="adStatus">
				                		<c:if test="${ adStatus.index == 1 }">
					                		<tr class="question" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/detail?adCode=${ adarr.adCode }'">
							                	<td></td>
							                	<td class="blink" style="color:red; text-align: center; font-weight: 600; font-size: 1.2em;">AD</td>
							                    <td style="text-align: center;"><c:out value="${ adarr.adTitle }"/></td>
							                    <td style="text-align: center;"><c:out value="${ adarr.companyName }"/></td>
							                    <td style="text-align: center;"></td>
							                    <td style="text-align: center;"></td>
						                	</tr>
					                	</c:if>
				                	</c:forEach>
				                </c:if>
			                </c:forEach>
			            </tbody>
			        </table>
	            </div>
		        <!-- 페이징처리 -->
		        <div class="text-center">
					<ul class="pagination">
						<li>
							<c:if test="${paging.startPage != 1 }">
								<li><a href="${ pageContext.servletContext.contextPath }/user/select/freeboard/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<li><a>${p }</a></li>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<li><a href="${ pageContext.servletContext.contextPath }/user/select/freeboard/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<li><a href="${ pageContext.servletContext.contextPath }/user/select/freeboard/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
							</c:if>
						</li>
					</ul>
				</div>
            </section>
            
            
            <script>
            	<!-- 카테고리 필터링 -->
	            var filterNo = 0;
				function filtering() {
					
					filterNo++;
					
					if(filterNo > 2) {
						filterNo = 1;
					}
					
					if(filterNo == 1) {
						$(".question").hide();
						$(".general").show();
					} else {
						$(".general").hide();
						$(".question").show();
					}
					
				}
            </script>
            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
</html>