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
                width: 60%; 
                height: 50px; 
                font-size: 16px; 
                font-weight: 600;
                border-radius: 30px;
                margin-bottom: 15px;
                margin-left: 20%;
            }
            li > button:hover {
                background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid; 
            }

            li > img {
                width: 50%;
                height: 50%;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: 15px;
                margin-right: 15px;
                text-align: center;
            }
            .loginForm > input {
                width: 60%;
                height: 50px;
                border-radius: 30px;
                margin-bottom: 20px;
                border: 1px solid rgb(175, 175, 175);
                margin-left: 20%; 
            }
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
                width : 150px;
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid;
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                margin-left: 0px;
            }
            td > input::placeholder {
                font-size: 15px;
                color:#a1a1a1;
            }
            
        </style>
         <meta charset="utf-8">
        <title>PET-PAL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">
		
		 <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
		
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

        <div class="culmn">
            
            <!-- 헤더  시작 -->
			<jsp:include page="../../admin/common/header.jsp"></jsp:include>
			<!-- 헤더 끝 --> 
			
			 <!-- 바디 시작 -->
             <section>
           		<!-- 큰 컨테이너 시작 -->
                <div class="container" style="padding-bottom:10%">
             			<!-- 제목 -->
                        <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" style="font-weight:800; margin-bottom:12px; font-size:25px; color:black">관리자 정보 등록하기</li>
                             </ul>
                               <a href="${ pageContext.servletContext.contextPath }/admin/adminList"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
                               			style="width:40px;height:42px; margin-right:30px; margin-top:-50px; float:right;"></a>
                        <!-- 작은 컨테이너 시작 -->
                        <div class="container" style="padding-top:15px;">
                        
                        <form action="${ pageContext.servletContext.contextPath }/admin/insertAdmin" id="regist" name="form"  onsubmit="return validate()">
                              <table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px;">
						<tr>
							<td>아이디</td>
							<td><input type="text" id="id" placeholder="영문 대소문자와 숫자 4~12자리" name="id" required></td>
							<td>
							<input type="hidden" id="idCheck" name="idCheck" value="fail">
							<button onclick="return duplicationCheck()" type="button">중복확인</button>
							</td>
						</tr>
						<tr id="hiddenMessage" style="display: none;">
						<td></td>
						<td>
							<p id="checkMessage" style="font-size : 20px; color: red;"/>
						</td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" id="name" placeholder="이름을 입력하세요" required></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd" id="userPwd" placeholder="비밀번호를 입력하세요" required></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="userPwdCheck" id="userPwdCheck" placeholder="비밀번호를 확인해 주세요" required></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" id="phone" name="phone" placeholder="전화번호 입력하세요" required></td>
						</tr>
						<tr>
							<td>권한설정</td>
							<td><ul>
		                                <li>
		                                  	<c:choose>
		                                  		<c:when test="${ sessionScope.loginUser.permisson eq 3}">
		                                  		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="3" style="margin-bottom:2%" >
			                              		<label for="priv">대표관리자</label>
			                              		
			                              		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="2" style="margin-bottom:2%" checked="checked">
			                              		<label for="priv">서브관리자</label>
		                                  		</c:when>
		                                  		
		                                  		<c:otherwise>
		                                  		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="3" style="margin-bottom:2%"  disabled>
			                              		<label for="priv">대표관리자</label>
			                              		
			                              		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="2" style="margin-bottom:2%" checked="checked">
			                              		<label for="priv">서브관리자</label>
		                                  		</c:otherwise>
		                                  	</c:choose>
		                              		
		                              	</li>
		                        </ul>
		                  </td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" id="email" name="email" placeholder="이메일 입력하세요" required></td>
	                        <td>
	                        <input type="hidden" id="emailCheck" name="emailCheck" value="fail">
	                        <button onclick="return duplicationEmailCheck()" type="button">중복확인</button>
	                        </td>
						</tr>
	                    <tr id="hiddenEmailMessage" style="display: none;">
						<td></td>
						<td>
							<p id="checkEmailMessage" style="font-size : 20px; color: red;"/>
						</td>
						</tr>
						</table>
                                
		                      <div style="margin: 0px auto; text-align: center; margin-bottom: 50px; margin-top: 10px;">
	                <p><input type="submit" id="btnSubmit"  value="회원가입"></p>
                </div>      
                               
                        </form>
                        
                     
                        </div><!-- 작은 컨테이너 끝 -->
                </div><!-- 큰 컨테이너 끝 -->
            </section><!-- 바디 끝 -->
			
			<!-- 푸터 시작 -->
            <footer>
       			<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
            </footer>
			<!-- 푸터 끝 -->



        </div>

     </body>
     
     <script>
     function duplicationCheck(){
			
			var idCheck = document.getElementById("id");
			
			var id = $('#id').val();
			console.log(id);
			if(id == ''){
				alert('아이디를 입력해주세요.');
				$("#hiddenMessage").css("display", "none");
				idCheck.value = "";
	            idCheck.focus();
				return;
			}
			
			/* id 유효성 검사 */
			var idRegExp = /^[a-zA-z0-9]{4,12}$/; //4~12자의 영문 대소문자와 숫자
			
	        if (!idRegExp.test(id)) {
	        	
	            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
	            $("#hiddenMessage").css("display", "none");
	            idCheck.value = "";
	            idCheck.focus();
	            return false;
	            
	        } else {
			$.ajax({
				url:"${pageContext.servletContext.contextPath}/user/registIdChk",
				type:"post",
				data:{id:id},
				success:function(data){
					
					console.log(data);
					
					status = $("#hiddenMessage").css("display");
					console.log(status);
					
					if (data == "fail"){

						if(status == "none" ){
							$("#hiddenMessage").css("display", "");
						}
						
						$("#checkMessage").html("사용할 수 없는 아이디입니다.");
						idCheck.value = "";
			            idCheck.focus();
						return;

					} else if(data == "success") {
						
						if(status == "none"){
							$("#hiddenMessage").css("display", "");
						}
						
					    $("#checkMessage").html("사용 가능합니다.");
					    $("#idCheck").attr("value","success");
					    console.log(idCheck);
					   
					    return;
					}
				}, error:function(data){
					console.log(data);
				}
			});
			return false;
	        }

		}	
     
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
			//
			
	        if (!emailRegExp.test(email)) {
	        	
	            alert("올바른 이메일 형식이 아닙니다!\n예시) petpal@gmail.com");
	            $("#hiddenEmailMessage").css("display", "none");
	            emailCheck.value = "";
	            emailCheck.focus();
	            return false;
	        } else {
	        	//중복체크
	        	$.ajax({
					url:"${pageContext.servletContext.contextPath}/user/registEmailChk",
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
							
							$("#checkEmailMessage").html("사용할 수 없는 이메일입니다.");
							emailCheck.value = "";
							emailCheck.focus();
							return;

						} else if(data == "success") {
							
							if(status == "none"){
								$("#hiddenEmailMessage").css("display", "");
							}
							
						    $("#checkEmailMessage").html("사용 가능합니다.");
						    $("#emailCheck").attr("value","success");
						    console.log(emailCheck);
						   
						    return;
						}
					}, error:function(data){
						console.log(data);
					}
				});
				return false;
	        }
			
			
			
		}
     function validate(){
 		
 		/* id 중복체크 확인 */
 		var idCheck = document.getElementById("idCheck");
 		if(idCheck.value != "success"){
 			alert("아이디 중복체크를 완료해주세요.");
 			id.focus();
 			return false;
 		}
 		
 		
 		/* email 중복체크 확인 */
 		var nickCheck = document.getElementById("emailCheck");
 		if(nickCheck.value != "success"){
 			alert("이메일 중복체크를 완료해주세요.");
 			email.focus();
 			return false;
 		}

 	   /* userPwd 유효성 검사 */	
 	  	var password1RegExp = /^[a-zA-z0-9]{4,12}$/;
 	  	var pwd = $('#userPwd').val();
 	  	var pwdCheck = $('#userPwdCheck').val();
 	  	var id = $('#id').val();
 	  	
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
             alert("아이디와 비밀번호가 일치합니다. 아이디 또는 비밀번호를 변경해주세요!");
             userPwd.value = "";
             userPwdCheck.value = "";
             userPwd.focus();
             return false;
         }
 		
 		/* name 유효성 검사 */
         var nameRegExp = /^[가-힣]{2,4}$/;
 	  	var name = $('#name').val();
 		
 	  	if (!nameRegExp.test(name)) {
             alert("이름이 올바르지 않습니다.\n이름은 2글자에서 4글자 형식의 한글이어야 합니다.\n예외적 이름이신 분들은 홈페이지 아래의 전화번호로 연락부탁드립니다.");
             return false;
         }
         
 	  	/* phone 유효성 검사 */
 	  	var phoneRegExp = /^01[016789]-[0-9]{3,4}-[0-9]{4}$/;
 	  	var phone = $('#phone').val();
 	  	
 	  	if(!phoneRegExp.test(phone)){
 	  		alert("전화번호가 올바르지 않습니다.\n전화번호는 01?-[4자리 숫자]-[4자리 숫자] 형식으로 작성하셔야 합니다.\n 예시) 010-[4자리숫자]-[4자리숫자]")
 	  	}
 	}
     </script>
     
</html>