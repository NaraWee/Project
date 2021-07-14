<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            td > input {
            	height: 40px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
            }
            tr, td {
            	font-size: 17px;
				height: 55px;
				text-align: left;
			}
            td > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
            }
            div > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid;
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                margin-left: 20px;
            }
            
            td > input::placeholder {
                font-size: 15px;
                color:#a1a1a1;
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
				height: 150% !important;
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
				-webkit-transition: opacity .5s, visibility 0s linear .5s;
				transition: opacity .5s, visibility 0s linear .5s;
				z-index: 1;
			}
			.popup:target {
				visibility: visible;
				opacity: 1;
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
			}
			.popup .close:hover {
				color: #007a5c;
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
        <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">
<script>

	window.onload = function() {
		console.log("window onload!");
		
		//수정시 메세지 띄우기
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


            <jsp:include page="../common/userHeader.jsp"/>

            <section id="account" class="account" style="width: 70%; margin: 0px auto;  margin-bottom: 40px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600;">
                	계정 관리
            	<img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/'" style="width:50px; float: right;">
                </div>
            </section>

            <section id="account" class="account" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="font-size: 20px; font-weight: 600; float: left; margin-left: 10px;">정보 수정</div>
                <div style="float: right; margin-right: 10px;"><button onclick="location.href='#withdrawUser'">회원탈퇴</button></div>
                <br>
                <hr style="border-color: rgb(175, 175, 175);">
            </section>

            <section id="accountmanagement" class="accountmanagement">
                <div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 35px; margin-bottom: 80px;">
                <form action="${ pageContext.servletContext.contextPath }/user/mypage/updateUserInfo" method="post" id="updateUserInfo" name="form" onsubmit="return validate();">
					<table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px;">
						<tr>
							<td>아이디</td>
							<td><input type="text" id="id" name="id" value="${ sessionScope.loginUser.id }" readonly></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" value="${ sessionScope.loginUser.name }" readonly></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><input type="text" name="nikname"  value="${ sessionScope.loginUser.nikname }" readonly></td>
	                        <td>
	                        <input type="hidden" id="nameCheck" name="nameCheck" value="fail">
	                        <button onclick="location.href='#nickNameChk'" type="button">중복확인</button>
	                        </td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd"  id="userPwd" placeholder="비밀번호를 입력하세요"></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" id="userPwdCheck" placeholder="비밀번호 확인을 위해 재입력해주세요"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="phone" value="${ sessionScope.loginUser.phone }" id="phone" placeholder="변경할 전화번호 입력하세요"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" value="${ sessionScope.loginUser.email }" readonly></td>
	                        <td>
	                        <input type="hidden" id="emailCheck" name="emailCheck" value="fail">
	                        <button onclick="location.href='#emailChk'" type="button">중복확인</button>
	                        </td>
						</tr>
	                    <tr>
	                    	<td>뉴스레터 이메일 수신 동의</td>
	                    	<td>
	                    	<label name="emailYn" style="font-size: 15px; font-weight: normal; padding-right: 30px;">
	                    	<c:if test="${sessionScope.loginUser.emailYn eq 'Y'}">
		                    	<input type="radio" id="emailYn" name="emailYn" style="width: 15px;" value="Y" checked> 동의
	                    	</c:if>
	                   		<c:if test="${sessionScope.loginUser.emailYn eq 'N'}">
	                    	<input type="radio" id="emailYn" name="emailYn" style="width: 15px;" value="Y"> 동의
	                   		</c:if>	
	                    	</label>
	                    	
	                    	<label name="emailYn" style="font-size: 15px; font-weight: normal; padding-right: 30px;">
	                    	<c:if test="${sessionScope.loginUser.emailYn eq 'N'}">
	                    	<input type="radio" id="emailYn" name="emailYn" style="width: 15px;" value="N" checked> 거절
	                    	</c:if>
	                    	<c:if test="${sessionScope.loginUser.emailYn eq 'Y'}">
	                    	<input type="radio" id="emailYn" name="emailYn" style="width: 15px;" value="N"> 거절
	                    	</c:if>
	                    	</label> 
	                    	</td>
	                    	</tr>	
	                    	<tr>
	                    	<td>댓글알림 이메일 수신 동의</td>
	                    	<td>
	                    	<label name="replyYn" style="font-size: 15px; font-weight: normal; padding-right: 30px;">
	                    	<c:if test="${sessionScope.loginUser.replyYn eq 'Y'}">
		                    	<input type="radio" id="replyYn" name="replyYn" style="width: 15px;" value="Y" checked> 동의
	                    	</c:if>
	                   		<c:if test="${sessionScope.loginUser.replyYn eq 'N'}">
	                    	<input type="radio" id="replyYn" name="replyYn" style="width: 15px;" value="Y"> 동의
	                   		</c:if>	
	                    	</label>
	                    	
	                    	<label name="replyYn" style="font-size: 15px; font-weight: normal; padding-right: 30px;">
	                    	<c:if test="${sessionScope.loginUser.replyYn eq 'N'}">
	                    	<input type="radio" id=replyYn name="replyYn" style="width: 15px;" value="N" checked> 거절
	                    	</c:if>
	                    	<c:if test="${sessionScope.loginUser.replyYn eq 'Y'}">
	                    	<input type="radio" id="replyYn" name="replyYn" style="width: 15px;" value="N"> 거절
	                    	</c:if>
	                    	</label> 
	                    	</td>
	                    </tr>	
					</table>
                    <div style="margin: 0px auto; margin-bottom: 2%; text-align: center;">
                    <input type="submit" id=btnSubmit 
                    style="background-color: #45B99C; 
			               height: 35px;
			               color: white;
			               border-color: #45B99C; 
			               border: 1px solid;
			               font-size: 16px; 
			               font-weight: 500;
			               border-radius: 10px;
			               margin-left: 20px;"
                    value="수정하기">
                    </div>
					</form>
				</div>
            </section>
            
            <!-- 회원탈퇴 팝업창 -->
				<div id="withdrawUser" class="overlay">
					<div class="popup">
						<a href="" class="close">&times;</a>
						<p style="font-size: 20px; text-align: center; padding-bottom: 10px;">회원탈퇴</p>
						<div class="cont-step cont-step_02" id="contStep02" style="display: block;">
							<div class="cont-step_preface">
								<h3 align="center">정말 탈퇴하시겠습니까?</h3>
							</div>
							<!-- 비밀번호 입력 -->
							<form action="${ pageContext.servletContext.contextPath }/user/mypage/withdrawUser" method="post" id="withdrawUserForm" name="form">
							<div style="text-align: center; margin-top: 30px; display: block;" align="center">
								<input type="text" name="id" value="${ sessionScope.loginUser.id }" style="display: none;">
								<input type="text" name="code" value="${ sessionScope.loginUser.code }" style="display: none;">
								<input type="password" placeholder="비밀번호를 입력해주세요" name="pwd"
									style="height: 40px; width: 70%; border-radius: 10px; border: 1px solid;"><br><br>
								<button type="submit" id="withdrawUserbutton">탈퇴하기</button>
							</div>
							</form>
							</div>

						</div>
					</div>
				</div>
<!-- 닉네임 중복 팝업창 -->
	<div id="nickNameChk" class="overlay">
		<div class="popup">
		<a href="" class="close">&times;</a>
			<p
				style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px;">닉네임 변경하기 </p>
			<div class="cont-step cont-step_02" id="contStep02"
				style="display: block;">
				<div class="cont-step_preface">
					<hr style="border: 0.5px solid #A8A8A8;">
				</div>
				<!-- 닉네임 입력 -->
				<form action="${ pageContext.servletContext.contextPath }/user/mypage/updateNick" method="post" id="updateNick" name="form">
				<div style="text-align: center; margin-top: 30px; display: block;" align="center">
					<input type="text" name="id" value="${ sessionScope.loginUser.id }" style="display: none;">
					<input type="text" placeholder="닉네임을 입력하세요" name="nikname" id="nickname"
						style="height: 40px; width: 70%; border-radius: 10px; border: 1px solid;">
					<button type="button" onclick="return duplicationNickCheck()">중복확인</button>
					<button type="submit" style="display: none; float: right; margin-right: 21px;" id="updateNickbutton">변경하기</button>
					<p style="color: red; display: none; margin-top: 10px;" id="hiddenMessage"/>
				</div>
				</form>
				</div>
			</div>
		</div>
<!-- 닉네임 중복 테스트 -->
<script type="text/javascript">
function duplicationNickCheck(){
	
	var nameCheck = document.getElementById("nickname");
	var nikname = $('#nickname').val();
	
	console.log(nickname);
	
	//공백체크
	if(nikname == ''){
		alert('변경 할 닉네임을 입력해주세요.');
		$("#hiddenMessage").css("display", "none");
		nameCheck.value = "";
		nameCheck.focus();
		return false;
	}
	
	//유효성체크
	var nickRegExp = /^[a-zA-z0-9가-힣]{2,12}$/; //2~12자의 영문 대소문자와 숫자
	
	if (!nickRegExp.test(nikname)) {
    	
        alert("닉네임에는 특수문자를 포함할 수 없습니다.\n한글, 영어 대소문자, 숫자를 사용한 2~12자리로 입력해야합니다!");
        $("#hiddenMessage").css("display", "none");
        nameCheck.value = "";
        nameCheck.focus();
        
        if(($("#updateNickbutton").css("display") == "block")){
			$("#updateNickbutton").css("display", "none");
		}
        
        return false;
    } else {
    	//중복체크
    	$.ajax({
			url:"${pageContext.servletContext.contextPath}/user/mypage/updateNickChk",
			type:"post",
			data:{nikname:nikname},
			success:function(data){
				
				console.log(data);
				
				status = $("#hiddenMessage").css("display");
				console.log(status);
				
				if (data == "fail"){

					if(status == "none"){
						$("#hiddenMessage").css("display", "");
					}
					if(($("#updateNickbutton").css("display") == "block")){
						$("#updateNickbutton").css("display", "none");
					}
					
					$("#hiddenMessage").html("사용할 수 없는 닉네임입니다.");
					nameCheck.value = "";
					nameCheck.focus();
					return;

				} else if(data == "success") {
					
					if(status == "none"){
						$("#hiddenMessage").css("display", "");
					}
					
					if(($("#updateNickbutton").css("display") == "none")){
						$("#updateNickbutton").css("display", "block");
					}
					
					
				    $("#hiddenMessage").html("사용 가능합니다.");
				    console.log(nameCheck);
				    console.log(status);
				    console.log(status2);
				   
				    return;
				}
			}, error:function(data){
				console.log(data);
			}
		});
		return false;
    }
	
}
</script>

<!-- 이메일 중복 팝업창 -->
	<div id="emailChk" class="overlay">
		<div class="popup">
		<a href="" class="close">&times;</a>
			<p
				style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px;">이메일 변경하기</p>
			<div class="cont-step cont-step_02" id="contStep02"
				style="display: block;">
				<div class="cont-step_preface">
					<hr style="border: 0.5px solid #A8A8A8;">
				</div>
				<!-- 이메일 입력 -->
				<form action="${ pageContext.servletContext.contextPath }/user/mypage/updateEmail" method="post" name="form">
				<div style="text-align: center; margin-top: 30px; display: block;" align="center">
					<input type="text" name="id" value="${ sessionScope.loginUser.id }" style="display: none;">
					<input type="text" placeholder="이메일을 입력하세요" name="email" id="email"
						style="height: 40px; width: 70%; border-radius: 10px; border: 1px solid;">
					<button type="button" onclick="return duplicationEmailCheck()">중복확인</button>
					<button type="submit" style="display: none; float: right; margin-right: 21px;" id="updateEmail">변경하기</button>
					<p style="color: red; display: none; margin-top: 10px;" id="hiddenEmailMessage"/>
				</div>
				</form>
				</div>
			</div>
		</div>
<!-- 이메일 중복 테스트 -->
<script type="text/javascript">
function duplicationEmailCheck(){
	
	var emailCheck = document.getElementById("email");
	var email = $('#email').val();
	
	console.log(email);
	
	//공백체크
	if(email == ''){
		$("#hiddenEmailMessage").css("display", "none");
		alert('이메일을 입력해주세요.');
		return false;
	}
	
	//유효성체크
	var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
	
	if (!emailRegExp.test(email)) {
    	
        alert("올바른 이메일 형식이 아닙니다!\n예시) petpal@gmail.com");
        $("#hiddenEmailMessage").css("display", "none");
        emailCheck.value = "";
        emailCheck.focus();
        return false;
    } else {
    	//중복체크
    	$.ajax({
			url:"${pageContext.servletContext.contextPath}/user/mypage/updateEmailChk",
			type:"post",
			data:{email:email},
			success:function(data){
				
				console.log(data);
				
				status = $("#hiddenEmailMessage").css("display");
				console.log(status);
				
				if (data == "fail"){

					if(status == "none"){
						$("#hiddenEmailMessage").css("display", "");
					}
					
					if(($("#updateEmail").css("display") == "block")){
						$("#updateEmail").css("display", "none");
					}
					
					$("#hiddenEmailMessage").html("사용할 수 없는 이메일입니다.");
					emailCheck.value = "";
					emailCheck.focus();
					return;

				} else if(data == "success") {
					
					if(status == "none"){
						$("#hiddenEmailMessage").css("display", "block");
					}
					
					if(($("#updateEmail").css("display") == "none")){
						$("#updateEmail").css("display", "block");
					}
					
				    $("#hiddenEmailMessage").html("사용 가능합니다.");
				    $("#emailCheck").attr("value","success");
				   
				    return;
				}
			}, error:function(data){
				console.log(data);
			}
		});
		return false;
    }
}
</script>

<!-- 중복체크 없는 값들 유효성 검사 스크립트 -->
<script>

	function validate(){
		
		console.log("유효성 검사 들어왔습니다");
		
	   /* userPwd 유효성 검사 */	
	  	var password1RegExp = /^[a-zA-z0-9]{4,12}$/;
	  	var pwd = $('#userPwd').val();
	  	var pwdCheck = $('#userPwdCheck').val();
	  	var id = $('#id').val();
	  	
	  	console.log(pwd);
	  	
	  	if(pwd == null || pwdCheck == null || pwd == ""   || pwdCheck == "") {
	  		alert("정보 수정을 위해 현재 비밀번호를 입력해주세요.\n새롭게 변경하셔도 됩니다.");
	        return false;
	      } 


		 //비밀번호가 영대소문자 4~12가 아닐때
		if (!password1RegExp.test(pwd)) {
		      alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
		      console.log("userPwd 유효성체크");
		      userPwd.focus();
		      userPwd.value = "";
		      return false;
		  }
			
		//비밀번호가 비밀번호확인과 일치하지 않을때
		if (pwd != pwdCheck) {
		    alert("비밀번호가 일치하지 않습니다!");
		    userPwdCheck.focus();
		    userPwdCheck.value = "";
		    return false;
		}
			
		//아이디와 비밀번호가 같을 때..
	      if (id == pwd) {
	          alert("아이디와 비밀번호가 일치합니다. 아이디와 비밀번호는 같을 수 없습니다!");
	          userPwd.value = "";
	          userPwdCheck.value = "";
	          userPwd.focus();
	          return false;
	      }
		
	  	/* phone 유효성 검사 */
	  	var phoneRegExp = /^01[016789]-[0-9]{3,4}-[0-9]{4}$/;
	  	var phone = $('#phone').val();
	  	
	  	if(!phoneRegExp.test(phone)){
	  		alert("전화번호가 올바르지 않습니다.\n전화번호는 01?-[4자리 숫자]-[4자리 숫자] 형식으로 작성하셔야 합니다.\n 예시) 010-[4자리숫자]-[4자리숫자]")
	  		return false;
	  	}
	}
</script>
            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

			<!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
</html>











