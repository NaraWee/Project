<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/report.css">
		<style>
			.send_btn {
                background-color: rgba(25,169,133,0.81); 
                width:150px;
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 18px; 
                font-weight: 500;
                border-radius: 10px;
                margin-left:15px;
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
			}
			.fa-search {
			    position: absolute;
			    right: 15px;
			    top: 10px;
			    margin: 0;
			    
			}
			.overlay {
  				position: fixed;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				background: rgba(0, 0, 0, 0.7);
				transition: opacity 500ms;
				visibility: hidden;
				opacity: 0;
				z-index: 900;
				height: 150% !important;
			}
			.overlay:target {
				visibility: visible;
				opacity: 1;
			}
			.popup {
				position: fixed;
				width: 70%;
				padding: 10px;
				max-width: 600px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255);
				-webkit-transition: opacity .5s, visibility 0s linear .5s;
				transition: opacity .5s, visibility 0s linear .5s;
				z-index: 1;
			}
			.popup:target {
				visibility: visible;
				opacity: 1;
				-webkit-transition-delay: 0s;
				transition-delay: 0s;
			}
			.popup-close {
				position: absolute;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
			}
			.popup .close {
				position: absolute;
				right: 5px;
				top: 5px;
				padding: 5px;
				color: #000;
				transition: color .3s;
				font-size: 2em;
				line-height: .6em;
			}
			.popup .close:hover {
				color: #007a5c;
			}
            .btn_submit, .certification {
                background-color: #45B99C; 
                height: 45px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                width: 100px;
            }
            .pagination > li > a, .pagination > li > span {
            	color: #19A985 !important;
            }
            @keyframes blink-effect {
                50% {
                    opacity: 0;
                }
            }
            .blink {
                animation: blink-effect 1s step-end infinite;
            }
		</style>
		<script src="https://kit.fontawesome.com/4978ce16d0.js" crossorigin="anonymous"></script>
		<script>
			const message = '${ requestScope.message }';
			if(message != null && message !== '') {
				alert(message);
			}
		</script>
	</head>
		<jsp:include page="../common/userHeader.jsp"/>

		<div class="blog-list" style="position: absolute; top:25%; width: 15%; margin-top: 45px;">
			<nav>
				<ul style="margin-left: 30%;">
					<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/select/shareInfo/list" style="color: #979797;">일반 정보 공유</a></li>
					<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
					<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/select/sharePlace/list"style="color: #45B99C; font-size: 1.3em; font-weight: 600;">프렌들리 플레이스</a></li>
				</ul>
			</nav>
		</div>
    
	 	<section id="product" class="product" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
			<div class="col-md-20">
				<div class="container-fluid" style="float:left;">
					<p role="presentation" style="font-weight:800; font-size:25px; color:#45B99C; margin-top:10px; float:left; margin-right:15px;">프렌들리 플레이스</p>
					<c:if test="${ !empty sessionScope.loginUser.code}">
						<button type="button" class="send_btn" onclick="location.href='#completeReport'" style="vertical-align: text-top;"><strong>게시글 작성신청</strong></button>
					</c:if>
				</div>	
	            <form method="get" action="${ pageContext.servletContext.contextPath }/user/select/sharePlace/list" style="float: right;">
					<input type="search" placeholder="지역 키워드를 입력해주세요" name="keyWord" aria-label="Search" required style="width: 300px; border-radius: 5px; background-color: #F1FAF8; height:40px; border: solid 1px; border-color: gray;">
					<span>
						<button type="submit" style="background-color: white; height: 40px; width: 50px; border: solid 1px; border-color: gray; border-radius: 5px;">검색</button>
					</span>
				</form>
			</div>
		</section>
		
		<section>
			<div class="carousel-inner" role="listbox" style="width: 70%; margin: 0px auto; margin-bottom: 50px;">
				<c:if test="${ empty requestScope.sharePlaceList }">
		            <br><br>
		            <h3 align="center">검색결과가 없습니다.</h3>
	         	</c:if>
		    	<c:forEach var="arr" items="${ sharePlaceList }" varStatus="status">        
		            <div class="col-sm-3" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/sharePlace/detail?boardCode=${ arr.boardCode }'">
		            	<div class="port_item xs-m-top-30" style="text-align: center; height: 400px;">
		                	<div class="port_img">
                                <img style="width:100%; height:250px;" src="${ pageContext.servletContext.contextPath }/${ arr.pictureUtilPath }"/>
		                    </div>
		                	<div class="port_caption m-top-20" align="center" style="margin-bottom:20px;">
		                    	<h4><strong style="font-size:18px;"><c:out value="${ arr.boardTitle }"/></strong></h4>
		                    	<c:choose>
							        <c:when test="${fn:length(arr.placeAddress) gt 10}">
							        	<h5><c:out value="${fn:substring(arr.placeAddress, 0, 9)}"/> . . .</h5>
							        </c:when>
							        <c:otherwise>
			                    		<h5><c:out value="${ arr.placeAddress }"/></h5>
							        </c:otherwise>
								</c:choose>
		                    </div>
		                </div>
		            </div>
		            <!-- 광고 끼워넣기 -->
	                <c:if test="${ status.index == 1 }">
	                	<c:forEach var="adarr" items="${ randomAdPlace }" varStatus="adStatus">
	                		<c:if test="${ adStatus.index == 0 }">
		                		<div class="col-sm-3" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/detail?adCode=${ adarr.adCode }'">
			                        <div class="port_item xs-m-top-30" style="text-align: center; height: 400px;">
			                            <div class="port_img" style="position: relative;">
		                                	<img style="width:100%; height:250px; z-index: -1;" src="${ pageContext.servletContext.contextPath }/${ adarr.pictureUtilPath }"/>
		                                	<div class="blink" style="position:absolute; left:5px; top:5px; font-weight: 600; font-size: 1.3em; color:red;">AD</div>
			                            </div>
			                            <div class="port_caption m-top-20" align="center" style="margin-bottom:20px;">
			                                <h4><strong style="font-size:18px;"><c:out value="${ adarr.adTitle }"/></strong></h4>
			                                <h5><c:out value="${ adarr.companyName }"/></h5>
			                            </div>
			                        </div>
			                    </div>
		                	</c:if>
	                	</c:forEach>
	                </c:if>
	                <!-- 광고 끼워넣기 -->
	                <c:if test="${ status.index == 7 }">
	                	<c:forEach var="adarr" items="${ randomAdPlace }" varStatus="adStatus">
	                		<c:if test="${ adStatus.index == 1 }">
		                		<div class="col-sm-3" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/detail?adCode=${ adarr.adCode }'">
			                        <div class="port_item xs-m-top-30" style="text-align: center; height: 400px;">
			                            <div class="port_img" style="position: relative;">
		                                	<img style="width:100%; height:250px; z-index: -1;" src="${ pageContext.servletContext.contextPath }/${ adarr.pictureUtilPath }"/>
		                                	<div class="blink" style="position:absolute; left:5px; top:5px; font-weight: 600; font-size: 1.3em; color:red;">AD</div>
			                            </div>
			                            <div class="port_caption m-top-20" align="center" style="margin-bottom:20px;">
			                                <h4><strong style="font-size:18px;"><c:out value="${ adarr.adTitle }"/></strong></h4>
			                                <h5><c:out value="${ adarr.companyName }"/></h5>
			                            </div>
			                        </div>
			                    </div>
		                	</c:if>
	                	</c:forEach>
	                </c:if>
		        </c:forEach>
       		</div><!-- End off container -->
   		</section><!-- End off Product section -->
   
		<!-- 페이징처리 -->
		<div class="text-center">
			<ul class="pagination">
				<li>
					<c:if test="${paging.startPage != 1 }">
						<li><a href="${ pageContext.servletContext.contextPath }/user/select/sharePlace/list?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<li><a>${p }</a></li>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<li><a href="${ pageContext.servletContext.contextPath }/user/select/sharePlace/list?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<li><a href="${ pageContext.servletContext.contextPath }/user/select/sharePlace/list?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
					</c:if>
				</li>
			</ul>
		</div>
	
       	<!-- 오른쪽 배너 -->
		<jsp:include page="../../common/banner.jsp"/>
		
        <div id="completeReport" class="overlay">
        	<div class="popup">
                <img alt="warning" src="${ pageContext.servletContext.contextPath }/resources/images/warning.png" style="width: 120px; margin: 0px auto; margin-left: 220px; margin-bottom: -70px;">
    			<i class="far fa-times-circle fa-4x" style="float:right; color:#45B99C; cursor:pointer;" onclick="location.href='${ pageContext.servletContext.contextPath }/views/user/main/sharePlace.jsp'"></i>
                <p style="font-size: 22px; text-align: center; font-weight:bold; color: black; margin-top: 50px;">
                   	<strong>정보공유 게시판은 글 작성시 관리자의 확인이 필요합니다</strong><br>
                </p>
                <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
                 	정보에 대한 사실확인등을 위하여 글 작성시 <br> 관리자의 검토에 의해 글이 게시됩니다.<br> 신청에 대한 검토는 1~2일 소요 될 수 있습니다.
                </p>
                <div style="text-align: center; margin-top: 30px;"><button class="btn_submit" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/write/sharePlace'">확인</button></div>
            </div>
        </div>

  		<jsp:include page="../common/footer.jsp"/>
</html>