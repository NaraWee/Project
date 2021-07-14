<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            button {
                background-color: #19A985; 
                color: white;
                border-color: #19A985; 
                border: 1px solid; 
                width: 200px; 
                height: 50px; 
                font-size: 14px; 
                font-weight: 600;
                border-radius: 10px;
            }
            .footer-links > ul > li > a{
                color: #797979;
            }
            .footer-links > ul > li > a:hover{
                color: #45B99C;
            }
            .home {
            	background: url(${ pageContext.servletContext.contextPath }/resources/images/main.jpg) no-repeat scroll  center center !important;
            	background-size: cover !important;
			    position: relative !important;
			    padding-top: 300px !important;
			    padding-bottom: 190px !important;
			    width:100% !important;
            }
            .port_img > img {
            	cursor: pointer;
            }
            .icon-chevron-right::before, .icon-chevron-left::before {
            	content: none !important;
            }
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">
<script>
	window.onload = function() {
		console.log("window onload!");
		
		//회원가입시 메세지 띄우기
		const message = '${ requestScope.message }';
		console.log(message);
		if(message != null && message != '') {
			alert(message);
		}
		
	}
</script>

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


            <jsp:include page="../common/header.jsp"/>

            <!--Home Sections-->

            <section id="home" class="home bg-black fix">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="main_home text-center">
                            <div class="col-md-12">
                                <div class="hello_slid">
                                    <div class="slid_item">
                                        <div class="home_text ">
                                            <h2 class="text-white">Welcome to <strong>PET-PAL</strong></h2>
                                            <h1 class="text-white">반려동물이 당신에게 보내는 메시지, 펫팔</h1>
                                            <h3 class="text-white">- A message from your pet to you, PetPal -</h3>
                                        </div>

                                        <div class="home_btns m-top-40">
                                            <a href="#test" class="btn btn-primary m-top-20">펫팔 둘러보기</a>
                                        </div>
                                    </div><!-- End off slid item -->
                                    <div class="slid_item">
                                        <div class="home_text ">
                                            <h2 class="text-white">Welcome to <strong>PET-PAL</strong></h2>
                                            <h1 class="text-white">더이상 사지않고 입양하는 문화를 만듭니다</h1>
                                            <h3 class="text-white">- We create a culture of adopting rather than buying -</h3>
                                        </div>

                                        <div class="home_btns m-top-40">
                                            <a href="#test" class="btn btn-primary m-top-20">펫팔 둘러보기</a>
                                        </div>
                                    </div><!-- End off slid item -->
                                </div>
                            </div>
                        </div>
                    </div><!--End off row-->
                </div><!--End off container -->
            </section> <!--End off Home Sections-->


            <!--Featured Section-->
            <section id="features" class="features" style="background-color: #F1FAF8;">
                <div class="container">
                    <div class="row">
                        <div class="main_features fix roomy-70">
                            <div class="col-md-4">
                                <div class="features_item sm-m-top-30">
                                    <div class="f_item_text">
                                        <h3><b style="font-size: 2rem; color: #00a885;">1. </b>Information platform</h3>
                                        <p>초보 반려인이나 반려동물을 입양할지 고민하고 있는 사람들에게 반려동물이 피해야 할 음식부터, 예방주사, 의료 관련 지식 등 여러 분야에 걸친 필수 지식들을 보여준다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="features_item sm-m-top-30">
                                    <div class="f_item_text">
                                        <h3><b style="font-size: 2rem; color: #00a885;">2. </b>Social community</h3>
                                        <p>반려동물을 기르는 사람들 간의 친목을 도모하고 그 가운데에서 소소한 정보 나눔을 할 수 있다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="features_item sm-m-top-30">
                                    <div class="f_item_text">
                                        <h3><b style="font-size: 2rem; color: #00a885;">3. </b>Helping abandoned, missing animals platform</h3>
                                        <p>반려동물 커뮤니티라는 특성을 통해 유기, 실종 동물의 입양 및 찾는데 도움을 줄 수있다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- End off row -->
                </div><!-- End off container -->
            </section><!-- End off Featured Section-->


           

            <!--product section-->
            <section id="test" class="product">
                <div class="container">
                    <div class="main_product roomy-80">
                        <div class="head_title text-center fix">
                            <h2 class="text-uppercase">PET-PAL</h2>
                            <h5>펫팔 한눈에 보기</h5>
                        </div>
                        <!-- Wrapper for slides -->
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="port_item xs-m-top-30">
                                        <div class="port_img">
                                            <img src="${ pageContext.servletContext.contextPath }/resources/images/wanted.png"
                                            style="width: 290px; height: 250px;"
                                             onclick="location.href='${ pageContext.servletContext.contextPath }/user/missing'">
                                        </div>
                                        <div class="port_caption m-top-20">
                                            <h5>실종신고 / 목격제보</h5>
                                            <h6>- 실종신고, 목격제보</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="port_item xs-m-top-30">
                                        <div class="port_img">
                                            <img src="${ pageContext.servletContext.contextPath }/resources/images/catbox.png"
                                            style="width: 290px; height: 250px;"
                                             onclick="location.href='${ pageContext.servletContext.contextPath }/user/adopt'">
                                        </div>
                                        <div class="port_caption m-top-20">
                                            <h5>입양게시판</h5>
                                            <h6>- 입양홍보, 입양하기</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="port_item xs-m-top-30">
                                        <div class="port_img">
                                            <img src="${ pageContext.servletContext.contextPath }/resources/images/dogbook2.png"
                                            style="width: 290px; height: 250px;"
                                             onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/shareInfo/list'">
                                        </div>
                                        <div class="port_caption m-top-20">
                                            <h5>정보공유</h5>
                                            <h6>- 일반 정보, 펫 프랜들리 플레이스</h6>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="port_item xs-m-top-30">
                                        <div class="port_img">
                                            <img src="${ pageContext.servletContext.contextPath }/resources/images/pcat.png" 
                                            style="width: 290px; height: 250px;"
                                            onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/freeboard/list'">
                                        </div>
                                        <div class="port_caption m-top-20">
                                            <h5>커뮤니티</h5>
                                            <h6>- 자유게시판, 무료나눔, 용품리뷰</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- End off row -->
                </div><!-- End off container -->
            </section><!-- End off Product section -->

            <footer>
             <!--Business Section-->
             <section id="business" class="business bg-grey roomy-70" style="background-color: #F1FAF8; padding-top: 50px; padding-bottom: 20px">
                
                    <div class="container">
              
                      <div class="row">
              
                        <div class="col-lg-6">
              
                          <div class="row">
              
                            <div class="col-sm-6" style="padding-left: 0px;">
              
                              
              
                              <div class="footer-newsletter">
                                <h4>Developers information</h4>
                                <p>
					                                    김유진 : https://github.com/YuJin-Kimm<br>
					                                    김해인 : https://github.com/haein-side<br>
					                                    손성훈 : https://github.com/son-sung-hun<br>
					                                    위나라 : https://github.com/NaraWee<br>
					                                    황주희 : https://github.com/juheehwang<br>
                                </p>
                              </div>

                            <br><br>

                              <div class="footer-links">
                                <h4>Contact Us</h4>
                                <p>
					                               서울특별시 <br>
					                               서초구 강남대로 441<br>
                                  5층 503호 <br>
                                  <strong>Phone:</strong> 02-7777-7777<br>
                                  <strong>Email:</strong> petpal@petpal.com<br>
                                </p>
                              </div>
              
                            </div>
              
                                

                            <div class="col-sm-6">
                              <div class="footer-links" style="margin-left: 20px;">
                                <h4>Useful Links</h4>
                                <ul>
                                  <li><a href="${ pageContext.servletContext.contextPath }/user/main/usefulLinks">이용약관</a></li>
                                  <li><a href="${ pageContext.servletContext.contextPath }/user/main/usefulLinks">개인정보처리방침</a></li>
                                </ul>
                              </div>
              
                              
              
                            </div>
              
                          </div>
              
                        </div>
              
                        <div class="col-lg-6">
              
                          <div class="form">
              
                            <h4>문의 하기</h4>
                            <p>문의 하기 기능은 회원만 이용하실 수 있습니다.<br>문의하기를 이용하시고 싶은 분들은 <b>회원가입 및 로그인</b>을 먼저 해주세요</p>
              
                            <form action="${ pageContext.servletContext.contextPath }/user/question" method="post"name="form" class="php-email-form">
                              <div class="form-group" id="question">
                                <input type="text" name="boardTitle" class="form-control" id="title" placeholder="문의 제목을 적어주세요" required>
                              </div>
                              <div class="form-group mt-3">
                                <textarea class="form-control" name="boardContent" rows="5" placeholder="문의 내용을 적어주세요" required style="resize: none;"></textarea>
                                <c:if test="${ empty loginUser }">
                                <input type="hidden" name="userCode" value="0">
                                </c:if>
                                <c:if test="${ !empty loginUser }">
                                <input type="hidden" name="userCode" value="${ loginUser.code }">
                                </c:if>
                              </div>
                              <div class="text-center"><button type="submit" style="color: white;">문의 보내기</button></div>
                            </form>
                          </div>
              
                        </div>
              
                      </div>
              
                    </div>
            </section><!-- End off Business section -->
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