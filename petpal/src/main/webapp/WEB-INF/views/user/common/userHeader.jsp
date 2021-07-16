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
        <link rel="icon" type="image/png" href="${ pageContext.servletContext.contextPath }/resources/images/pawprint.png">

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


        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">

        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" />

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">

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

                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="${ pageContext.servletContext.contextPath }">
                            <!-- <img src="assets/images/logo.png" class="logo" alt=""> -->
                            <p style="color: #19A985; font-weight: 800; font-size: 35px; margin-top: 5px;">PET-PAL</p>
                        </a>

                    </div>
                    <!-- End Header Navigation -->

                    <!-- navbar menu -->
                    <c:if test="${ empty sessionScope.loginUser }">
                     <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="${ pageContext.servletContext.contextPath }/user/missing">실종신고/목격제보</a></li>                    
                            <li><a href="${ pageContext.servletContext.contextPath }/user/adopt">입양게시판</a></li>
                            <li><a href="${ pageContext.servletContext.contextPath }/user/select/shareInfo/list">정보공유</a></li>
                            <li><a href="#" class="dropdown-category" id="dropdownADMenu" data-toggle="dropdown"> 커뮤니티 <i class="caret"></i></a> 
                            	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownAskMenu" style="width:130px;" > 
		                            <li><a class="dropdown-item" aria-current="true" href="${ pageContext.servletContext.contextPath }/user/select/freeboard/list">자유 게시판</a></li> 
		                            <li><a class="dropdown-item" href="${ pageContext.servletContext.contextPath }/user/shareFree/list">무료나눔</a></li> 
		                            <li><a class="dropdown-item" href="${ pageContext.servletContext.contextPath }/user/review">용품리뷰</a></li> 
	                            </ul> 
	                        </li>
                            <li><a href="${ pageContext.servletContext.contextPath }/user/login">로그인</a></li>
                        </ul>
                    </div>
                    </c:if>
                    <c:if test="${ !empty sessionScope.loginUser }">
                     <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="${ pageContext.servletContext.contextPath }/user/missing">실종신고/목격제보</a></li>                    
                            <li><a href="${ pageContext.servletContext.contextPath }/user/adopt">입양게시판</a></li>
                            <li><a href="${ pageContext.servletContext.contextPath }/user/select/shareInfo/list">정보공유</a></li>
                            <li><a href="#" class="dropdown-category" id="dropdownADMenu" data-toggle="dropdown"> 커뮤니티 <i class="caret"></i></a> 
                            	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownAskMenu" style="width:130px;" > 
		                            <li><a class="dropdown-item" aria-current="true" href="${ pageContext.servletContext.contextPath }/user/select/freeboard/list">자유 게시판</a></li> 
		                            <li><a class="dropdown-item" href="${ pageContext.servletContext.contextPath }/user/shareFree/list">무료나눔</a></li> 
		                            <li><a class="dropdown-item" href="${ pageContext.servletContext.contextPath }/user/review">용품리뷰</a></li> 
	                            </ul> 
	                        </li>
                            <li><a href="${ pageContext.servletContext.contextPath }/user/mypage/">마이페이지</a></li>
                            <li><a href="${ pageContext.servletContext.contextPath }/user/logout">로그아웃</a></li>
                        </ul>
                    </div>
                    </c:if>
                </div>
            </nav>
            
            <section id="home" class="home bg-black fix" style="padding-top: 0%; background-color: white; background:white; padding-bottom: 10%;">
                <!-- <div class="overlay"></div> -->
            </section> 
