<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            li > button {
                background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 400px; 
                height: 50px; 
                font-size: 14px; 
                font-weight: 600;
                border-radius: 10px;
                margin-bottom: 15px;
            }
            li > button:hover {
                background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid; 
            }
            div > img {
                width: 100%;
                height: 100%;
                margin-top: 35px;
                margin-bottom: 20px;
                text-align: center;
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

            <section id="mypage" class="mypage" style="text-align: center;">

                <div style="text-align: center; font-size: 35px; font-weight: 600;">
                    마이페이지
                </div>
                <div>
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/ccat.png" style="width: 100px; height: 100;">
                    <img src="${ pageContext.servletContext.contextPath }/resources/images/pcat.png" style="width: 100px; height: 100;">
                </div>

                <div style="font-size: 15px;">
                    닉네임 :<c:out value="${ sessionScope.loginUser.nikname }" /><br>
                    이메일 :<c:out value="${ sessionScope.loginUser.email }" />
                </div>

                <div>
                    <ul>
                        <li><button onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/account'" class="message" style="margin-top: 30px;">계정 관리</button></li>
                        <li><button onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/message?type=A'" class="account">쪽지 확인</button></li>
                        <li><button onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/boardCommentList'" class="borad">내가 쓴 게시글, 댓글</button></li>
                        <li><button onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/qnaAndReportList'" class="qna">문의, 신고 내역</button></li>
                        <li><button onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/list'" class="advertising">광고 내역</button></li>
                        <li style="margin-bottom: 50px; margin-top: 10px;"><a href="${ pageContext.servletContext.contextPath }/user/logout" class="logout" style="color: gray;">로그아웃</a></li>
                    </ul>
                    
                </div>
                
            </section> <!--End off Home Sections-->
            
                <c:if test="${ sessionScope.loginUser.permisson eq 2 || sessionScope.loginUser.permisson eq 3 }">

                <div>
                	<a href="${ pageContext.servletContext.contextPath }/admin/adminMain"><img src="${ pageContext.servletContext.contextPath }/resources/images/spanner.png" style="width: 30px; height: 30px; margin-left: 50px; margin-bottom: 50px; margin-top: -80px;"></a>
                </div>
                </c:if>          

            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>
            
            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>

</html>