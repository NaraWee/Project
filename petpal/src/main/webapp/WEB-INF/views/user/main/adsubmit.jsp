<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
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
                        <a class="navbar-brand" href="#brand">
                            <!-- <img src="assets/images/logo.png" class="logo" alt=""> -->
                            <p style="color: #19A985; font-weight: 800; font-size: 35px; margin-top: 5px;">PET-PAL</p>
                        </a>

                    </div>
                    <!-- End Header Navigation -->

                    <!-- navbar menu -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#home">실종신고/목격제보</a></li>                    
                            <li><a href="#features">입양게시판</a></li>
                            <li><a href="#business">정보공유</a></li>
                            <li><a href="#work">커뮤니티</a></li>
                            <li><a href="#test">마이페이지</a></li>
                            <li><a href="#contact">로그인</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div>

            </nav>

            <!--Home Sections-->

            <section id="mypage" class="mypage" style="text-align: center;">

                <div style="text-align: center; font-size: 35px; font-weight: 600; margin-top: 150px;">
                    마이페이지
                </div>
                <div>
                    <img src="../../../../resources/images/ccat.png" style="width: 100px; height: 100;">
                    <img src="../../../../resources/images/pcat.png" style="width: 100px; height: 100;">
                </div>

                <div>
                    닉네임 : 프로펫팔러<br>
                    이메일 : petal@petpal.com
                </div>

                <div>
                    <ul>
                        <li><button class="message" style="margin-top: 30px;">계정 관리</button></li>
                        <li><button class="account">쪽지 확인</button></li>
                        <li><button class="borad">내가 쓴 게시글, 댓글</button></li>
                        <li><button class="qna">문의, 신고 내역</button></li>
                        <li><button class="advertising">광고 내역</button></li>
                        <li style="margin-bottom: 50px; margin-top: 10px;"><a href="" class="logout" style="color: gray;">로그아웃</a></li>
                    </ul>
                </div>
                
            </section> <!--End off Home Sections-->

            <!-- 오른쪽 배너 -->
            <div style="position: fixed;right: 20px;top:25%; background-color: #F1FAF8; border-radius: 20px;">
                <ul>
                    <li><img src="../../../../resources/images/conversation.png" style="width: 100px; height: 100;"></li>
                    <li style="text-align: center;">광고 문의</li>
                    <li><img src="../../../../resources/images/adqna.png" style="width: 100px; height: 100;"></li>
                    <li style="text-align: center;">불편 문의</li>
                    <li><img src="../../../../resources/images/clipboard.png" style="width: 100px; height: 100;"></li>
                    <li style="text-align: center; margin-bottom: 20px;">광고 신청</li>
                </ul>
            </div>

            <footer>
                <section id="business" class="business bg-grey roomy-70" style="background-color: #F1FAF8; padding-top: 80px; padding-bottom: 20px">
                
                    <div class="container">
                <p>
                    <b>고객행복센터 7777-77777</b>
                    오전 9시 - 새벽 3시
                </p>
                <address>
                    (주) petpal company<br>
                    주소 : 서울특별시 서초구 강남대로 441 5층 503호<br>
                    대표이사 : 유승제<br>
                    전화번호 : 02-7777-7777<br>
                    이메일 : petpal@petpal.com<br>
                </address>
                
            </div>
            </section>
            </footer>
        </div>
            

        <!-- JS includes -->

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/bootstrap.min.js"></script>

        <script src="${ pageContext.servletContext.contextPath }/resources/js/owl.carousel.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.magnific-popup.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.easing.1.3.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.collapse.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/bootsnav.js"></script>



        <script src="${ pageContext.servletContext.contextPath }/resources/js/plugins.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/main.js"></script>
</html>