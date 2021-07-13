<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<style>
	div.mmiddle {
    margin-left: 25%;
    margin-right: 25%;
	}
	div.cont_inner button, .nickNameCheck {
		border-radius: 10px;
		margin-top: 5px;
		background: #6eceda;
		color: white;
		border-style: none;
		box-shadow: 0 3px 0 #0e8c73;
		height: 35px;
	}
	div.cont_inner button:hover, .nickNameCheck:hover {
	background-color: #4aa9b6;
	box-shadow: 0 3px 0 #23a188;
	}
	div.cont_inner button:active, .nickNameCheck:active {
	box-shadow: none;
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
}

.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  position: fixed;
  width: 60%;
  padding: 10px;
  max-width: 500px;
  border-radius: 10px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: rgba(255, 255, 255, .9);
  /* "delay" the visibility transition */
  -webkit-transition: opacity .5s, visibility 0s linear .5s;
  transition: opacity .5s, visibility 0s linear .5s;
  z-index: 1;
}

.popup:target {
  visibility: visible;
  opacity: 1;
  /* cancel visibility transition delay */
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
  font-weight: bold;
}

.popup .close:hover {
  color: #6eceda;
}

	</style>
<title>봉그다 숙박숙박</title>
<link href="${ pageContext.servletContext.contextPath }/resources/guest/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ pageContext.servletContext.contextPath }/resources/guest/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${ pageContext.servletContext.contextPath }/resources/guest/js/scripts.js"></script>
<link href="${ pageContext.servletContext.contextPath }/resources/guest/css/styles.css" rel="stylesheet">
<!--//menu-->
<!--theme-style-->
<link href="${ pageContext.servletContext.contextPath }/resources/guest/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<!--header-->
<jsp:include page="../../common/guestheader.jsp"/>

<div class=" banner-buying">
	<div class=" container">
	<h3><span>마이페이지</span></h3> 

	<div class="clearfix"> </div>      		
	</div>
