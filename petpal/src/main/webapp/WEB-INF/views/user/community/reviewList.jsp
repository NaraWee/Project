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
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

        <!--Google Font link-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">


        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.css"> 
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick-theme.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/animate.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/iconfont.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/magnific-popup.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootsnav.css">

        <!-- xsslider slider css -->


        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/xsslider.css">-->




        <!--For Plugins external css-->
        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/plugins.css" />-->

        <!--Theme custom css -->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">
        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/colors/maron.css">-->

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" />

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">


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


            <jsp:include page="../common/userHeader.jsp"/>
            <!--Home Sections-->

            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left;">커뮤니티</div>
                <button onclick="location.href='${ pageContext.servletContext.contextPath }/user/review/reviewWrite'">리뷰 작성</button>
            </section>

           	<div class="blog-list" style="position: absolute; top:25%; width: 15%; margin-top: 45px;">
				<nav>
					<ul style="margin-left: 30%;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/select/freeboard/list" style="color: #979797;">자유게시판</a></li>
						<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list" style="color: #979797;">무료나눔</a></li>
						<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/review" style="color: #45B99C; font-size: 1.3em; font-weight: 600;">용품리뷰</a></li>
					</ul>
				</nav>
			</div>

            <section id="menutable" class="menutable">
				<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
		           	<table class="table table-hover" style="margin-bottom: 50px;">
			        	<thead>
			                <tr style="background-color: #F1FAF8;">
			                	<th style="border-radius: 21px 0px 0px 0px; width: 20px;"></th>
			                    <th style="text-align: center; width:30%;"><b>제목</b></th>
			                    <th style="text-align: center; width: 20%;"><b>작성자</b></th>
	                            <th style="text-align: center; width: 20%;"><b>조회수</b></th>
			                    <th style="text-align: center; border-radius: 0px 21px 0px 0px;"><b>작성일자</b></th>
			                </tr>
			            </thead>
			            <tbody>
			                <c:forEach var="arr" items="${ reviewList }" varStatus="num">
					                <tr class="general" onclick="location.href='${ pageContext.servletContext.contextPath }/user/review/reviewDetail?boardCode=${ arr.boardCode }'">
					                	<td></td>
					                    <td style="text-align: center;"><c:out value="${ arr.boardTitle }"/></td>
					                    <td style="text-align: center;"><c:out value="${ arr.userNickName }"/></td>
					                    <td style="text-align: center;"><c:out value="${ arr.boardViews }"/></td>
					                    <td style="text-align: center;"><c:out value="${ arr.boardPostDate }"/></td>
					                </tr>
					                <!-- 광고 끼워넣기 -->
				                <c:if test="${ num.index == 2 }">
				                	<c:forEach var="adarr" items="${ randomAd }" varStatus="adNum">
				                		<c:if test="${ adNum.index == 0 }">
					                		<tr class="general" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/detail?adCode=${ adarr.adCode }'">
							                	<td class="blink" style="color:red; text-align: center; font-weight: 600; font-size: 1.2em;">AD</td>
							                    <td style="text-align: center;"><c:out value="${ adarr.adTitle }"/></td>
							                    <td style="text-align: center;"><c:out value="${ adarr.companyName }"/></td>
					                			<td><input type="hidden" value="${ sessionScope.loginUser.code }" name="userCode"></td>
							                    <td style="text-align: center;"></td>
						                	</tr>
					                	</c:if>
				                	</c:forEach>
				                </c:if>
				                <!-- 광고 끼워넣기 -->
				                <c:if test="${ num.index == 5 }">
				                	<c:forEach var="adarr" items="${ randomAd }" varStatus="adNum">
				                		<c:if test="${ adNum.index == 1 }">
					                		<tr class="general" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/detail?adCode=${ adarr.adCode }'">
							                	<td class="blink" style="color:red; text-align: center; font-weight: 600; font-size: 1.2em;">AD</td>
							                    <td style="text-align: center;"><c:out value="${ adarr.adTitle }"/></td>
							                    <td style="text-align: center;"><c:out value="${ adarr.companyName }"/></td>
					                			<td><input type="hidden" value="${ sessionScope.loginUser.code }" name="userCode"></td>
							                    <td style="text-align: center;"></td>
						                	</tr>
					                	</c:if>
				                	</c:forEach>
				                </c:if>
			                </c:forEach>
			            </tbody>
			        </table>
			        <div class="text-center">
						<ul class="pagination">
						<li>
							<c:if test="${paging.startPage != 1 }">
								<li><a href="${ pageContext.servletContext.contextPath }/user/review?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<li><a>${p }</a></li>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<li><a href="${ pageContext.servletContext.contextPath }/user/review?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<li><a href="${ pageContext.servletContext.contextPath }/user/review?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
							</c:if>
							</li>
						</ul>
					</div>
	            </div>
            </section>
            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
</html>