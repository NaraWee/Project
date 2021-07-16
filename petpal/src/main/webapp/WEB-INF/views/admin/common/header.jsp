<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/report.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/admin/success_modalpop.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/magnific-popup.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootsnav.css">


        <!--Theme custom css -->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">
        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/colors/maron.css">-->

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" />

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
   		<script src="https://kit.fontawesome.com/4978ce16d0.js" crossorigin="anonymous"></script>
    </head>
<body>

   


        <div class="culmn">
        
      <nav class="navbar navbar-default bootsnav navbar-fixed" style="background-color: #F1FAF8;">
               <!-- Start Top Search -->
                <div class="top-search">
                    <div class="container">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search">
                            <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                        </div>
                    </div>
                </div>
                <!-- End Top Search -->


                <div class="container"> 
                    <div class="attr-nav" style="
                    margin-right: -40px;
                    margin-bottom: -100px;
                    margin-top: -20px;">
                        <ul style="margin-right:-100px;">
                            <li class="mypage"><a href="${pageContext.servletContext.contextPath }/main"><img src="${ pageContext.servletContext.contextPath }/resources/images/user.png" alt="profile" style="height: 50px;width: 50px;margin-top: 7px;margin-left: 15px;"></a></li>
                        	<li style="height: 50px;width: 70px;margin-top: 40px; text-align:center;'">
                        		<a href="${ pageContext.servletContext.contextPath }/admin/logout" class="logout" style="color: gray;padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 0px;">
                        			${ sessionScope.loginUser.name }
                        		</a>
                        
                        	<c:if test="${ sessionScope.loginUser.permisson eq 2 }">서브관리자</c:if>
                        	<c:if test="${ sessionScope.loginUser.permisson eq 3 }">대표관리자</c:if>
                        	</li>
                        </ul>
                    </div> 

                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                            <i class="fa fa-bars"></i>
                        </button>
                    
                     <div style="color: #19A985; font-weight: 800; font-size: 35px; margin-top: 25px; margin-left: -45px"
                          onclick="location.href='${pageContext.servletContext.contextPath }/admin/adminMainPage'">
                     PET-PAL
                     </div>
                        

                    </div>
                    <!-- End Header Navigation -->

                    <!-- navbar menu -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right">
                           <li><a href="${pageContext.servletContext.contextPath }/admin/adminList">관리자 관리</a></li>                    
                            <li class="dropdown"><a href="${pageContext.servletContext.contextPath }/admin/paymentManageList" class="dropdown-category" id="dropdownPaymentMenu" data-toggle="dropdown">결제 관리 <i class="caret"></i></a> 
                               <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownPaymentMenu" style="width:130px;" > 
                                  <li style="text-align:center;"><a class="dropdown-item" aria-current="true" href="${pageContext.servletContext.contextPath }/admin/payList">광고 결제 관리</a></li> 
                                  <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath }/admin/taxManageList">세금계산서 관리</a></li> 
                               </ul> 
                            </li>

                            <li><a href="blackList">유저 관리</a></li>
                            <li class="dropdown"><a href="adApproveList" class="dropdown-category" id="dropdownAskMenu" data-toggle="dropdown"> 광고 <i class="caret"></i></a> 
                               <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownADMenu" style="width:130px;" > 
                                  <li><a class="dropdown-item" aria-current="true"  href="${ pageContext.servletContext.contextPath }/admin/adApproveList">광고 심사</a></li> 
                                  <li><a class="dropdown-item" href="${ pageContext.servletContext.contextPath }/admin/adList">광고 관리</a></li> 
                               </ul> 
                            </li>
                             <li><a href="${pageContext.servletContext.contextPath }/admin/reviewList"> 검토 게시판 </a></li>
                             <li class="dropdown"><a href="${ pageContext.servletContext.contextPath }/views/admin/main/report.jsp" class="dropdown-category" id="dropdownAskMenu" data-toggle="dropdown"> 신고/문의 게시판 <i class="caret"></i></a> 
                               <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownAskMenu" style="width:130px;" > 
                                  <li><a class="dropdown-item" aria-current="true" href="${pageContext.servletContext.contextPath }/admin/reportList">신고 게시판</a></li> 
                                  <li><a class="dropdown-item" href="${pageContext.servletContext.contextPath }/admin/askList">문의 게시판</a></li> 
                               </ul> 
                            </li>
                            <li><a href="newsLetterList">뉴스레터</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->

                </div> 

            </nav>

            <!--헤더와 바디 사이 공간 유지 -->

            <div id="home" class="home" style="padding-top: 0%; padding-bottom:130px">
           
            </div> 

            <!--헤더와 바디 사이 공간 유지 -->
           
           <!-- 로딩이미지 -->
           <!--  <div id="loading">
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object" id="object_one"></div>
                    <div class="object" id="object_two"></div>
                    <div class="object" id="object_three"></div>
                    <div class="object" id="object_four"></div>
                </div>
            </div>
        </div> -->

</body>
</html>