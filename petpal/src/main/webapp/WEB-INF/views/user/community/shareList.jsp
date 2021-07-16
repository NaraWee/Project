<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            a > img {
                width: 50%;
                height: 50%;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: 15px;
                margin-right: 15px;
                text-align: center;
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


        <div class="culmn">
            <!--Home page style-->


            <!--Home Sections-->
            <section id="borad" class="borad" style="width: 80%; margin: 0px auto; ">
                <div style=" font-size: 25px; font-weight: 600; margin-left: 110px;">
                	<a style="color: #45B99C;" href='${ pageContext.servletContext.contextPath }/user/shareFree/list'>무료나눔</a>
                <button 
                style="color: white; background-color: #FFA800; border-color: white; border: 1px solid; 
                border-radius:10px; width:180px; margin-left:30px;" onclick="location.href='${ pageContext.servletContext.contextPath }/user/shareFree/list?category=S'">
                	나눔중
                </button>
                <button 
                style="color: white; background-color: #45B99C; border-color: white; border: 1px solid; 
                border-radius:10px; width:180px; margin-left:30px; position: relative; bottom: 10%;" onclick="location.href='${ pageContext.servletContext.contextPath }/user/shareFree/list?category=C'" >
                	나눔완료
                </button>
                </div>
                <hr style="border-color: rgb(175, 175, 175); width: 90%;">
            </section> <!--End off Home Sections-->
            
            <!-- 검색창 만들기 -->
            	<form action="${ pageContext.servletContext.contextPath }/user/shareFree/list" method="get">
            		<div style="width: 370px; margin-bottom:10px; position: relative; left: 60%;">
						<input type="search" name="keyword" placeholder=" 검색 키워드를 입력해주세요" aria-label="Search"
						style="width: 300px; border-radius: 5px; background-color: #F1FAF8; height:40px; border: solid 1px; border-color: black;" required>
						<span>
						<button type="submit" style="background-color: white; height: 40px; width: 50px; float: right; border: solid 1px; border-color: black; border-radius: 5px;"onclick="location.href='${ pageContext.servletContext.contextPath }/user/shareFree/list/{keyword}'">
							검색
						</button>
						</span>
					</div>
				</form>
            <section id="boradtable" class="boradtable">
                 <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <div class="container">
                                        <div class="row" style="margin-left: 20px;">
                                        <c:if test="${requestScope.category eq null && requestScope.keyword eq null }">
		                                      	  <c:forEach var= "share" varStatus="status" items="${requestScope.shareList }">
			                                            <div class="col-sm-3">
			                                                <div class="port_item xs-m-top-30" style="cursor: pointer;" onclick="location.href='${ pageContext.servletContext.contextPath }/user/shareFree/detail/board/${share.boardCode}'">
			                                                    <div class="port_img" style="position: relative;">
			                                                    	<c:if test="${share.stateCode == 1 }">
			                                                    		<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">나눔중</p>
			                                                    	</c:if>
			                                                    	<c:if test="${share.stateCode eq 2 }">
			                                                    		<p style="position: absolute; font-size: 20px; background-color: #45B99C; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">나눔 완료</p>
			                                                        </c:if>
			                                                        <img src="${ pageContext.servletContext.contextPath }/${share.pictureUtilPath}" style="width:250px; height:250px;" alt="" />
			                                                    </div>
			                                                    <div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">
			                                                        <p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 20px;">${share.boardTitle }</p>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                                <!-- 광고 끼워넣기 -->
									                <c:if test="${ status.index == 0 }">
									                	<c:forEach var="adarr" items="${ randomAdNonPlace }" varStatus="adStatus">
									                		<c:if test="${ adStatus.index == 0 }">
										                		<div class="col-sm-3" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/detail?adCode=${ adarr.adCode }'">
											                        <div class="port_item xs-m-top-30">
											                            <div class="port_img" style="position: relative;">
										                                	<img style="width:290px; height:250px; z-index: -1;" src="${ pageContext.servletContext.contextPath }/${ adarr.pictureUtilPath }"/>
										                                	<div class="blink" style="position:absolute; left:5px; top:5px; font-weight: 600; font-size: 1.3em; color:red;">AD</div>
											                            </div>
											                            <div class="port_caption m-top-20" align="center" style="margin-bottom:20px;">
											                                <h4><strong style="font-size:20px;"><c:out value="${ adarr.adTitle }"/></strong></h4>
											                            </div>
											                        </div>
											                    </div>
										                	</c:if>
									                	</c:forEach>
									                </c:if>
									                <!-- 광고 끼워넣기 -->
									                <c:if test="${ status.index == 5 }">
									                	<c:forEach var="adarr" items="${ randomAdNonPlace }" varStatus="adStatus">
									                		<c:if test="${ adStatus.index == 1 }">
										                		<div class="col-sm-3" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/detail?adCode=${ adarr.adCode }'">
											                        <div class="port_item xs-m-top-30">
											                            <div class="port_img" style="position: relative;">
										                                	<img style="width:290px; height:250px; z-index: -1;" src="${ pageContext.servletContext.contextPath }/${ adarr.pictureUtilPath }"/>
										                                	<div class="blink" style="position:absolute; left:5px; top:5px; font-weight: 600; font-size: 1.3em; color:red;">AD</div>
											                            </div>
											                            <div class="port_caption m-top-20" align="center" style="margin-bottom:20px;">
											                                <h4><strong style="font-size:20px;"><c:out value="${ adarr.adTitle }"/></strong></h4>
											                            </div>
											                        </div>
											                    </div>
										                	</c:if>
									                	</c:forEach>
									                </c:if>
			                                          </c:forEach>
		                                       
                                         	</c:if>
                                        		<c:if test="${requestScope.keyword ne null }">
		                                        	<c:forEach var="share" varStatus="status" items="${requestScope.shareSearchList }">
			                                            <div class="col-sm-3">
			                                                <div class="port_item xs-m-top-30" style="cursor: pointer;" onclick="location.href='${ pageContext.servletContext.contextPath }/user/shareFree/detail/board/${share.boardCode}'">
			                                                    <div class="port_img" style="position: relative;">
			                                                    	<c:if test="${share.stateCode == 1 }">
			                                                    		<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">나눔중</p>
			                                                    	</c:if>
			                                                    	<c:if test="${share.stateCode eq 2 }">
			                                                    		<p style="position: absolute; font-size: 20px; background-color: #45B99C; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">나눔 완료</p>
			                                                        </c:if>
			                                                        <img src="${ pageContext.servletContext.contextPath }/${share.pictureUtilPath}" style="width:250px; height:250px;" alt="" />
			                                                    </div>
			                                                    <div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">
			                                                       <p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 20px;">${share.boardTitle }</p>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                          </c:forEach>
                                        </c:if>
                                          <c:if test="${requestScope.category eq 'S' }">
	                                        <c:forEach var= "shareIng" varStatus="status" items="${requestScope.shareIngList }">
	                                            <div class="col-sm-3">
	                                                <div class="port_item xs-m-top-30" style="cursor: pointer;" onclick="location.href='${ pageContext.servletContext.contextPath }/user/shareFree/detail/board/${shareIng.boardCode}'">
	                                                    <div class="port_img" style="position: relative;">
	                                                    	<p style="position: absolute; font-size: 20px; background-color: orange; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">나눔중</p>
	                                                        <img src="${ pageContext.servletContext.contextPath }/${shareIng.pictureUtilPath}" style="width:250px; height:250px;" alt="" />
	                                                    </div>
	                                                    <div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">
	                                                        <p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 20px;">${shareIng.boardTitle }</p>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                          </c:forEach>
                                          </c:if>
                                          <c:if test="${requestScope.category eq 'C' }">
	                                        <c:forEach var= "shareCom" varStatus="status" items="${requestScope.shareComList }">
	                                            <div class="col-sm-3">
	                                                <div class="port_item xs-m-top-30" style="cursor: pointer;" onclick="location.href='${ pageContext.servletContext.contextPath }/user/shareFree/detail/board/${shareCom.boardCode}'">
	                                                    <div class="port_img" style="position: relative;">
	                                                    	<p style="position: absolute; font-size: 20px; background-color: #45B99C; color: white; height: 30px; width: 100px; padding-top: 6px; border-radius: 0px 5px 5px 5px; font-weight: bold;" align="center">나눔 완료</p>
	                                                        <img src="${ pageContext.servletContext.contextPath }/${shareCom.pictureUtilPath}" style="width:250px; height:250px;" alt="" />
	                                                    </div>
	                                                    <div class="port_caption m-top-20" align="center" style="margin-bottom: 30px;">
	                                                        <p style="color: black; font-weight: bolder; margin-bottom: 10px; font-size: 20px;">${shareCom.boardTitle }</p>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                          </c:forEach>
                                          </c:if>
                                       
                                        </div>
                                    </div>
                                </div>
                             </div>
                             
                           
		<!-- 페이징처리 -->
            <div class="text-center">
				<ul class="pagination">
				<c:if test="${requestScope.category eq null }">
				<li>
					<c:if test="${paging.startPage != 1 }">
						<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li><a>${p }</a></li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
					</c:if>
					</li>
				</c:if>
				<c:if test="${requestScope.category eq null && !requestScope.keyword eq null}">
				<li>
					<c:if test="${paging.startPage != 1 }">
						<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li><a>${p }</a></li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
					</c:if>
					</li>
				</c:if>
				<c:if test="${requestScope.category eq 'S'}">
				<li>
					<c:if test="${paging.startPage != 1 }">
						<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?category=S&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li><a>${p }</a></li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?category=S&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?category=S&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
					</c:if>
					</li>
				</c:if>
				<c:if test="${requestScope.category eq 'C'}">
				<li>
					<c:if test="${paging.startPage != 1 }">
						<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?category=C&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li><a>${p }</a></li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?category=C&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<li><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list?category=C&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
					</c:if>
					</li>
				</c:if>
				</ul>
			</div>
            </section>
            <div style="position: fixed; top: 310px; left: 200px;">
	            <button onclick="sessionCheck();" style="border: 0px; background-color: #19A985; width: 50px; height: 200px; border-radius: 10px;">
	            <h4 style="writing-mode: vertical-rl; color: white; font-weight: bold;" align="center">글 작성하기</h4>
	            </button>
			</div>
			
			<script type="text/javascript">
				function sessionCheck(){
					if(${empty sessionScope.loginUser}){
						alert("로그인 후 이용가능합니다.");
					}else{
						location.href='${ pageContext.servletContext.contextPath }/user/shareFree/insert/newcontent';
					};
				};
			</script>
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>
        </div>
         <jsp:include page="../common/footer.jsp"/>
            
	</body>
</html>