</div>
<!--//header-->
<!--blog-->
<div class="blog">
<div class="container">
	<h3></h3>
	<div class="blog-list">
		<nav>
		<div class="col-md-3 blog-sidebar">
		<ul style="padding-top: 70px;">
			<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/point/select">포인트</a></li>
			<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/coupon/select">쿠폰함</a></li>
			<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/userbooklist/select">예약 내역</a></li>
			<li class="blog-list" style=" font-size: 1.3em; font-weight: 600;"><a href="${ pageContext.servletContext.contextPath }/usermyinfo/select" style="color: #6eceda;">내 정보 관리</a></li>
			<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/userreportlist/select">신고내역</a></li>
		</ul>
		</div>
		</nav>
	</div>


	<div class="mmiddle">
	<div class="tab">
		<span class="tab_btn active">내정보 수정</span>
	</div>

	<div id="cont_area" style="padding-top: 30px;"><!-- 본문 콘텐츠-->
		<div class="cont_inner" id="policy_page" style="min-height: 435px; text-align: left; float: left;">
			<!-- 마이페이지 이미지 -->
			<div><img src="https://image.goodchoice.kr/profile/ico/ico_22.png" alt=""></div>
			<br>
			<!-- 마이페이지 누적 신고 횟수 -->
			<div style="padding-bottom: 50px; text-align: right; float: right; width: 100%;">
				<img src="${ pageContext.servletContext.contextPath }/resources/guest/images/신고.jpg" style="width: 30px; height: 35px; padding-bottom: 8px;">
				<b style="font-size: 20px;">누적 신고 횟수</b>
				<span style="color: red;">&nbsp<span class="warningcount"><c:out value="${ requestScope.userMyinfo.reportCnt }"/></span>회</span>
			</div>
			<br><br>
			
			<!-- 마이페이지 닉네임 -->
			<div style="padding-bottom: 50px; text-align: left; float: left; width: 100%;">
				<b style="font-size: 20px;">닉네임</b>
				<span>&nbsp<c:out value="${ requestScope.userMyinfo.nickName }"/></span>
				<br>
				
				<form action="${ pageContext.servletContext.contextPath }/usermyinfo/update" method="post" onsubmit="return modifyNickName()">
				<input type="text" name="userNickName" id="userNickName" value="" placeholder="변경할 닉네임을 입력해주세요." style="width: 40%; height: 35px;">
				&nbsp;<input type="button" value="중복확인" onclick="nickNameCheck()" class="nickNameCheck">
				<input type="hidden" name="idDuplication" value="idUncheck">
				<br>
				<button class="btns-wrap__submit-btn" type="submit">수정완료</button>
				<button class="btns-wrap__cancle-btn" type="reset">수정취소</button>
   				</form>
   				
			</div>
			
			<!-- 마이페이지 휴대폰번호 -->
			<div style="padding-bottom: 50px; text-align: left; float: left; width: 100%;">
				<b style="font-size: 20px;">휴대폰 번호</b>
				<span>&nbsp<c:out value="${ requestScope.userMyinfo.userPhone }"/></span>
				<p style="font-size: 15px;">개인 정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</p>
				
				<form action="${ pageContext.servletContext.contextPath }/usermyinfo/update" method="post" onsubmit="return modifyphonenumber()">
				<input type="text" name="userPhone" id="userPhone" value="" placeholder="변경할 번호를 입력해주세요." style="width: 40%; height: 35px;">
				<br>
				<button class="btns-wrap__submit-btn" type="submit">수정완료</button>
				<button class="btns-wrap__cancle-btn" type="reset">수정취소</button>
				</form>
			</div>

			<!-- 마이페이지 비밀번호 -->
			<div style="padding-bottom: 50px; text-align: left; float: left; width: 100%; padding-bottom: 100px;">
				<b style="font-size: 20px;">비밀번호</b>
				<br>
				<form action="${ pageContext.servletContext.contextPath }/usermyinfo/update" id="pwdform" method="post" onsubmit="return modifypwd()">
				<input type="password" name="userPwd" id="pwd" onchange="isSame()" value="" placeholder="새로운 비밀번호를 입력하세요" style="width: 40%; height: 35px; margin-bottom: 10px;">
				<br>
				<input type="password" id="pwdcheck" onchange="isSame()" value="" placeholder="비밀번호 확인" style="width: 40%; height: 35px;">&nbsp;&nbsp;<span id="same"></span>
				<br>
				<button class="btns-wrap__submit-btn" type="submit">수정완료</button>
				<button class="btns-wrap__cancle-btn" type="reset">수정취소</button>
				</form>
			</div>


			<script>

			/* 닉네임 수정 유효성 */
			var nickNameCnt = 0;
			
			function nickNameCheck() {
				var intputNickname = document.getElementById("userNickName").value;
				
				$.ajax({
			         url: "${ pageContext.servletContext.contextPath }/usernickname/select",
			         type: "get",
			         data:{ intputNickname : intputNickname },
			         success: function(data,textStatus,xhr){
			        	 console.log(data);
			            if (data == '0'){
			               alert("사용할 수 있는 닉네임입니다.");
			               nickNameCnt = 1;
			            } else if(data != '0') {
			                alert("이미 사용중인 닉네임입니다.");
			            }
			         },
			         error: function(xhr, status, error){
			            console.log(xhr);
			            console.log(status);
			            console.log(error);
			         }
			         
			      });
			}
			
			/* 닉네임 수정 유효성 */
			function modifyNickName() {
				var nickName = document.getElementById("userNickName").value;
				
				if(nickName!='') {
					if(nickNameCnt != 0) {
						alert("닉네임이 변경되었습니다.");
	               	 	return true;
	            	} else {
	                	alert("중복확인을 해주세요.");
	                	return false;
	            	}
				} else {
					alert("닉네임을 입력해주세요.");
					return false;
				}
			}
			
			/* 전화번호 수정 유효성 */
			function modifyphonenumber() {
				var phone = document.getElementById("userPhone").value;
				var regExp = /010-\d{4}-\d{4}/;
				
				if(phone!='') {
					if(regExp.test(phone)) {
						alert("전화번호가 변경되었습니다.");
	               	 	return true;
	            	} else {
	                	alert("전화번호 형식으로 입력해주세요. (ex.010-xxxx-xxxx)");
	                	return false;
	            	}
				} else {
					alert("전화번호를 입력해주세요.");
					return false;
				}
			}

			/* 비밀번호 변경 유효성 */
			function isSame() {
				var pwd = document.getElementById("pwd").value;
				var pwdcheck = document.getElementById("pwdcheck").value;
				if(pwd!='' && pwdcheck!='') {
					if(pwd == pwdcheck) {
						document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
						document.getElementById('same').style.color='blue';
					}
					else {
						document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
						document.getElementById('same').style.color='red';
					}
				}
			}

			/* 비밀번호 변경 유효성 */
			function modifypwd() {
				var pwd = document.getElementById("pwd").value;
				var pwdcheck = document.getElementById("pwdcheck").value;
				if(pwd!='' && pwdcheck!='') {
					if(pwd == pwdcheck) {
						alert("비밀번호가 변경되었습니다.");
						return true;
					}
					else {
						alert("비밀번호가 일치하지 않습니다.");
						return false;
					}
				} else {
					alert("비밀번호를 입력해주세요.");
					return false;
				}
			}
			</script>

			<!-- 로그아웃 -->
			<div class="bot_btn">
				<button type="button" onclick="location.href='#pop02'">로그아웃</button>
				<div id="pop02" class="overlay">
					<div class="popup">
						<a href="#none" class="close">&times;</a>

							<div class="cont-step cont-step_02" id="contStep02" style="display: block;">
								<div class="cont-step_preface">
									로그아웃되었습니다.
								</div>
								<div class="password-wrap">
									<div class="button-wrap"><button class="btn_submit disabled" onclick="location.href='${ pageContext.servletContext.contextPath }/usermypage/logout'">확인</button></div>
								</div>
							</div>

					</div>
				</div>

				<button type="button" onclick="location.href='#pop01'">회원탈퇴</button>

				<!-- 회원탈퇴 팝업창 -->
				<form action="${ pageContext.servletContext.contextPath }/userwithdraw/update" method="post">
				<div id="pop01" class="overlay">
					<div class="popup">
						<a href="#none" class="close">&times;</a>
							<p style="font-size: 20px; color: red; padding-bottom: 10px;">회원탈퇴</p>
							<div class="cont-step cont-step_02" id="contStep02" style="display: block;">
								<div class="cont-step_preface">
									<h3>왜 떠나시는지 이유가 있을까요? </h3>
								</div>
								<!-- 탈퇴이유 -->
								<ul class="reason-list" style="text-align: left;">
									<li>
										<input id="reasonRdo0" type="radio" name="radios" value="사용을 잘 안하게 돼요">
										<label for="reasonRdo0">사용을 잘 안하게 돼요</label>
									</li>
									<li>
										<input id="reasonRdo1" type="radio" name="radios" value="예약하고 싶은 숙소가 없어요">
										<label for="reasonRdo1">예약하고 싶은 숙소가 없어요</label>
									</li>
									<li>
										<input id="reasonRdo2" type="radio" name="radios" value="예약, 취소, 혜택받기 등 사용이 어려워요">
										<label for="reasonRdo2">예약, 취소, 혜택받기 등 사용이 어려워요</label>
									</li>
									<li>
										<input id="reasonRdo3" type="radio" name="radios" value="혜택(쿠폰, 포인트)이 너무 적어요">
										<label for="reasonRdo3">혜택(쿠폰, 포인트)이 너무 적어요</label>
									</li>
									<li>
										<input id="reasonRdo4" type="radio" name="radios" value="개인정보 보호를 위해 삭제할 정보가 있어요">
										<label for="reasonRdo4">개인정보 보호를 위해 삭제할 정보가 있어요</label>
									</li>
									<li>
										<input id="reasonRdo5" type="radio" name="radios" value="다른 계정이 있어요">
										<label for="reasonRdo5">다른 계정이 있어요</label>
									</li>
									<li>
										<input id="reasonRdo6" type="radio" name="radios" value="기타" checked>
										<label for="reasonRdo6">기타</label>
										<div class="reason-innder-box reason-innder-box6"  style="margin-bottom: 10px;">
											<input id="reasonDetail" name="reason" style="width:100%;float: left;" placeholder="사유를 입력하세요">
										</div>
									</li>
									</ul>
								<div class="password-wrap">
									<div class="button-wrap"><button class="btn_submit disabled" onclick="location.href='index.jsp'">탈퇴하기</button></div>
								</div>
							</div>
							<script>
							$(document).ready(function(){
 
								// 라디오버튼 클릭시 이벤트 발생
								$("input:radio[name=radios]").click(function(){
							 
									if($("input[name=radios]:checked").val() == "기타"){
										$("input:text[name=reason]").attr("disabled",false);
										// radio 버튼의 value 값이 OTHER이라면 활성화
							 
									}else {
										  $("input:text[name=reason]").attr("disabled",true);
										// 그 외에는 비활성화
									}
								});
							});
							
						</script>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	<div class="clearfix"> </div>
	<br><br><br>
