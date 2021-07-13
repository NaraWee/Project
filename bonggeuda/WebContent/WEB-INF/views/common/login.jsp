<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.login-icons button {
		border-radius: 10px;
		margin-top: 5px;
		background: #6eceda;
		color: white;
		border-style: none;
		box-shadow: 0 3px 0 #0e8c73;
		height: 35px;
	}
	.login-icons button:hover {
		background-color: #4aa9b6;
		box-shadow: 0 3px 0 #23a188;
	}
	.login-icons button:active {
		box-shadow: none;
	}
	.adminlogin-icons button {
		border-radius: 10px;
		margin-top: 5px;
		background: #c9c9c9;
		color: white;
		border-style: none;
		box-shadow: 0 3px 0 #999999;
		height: 35px;
	}
	.adminlogin-icons button:hover {
		background-color: #999999;
		box-shadow: 0 3px 0 #999999;
	}
	.adminlogin-icons button:active {
		box-shadow: none;
	}
	.space_or {
    	position: relative;
    	height: 40px;
    	margin-bottom: 8px;
	}
	.space_or:after {
	    content: '';
	    position: absolute;
	    top: 50%;
	    left: 0;
	    width: 100%;
	    height: 1px;
	    background: rgba(0,0,0,0.08);
	}
	.space_or span {
	    display: inline-block;
	    position: absolute;
	    top: 0;
	    left: 50%;
	    z-index: 10;
	    width: 50px;
	    /* height: 40px; */
	    margin: 0 0 0 -25px;
	    background: #fff;
	    font-size: 14px;
	    line-height: 40px;
	    color: rgba(0,0,0,0.38);
	    text-align: center;
	}
</style>
<title>봉그다 숙박숙박</title>
<link href="${pageContext.servletContext.contextPath }/resources/admin/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.servletContext.contextPath }/resources/admin/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${pageContext.servletContext.contextPath }/resources/admin/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/admin/css/styles.css" rel="stylesheet">
<!--//menu-->
<!--theme-style-->
<link href="${pageContext.servletContext.contextPath }/resources/admin/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body style="background: white;">
<!--header-->
	<!-- <div class="navigation">
			<div class="container-fluid">
				<nav class="pull">
					<ul>
						<li><a  href="index.html">Home</a></li>
						<li><a  href="about.html">About Us</a></li>
						<li><a  href="blog.html">Blog</a></li>
						<li><a  href="terms.html">Terms</a></li>
						<li><a  href="privacy.html">Privacy</a></li>
						<li><a  href="contact.html">Contact</a></li>
					</ul>
				</nav>			
			</div>
		</div> -->

<div class="header">
	<div class="container">
		<!--logo-->
		<div class="logo">
			<h1><a href="${ pageContext.servletContext.contextPath }">BONGGEUDA</a></h1>
		</div>
		<!--//logo-->
		<div class="top-nav">
			<ul class="right-icons">

	<!-- 			<li><span ><a  href="index.html">사용자 관리</a></span></li>
				<li><a  href="about.html">업체 관리</a></li>
				<li><a  href="blog.html">예약현황</a></li>
				<li><a  href="terms.html">결제정보</a></li>
				<li><a  href="terms.html">온라인 문의</a></li>
				<li><a  href="login.html"><i class="glyphicon glyphicon-user"> </i>로그인</a></li> -->
				
			</ul>
		<div class="clearfix"> </div>
		<div class="clearfix"> </div>
		</div>	
	</div>
<!--//-->	
	<div class="clearfix"> </div>

</div>
<!--//header-->
<!--contact-->
<div class="login-right">
	<div class="container">
		<!-- <h3>Login</h3> -->
		<p class="space_or" style="width:50%; margin: 0 auto;"><span style="font-size: 40px; width:120px; left: 44%; background:#fff">Login</span></p><br>
		<div class="login-icons" style= "width: 100%;">
					<!-- <a id="custom-login-btn" href="javascript:loginWithKakao()">
  						<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
  					</a> -->

  					<!-- <a href="https://kauth.kakao.com/oauth/authorize?client_id=0e7b4b3a3265b6903de2c662f14dacc2&redirect_uri=http://localhost:8989/bonggeuda/user/kakao/login&response_type=code">
  						<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/>
  					</a> -->
  		</div>
