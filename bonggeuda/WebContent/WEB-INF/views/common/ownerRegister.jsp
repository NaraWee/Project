<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.signUp button {
		border-radius: 10px;
		margin-top: 5px;
		background: #6eceda;
		color: white;
		border-style: none;
		box-shadow: 0 3px 0 #0e8c73;
		height: 35px;
	}
	.signUp button:hover {
		background-color: #4aa9b6;
		box-shadow: 0 3px 0 #23a188;
	}
	.signUp button:active {
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
	.form-info span {
		width:105px;
		text-align:left;
	}
	.signup td {
	padding-right:15px;
	}
	.loginin {
		color:gray;
		margin-top: 40px;
	}
	.loginin a {
		color:black;
	}
	.loginin a:hover {
		color:#6eceda;
		text-decoration-line: none;
	}
</style>
<title>봉그다 숙박숙박</title>
<link href="${ pageContext.servletContext.contextPath }/resources/admin/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${ pageContext.servletContext.contextPath }/resources/admin/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${ pageContext.servletContext.contextPath }/resources/admin/js/scripts.js"></script>
<link href="${ pageContext.servletContext.contextPath }/resources/admin/css/styles.css" rel="stylesheet">
<!--//menu-->
<!--theme-style-->
<link href="${ pageContext.servletContext.contextPath }/resources/admin/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home  Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
				<h1><a href="${pageContext.servletContext.contextPath}">BONGGEUDA</a></h1>
			</div>
		<!--//logo-->
		<div class="top-nav">
<!-- 			<ul class="right-icons">

				<li><span ><a  href="adminUserManagement.html">사용자관리</a></span></li>
				<li><a  href="adminCompanyManagementInfo.html">업체관리</a></li>
				<li><a  href="adminReservationStatus.html">예약현황</a></li>
				<li><a  href="adminPaymentInformation.html">매출관리</a></li>
				<li><a  href="adminOnlineQuestionUser.html">문의&신고</a></li>
				<li><a  href="adminOnlineNotice.html">공지사항</a></li>
				<li><a  href="login.html"><i class="glyphicon glyphicon-user"> </i>로그인</a></li>
				
			</ul> -->

		<div class="clearfix"> </div>
		<div class="clearfix"> </div>
		</div>	
</div>
<!--//-->	
	<div class=" container">

	<div class="clearfix"> </div>
      		
	</div>
</div>
<!--//header-->
<!--contact-->
<div class="login-right">
	<div class="container">
		<p class="space_or" style="width:50%; margin: 0 auto;"><span style="font-size: 40px; width:160px; left: 45%; background:#fff">Register</span></p><br>
		<div class="login-top" style="padding-left: 170px;">
			<div class="form-info">
				<form action="${ pageContext.servletContext.contextPath }/login/check/registTwo" method="post" onsubmit="return registerCheck()">
					<table class="signup" style="text-align:left;">
						<tr>
							<td style="padding-bottom: 15px;">이메일 아이디</td>
							<td><input id="email" name="email" type="text" placeholder="이메일 주소를 입력해주세요." onchange="emailDuplication()" style="width: 250px;" ></td>
						</tr>
						<tr>
							<td colspan="2" id="emailDuplication" style="font-size:12px; text-align: right; padding-bottom:15px;"><span id="emailDuplication" style="line-height:15px;"></span></td>
						</tr>
						<tr>
							<td style="padding-bottom: 15px;">비밀번호</td>
							<td><input id="password" name="password" type="password" placeholder="비밀번호를 입력해주세요." onchange="isSame()" style="width: 250px;"></td>
						</tr>
						<tr>
							<td colspan="2" id="" style="font-size:12px; text-align: right; padding-bottom:15px;"><span id="" style="line-height:15px;"></span></td>
						</tr>
						<tr>
							<td style="padding-bottom: 15px;">비밀번호 확인</td>
							<td><input id="passwordCheck" name="passwordCheck" type="password" placeholder="비밀번호를 입력해주세요." onchange="isSame()" style="width: 250px;"></td>
						</tr>
						<tr>
							<td colspan="2" id="same" style="font-size:12px; text-align: right; padding-bottom:15px;"><span id="same" style="line-height:15px;"></span></td>
						</tr>
						<tr>
							<td style="padding-bottom: 15px;">전화번호</td>
							<td><input id="phone" name="phone" type="text" placeholder="전화번호를 입력해주세요." style="width: 250px;"></td>
						</tr>
						<tr>
							<td colspan="2" style="padding-bottom: 15px; font-size:12px; color:lightgray;">*전화번호는 010-xxxx-xxxx 형식으로 입력해주세요.</td>
						</tr>
					</table>
					<br>
					<div class="signUp" style="padding-right:100px;">
					<button style="width: 120px; height: 40px;" class="btns-wrap__submit-btn" type="submit">회원가입하기</button>
					</div>
	
				</form>
				<div class="loginin" style="padding-right: 120px;">등록된 계정이 있으신가요? <a href="${ pageContext.servletContext.contextPath }/login/test">로그인하기</a></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

	/* 이메일 중복확인 */
	var emailCnt = 0;
	function emailDuplication() {
		var intputEmail = document.getElementById("email").value;
		
		$.ajax({
	         url: "${ pageContext.servletContext.contextPath }/userinfo/duplication",
	         type: "get",
	         data:{ intputEmail : intputEmail },
	         success: function(data,textStatus,xhr){
	        	console.log(data);
				var regExp3 = /^[\w]+@[\w]+(\.[\w]+){1,3}$/;
	            if (data == 0){
	            	if(!regExp3.test(intputEmail)) {
	            		document.getElementById('emailDuplication').innerHTML='이메일 형식으로 입력해주세요.';
						document.getElementById('emailDuplication').style.color='red';
			    	} else {
	            	document.getElementById('emailDuplication').innerHTML='사용할 수 있는 이메일입니다.';
					document.getElementById('emailDuplication').style.color='blue';
	               	emailCnt = 1;
			    	}
	            } else if(data != 0) {
	            	document.getElementById('emailDuplication').innerHTML='이미 사용중인 이메일입니다.';
					document.getElementById('emailDuplication').style.color='red';
	            }
	         },
	         error: function(xhr, status, error){
	            console.log(xhr);
	            console.log(status);
	            console.log(error);
	         }
	         
	      });
	}

	/* 회원가입 유효성 테스트 */
	function registerCheck() {
		var num = 0;
		
		
		/* 이메일 유효성 */
		var email = document.getElementById("email").value;
		var regExp = /^[\w]+@[\w]+(\.[\w]+){1,3}$/;
		
		if(email!='') {
			if(!regExp.test(email)) {
		    	alert("aaa이메일 형식으로 입력해주세요.");
			} else {
				
				if(emailCnt != 0) {
					num++;
		    	} else {
		        	alert("aaa이미 사용중인 이메일입니다.");
		    	}
			}
		} else {
			alert("이메일을 입력해주세요.");
		}
		
		/* 비밀번호 유효성 */
		var pwd = document.getElementById("password").value;
		var pwdcheck = document.getElementById("passwordCheck").value;
		if(pwd!='' && pwdcheck!='') {
			if(pwd != pwdcheck) {
				alert("비밀번호가 일치하지 않습니다.");
			} else {
				num++;
			}
		} else {
			alert("비밀번호를 입력해주세요.");
		}
		
		/* 전화번호 유효성 */
		var phone = document.getElementById("phone").value;
		var regExp2 = /010-\d{4}-\d{4}/;
		
		if(phone!='') {
			if(!regExp2.test(phone)) {
		    	alert("전화번호 형식으로 입력해주세요. (ex.010-xxxx-xxxx)");
			} else {
				num++;
			}
		} else {
			alert("전화번호를 입력해주세요.");
		}
			
		if(num != 3) {
			return false
		} else {
			alert("회원가입이 완료되었습니다.");
			return true;
		}
	}
	
	
	/* 비밀번호 유효성 */
	function isSame() {
		var pwd = document.getElementById("password").value;
		var pwdcheck = document.getElementById("passwordCheck").value;
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

</script>
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