</div>
</div>
<!--//blog-->
<!--footer-->
<div class="footer">
	<div class="container">
		<div class="footer-top-at">
			<div class="col-md-3 amet-sed">
				<h4>Our Company</h4>
				<ul class="nav-bottom">
					<li><a href="about.html">About Us</a></li>
					<li><a href="blog.html">For Sale By Owner Blog</a></li>
					<li><a href="mobile_app.html">Mobile</a></li>
					<li><a href="terms.html">Terms & Conditions</a></li>
					<li><a href="privacy.html">Privacy Policy</a></li>	
					<li><a href="blog.html">Blog</a></li>
					
				</ul>	
			</div>
			<div class="col-md-3 amet-sed ">
				<h4>Work With Us</h4>
					<ul class="nav-bottom">
						<li><a href="single.html">Real Estate Brokers</a></li>
						<li><a href="single.html">Business Development</a></li>
						<li><a href="single.html">Affiliate Programs</a></li>
						<li><a href="contact.html">Sitemap</a></li>
						<li><a href="career.html">Careers</a></li>
						<li><a href="feedback.html">Feedback</a></li>	
					</ul>	
			</div>
			<div class="col-md-3 amet-sed">
				<h4>Customer Support</h4>
				<p>Mon-Fri, 7AM-7PM </p>
				<p>Sat-Sun, 8AM-5PM </p>
				<p>177-869-6559</p>
					<ul class="nav-bottom">
						<li><a href="#">Live Chat</a></li>
						<li><a href="faqs.html">Frequently Asked Questions</a></li>
						<li><a href="suggestion.html">Make a Suggestion</a></li>
					</ul>	
			</div>
			<div class="col-md-3 amet-sed ">
				<h4>Property Services</h4>
				   <ul class="nav-bottom">
						<li><a href="single.html">Residential Property</a></li>
						<li><a href="single.html">Commercial Property</a></li>
						<li><a href="login.html">Login</a></li>
						<li><a href="register.html">Register</a></li>
						<li><a href="typo.html">Short Codes</a></li>	
					</ul>	
					<ul class="social">
						<li><a href="#"><i> </i></a></li>
						<li><a href="#"><i class="gmail"> </i></a></li>
						<li><a href="#"><i class="twitter"> </i></a></li>
						<li><a href="#"><i class="camera"> </i></a></li>
						<li><a href="#"><i class="dribble"> </i></a></li>
					</ul>
			</div>
		<div class="clearfix"> </div>
		</div>
	</div>
	<div class="footer-bottom">
		<div class="container">
		<div class="col-md-4 footer-logo">
			<h2><a href="index.html">Bonggeuda</a></h2>
		</div>
		<div class="col-md-8 footer-class">
			<p >© 2021 Bonggeuda SUKBAKSUKBAK. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">Bonggeuda</a> </p>
		</div>
	<div class="clearfix"> </div>
	 </div>
	</div>
</div>
<!--//footer-->
</body>
</html>