<!--   		<br>
  		<br>
  		<p class="space_or" style="width:50%; margin: 0 auto;"><span>또는</span></p> -->
		<div class="login-top">
			<form action="" name="loginForm" method="post" onsubmit="return loginconfirm()"> 
				<div class="form-info">
					<input type="text" name="loginEmail" id="loginEmail" class="text" placeholder="Email Adress" style="width: 70%;">
					<input type="password" name="loginPassword" id=loginPassword placeholder="Password" style="width: 70%;">
					<br><br>
				</div>
				
				<!-- 사용자 로그인, 업체 로그인, 회원가입 -->
				<div class="login-icons" style= "width: 100%;">
  					<!-- <button class="api-btn" onclick="kakaoLogout()">로그아웃</button> -->
					<br>
					<button style="margin-right: 15px; width: 120px; height: 40px;" class="btns-wrap__submit-btn" type="button" onclick="login('1');">사용자 로그인</button>
					<button style="margin-right: 15px; width: 120px; height: 40px;" class="btns-wrap__submit-btn" type="button" onclick="login('2');">업체 로그인</button>
					<button style="margin-right: 15px; width: 130px; height: 40px;" class="btns-wrap__submit-btn" type="button" onclick="location.href='${pageContext.servletContext.contextPath }/login/check/regist';">사용자 회원가입</button>

					<button style="width: 130px; height: 40px;" class="btns-wrap__submit-btn" type="button" onclick="location.href='${pageContext.servletContext.contextPath }/login/check/registTwo';">업체 회원가입</button>

					<br>
					<div class="clearfix"> </div>
				</div>

				<br><br>
				
				<!-- 관리자 로그인 -->




				<div class="adminlogin-icons" style= "width: 100%;">
					<button style="width: 100px; height: 30px; float:right" class="btns-wrap__submit-btn" type="button" onclick="login('3');">관리자 모드</button>
				</div>
			</form>

				    
    
		<script type="text/javascript">
			Kakao.init('ef9dad5f79ec8fd8bd957ac3e023cbdd');
		
			/* 로그인 */
/* 		  	function loginWithKakao() {
		    	Kakao.Auth.login({
		      		success: function(authObj) {
		        	alert(JSON.stringify(authObj))
		      		},
		     	 	fail: function(err) {
		        	alert(JSON.stringify(err))
		      		},
		    		redirectUri: 'http://localhost:8989/bonggeuda/user/kakao/login'
		    	})
		  	} */
		  
 			/* 사용자 정보 가져오기 */
			/* Kakao.Auth.createLoginButton({
				container: '#kakao-login-btn',
				success: function(authObj) {
					Kakao.API.request({
				    	url: '/v2/user/me',
				    	success: function(res) {
				    		alert(JSON.stringify(res))
				    		var userId = res.id;
				    		var userEmail = res.kakao_account.email;
				    		var usernickName = res.properties.nickname;
				    		var image = res.properties.profile_image;
				    		var html = '<br>' + email + '<br>' + name;
				    		
				    		html += '<br><img src="' + image + '">';
				    		
				    		$('body').append(html);
				    		
				    		console.log("userEmail", userEmail);
				    		console.log("userNickName",userNickName);
				    		
				    	},
				    	fail: function(error) {
				        	alert(
				        	'login success, but failed to request user information: ' +
				        	JSON.stringify(error)
				        	)
				    	},
				    })
				    var token = authObj.access_token;
				},
				fail: function(err) {
				    alert('failed to login: ' + JSON.stringify(err))
				},
			}) */
				  
			function login(d) {
				var button = document.loginForm;
				
				if(d == 1) {
					button.action = "${ pageContext.servletContext.contextPath }/login/check/user";
					button.submit();
				} else if(d == 2) {
					button.action = "${ pageContext.servletContext.contextPath }/login/check/owner";
					button.submit();
				} else if(d == 3) {
					button.action = "${pageContext.servletContext.contextPath }/login/check/admin";
					button.submit();
				}
				
			}
			
		</script>

			
	</div>
</div>
</div>
<!--//contact-->
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
						<li><a href="#"><i class="gmail"></i></a></li>
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
				<h2><a href="index.html">BONGGEUDA</a></h2>
			</div>
			<div class="col-md-8 footer-class">
				<p >© 2015 Real Home. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">BONGGEUDA</a> </p>
			</div>
		<div class="clearfix"> </div>
	 	</div>
	</div>
</div>
<!--//footer-->
</body>
</html>