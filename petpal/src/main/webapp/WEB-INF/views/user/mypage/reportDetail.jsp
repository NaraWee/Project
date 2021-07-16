<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .menutable > div > img {
                margin-bottom: 20px;
				width: 20%;
                margin: 0px auto;
                display: block;
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
                <div style="color: #45B99C; font-size: 25px; font-weight: 600; float: left">문의 / 신고 내역</div>
            </section> <!--End off Home Sections-->

            <section id="menutable" class="menutable">
				<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
		            <table class="table" style="margin-bottom: 50px; border-collapse: separate;">
		            <c:if test="${ type eq 'B' }">
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px;"><b>신고한 게시물</b></td>
							<td>${ report.title }</td>
							<td style="text-align: center; background-color: #F1FAF8;"><b>접수 상태</b></td>
							<c:if test="${ report.stateCode eq 0 }">
							<td style="border-radius: 0px 21px 0px 0px;"><c:out value="대기중"/></td>
							</c:if>
							<c:if test="${ report.stateCode eq 2 }">
							<td style="border-radius: 0px 21px 0px 0px;"><c:out value="승인"/></td>
							</c:if>
							<c:if test="${ report.stateCode eq 3 }">
							<td style="border-radius: 0px 21px 0px 0px;"><c:out value="거절"/></td>
							</c:if>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8;"><b>신고 일자</b></td>
							<td>${ report.date }</td>
							<td style="text-align: center; background-color: #F1FAF8;"><b>처리 날짜</b></td>
							<td>${ report.dDate }</td>
						</tr>
		            </c:if>
		            <c:if test="${ type eq 'C' }">
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px;"><b>신고한 댓글</b></td>
							<td>${ replyTitle }</td>
							<td style="text-align: center; background-color: #F1FAF8;"><b>접수 상태</b></td>
							<c:if test="${ stateCode eq 1 }">
							<td style="border-radius: 0px 21px 0px 0px;"><c:out value="대기중"/></td>
							</c:if>
							<c:if test="${ decision.stateCode eq 2 }">
							<td style="border-radius: 0px 21px 0px 0px;"><c:out value="승인"/></td>
							</c:if>
							<c:if test="${ decision.stateCode eq 3 }">
							<td style="border-radius: 0px 21px 0px 0px;"><c:out value="거절"/></td>
							</c:if>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8;"><b>신고 일자</b></td>
							<td>${ replyDate }</td>
							<td style="text-align: center; background-color: #F1FAF8;"><b>처리 날짜</b></td>
							<td>${ decision.dDate }</td>
						</tr>
		            </c:if>
					</table>
					<img src="${ pageContext.servletContext.contextPath }/resources/images/ccat.png"><br>
					<p style="margin-bottom: 50px; margin-left: 8px;">${ replyContent }</p>
		        </div>
				<c:if test="${ report.stateCode eq 3 }">
	                <div style="color: #45B99C; width: 70%; margin: 0px auto; font-weight: 550; margin-bottom: 10px;">관리자 답변</div>
					<div>
						<pre class="form-control textarea-layer" style="resize:none; width: 70%; height: 120px; margin-top: 10px; margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
						<c:out value="${ report.dReason }"/>
						</pre>
					</div>
				</c:if>
				<c:if test="${ decision.stateCode eq 3 }">
	                <div style="color: #45B99C; width: 70%; margin: 0px auto; font-weight: 550; margin-bottom: 10px;">관리자 답변</div>
					<div>
						<pre class="form-control textarea-layer" style="resize:none; width: 70%; height: 120px; margin-top: 10px; margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
						<c:out value="${ decision.dReason }"/>
						</pre>
					</div>
				</c:if>
            </section>

            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
</html>