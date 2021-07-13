<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<title>봉그다 숙박숙박 :: 마이 페이지</title>
<link href="${pageContext.servletContext.contextPath }/resources/owner/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/jquery.min.js"></script>
<link href="resources/owner/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="resources/owner/js/jquery.min.js"></script>

<script src="${pageContext.servletContext.contextPath }/resources/owner/js/scripts.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/event.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/owner/css/styles.css" rel="stylesheet">

<link href="${pageContext.servletContext.contextPath }/resources/owner/css/style.css" rel="stylesheet" type="text/css" media="all" />	

<script src="${pageContext.servletContext.contextPath }/resources/owner/js/responsiveslides.min.js"></script>


	<link rel="shortcut icon" href="../favicon.ico"> 
	<link rel="stylesheet" type="text/css" href="resources/owner/css/default.css" />
	<link rel="stylesheet" type="text/css" href="resources/owner/css/component.css" />
	<script src="resources/owner/js/modernizr.custom.js"></script>
<style>
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

.h4{
	text-align: center;
	font-size: 2em;
}

</style>
</head>
<body>
<!--header-->
<div class="header">
	<div class="container">
		<!--logo-->
			<div class="logo">
				<h1><a href="/bonggeuda/owner/main">Bonggeuda</a></h1>
			</div>
		<!--//logo-->
		<div class="top-nav">
			<ul class="right-icons">
				<li><a href="/bonggeuda/owner/registration">숙소등록</a></li>
				<li><a href="/bonggeuda/owner/managementRoom">숙소관리</a></li>
				<li><a href="/bonggeuda/owner/bookingList">예약관리</a></li>
				<li><a href="/bonggeuda/owner/notice">공지사항</a></li>
				<li><a  href="/bonggeuda/owner/mypage">마이페이지</a></li>
				<li><a href="/bonggeuda/"><i class="glyphicon glyphicon-user"></i>Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!--header-->
<div class=" banner-mypage"> <!--상단 메뉴바-->
	<div class=" container">
		<h3>마이페이지</h3> 
	</div>
</div>
<!--//header-->
<br><br>
<div class="blog">
	<div class="container">
		<div class="blog-list">
			<nav>
			<div class="col-md-3 blog-sidebar">
			<ul>
				<li class="blog-list" style="font-size: 1.3em; font-weight: 600;"><a href="/bonggeuda/owner/mypage"style="color: #6eceda;" >마이 페이지</a></li>
				<li class="blog-list" ><a href="/bonggeuda/owner/mypgeReport" >신고 내역</a></li>
				<li class="blog-list" style=><a href="/bonggeuda/owner/settlement" >정산 신청</a></li>
				<li class="blog-list" style=><a href="/bonggeuda/owner/taxbillList" >세금 계산서 발행</a></li>
			</ul>
			</nav>
			<table id="registTb" class="table table-bordered" style="margin-top: -50px; margin: initial;">
			<tbody>
				<tr class="tr1">
					<th>
						<p class="thName">
							이메일 (아이디)
						</p>
					</th>
					<td>
						<div class="form-layer">
							<input type="text" class="select-nomalsize" name="ownerEmail" disabled style="background-color: lightgrey;" value="${ requestScope.selectOwner.ownerID }">
						</div>
						
					</td>
				</tr>
				<tr>
					<th>
					<form action="${ pageContext.servletContext.contextPath }/owner/passwordChange" method="post" onsubmit="return modifypwd()">
						<p class="thName">
							비밀번호 변경 
						</p>
						<td>
							<div class="form-layer" >
								<input  class="select-nomalsize"  id="pwd" onchange="isSame()" type="password" name="ownerPwd" value="">
							
							</div>
	
						</td>
						
					</th>
				</tr>
				<tr>
					<th>
						<p class="thName">
							비밀번호 확인
						</p>
						<td>
							<div class="form-layer" >
								<input id="pwdcheck" onchange="isSame()"  class="select-nomalsize" type="password" name="ownerPwdChange" >
								<button class="submit-btn" type="submit" style="margin-left: 20px;">변경하기</button>&nbsp;&nbsp;<span id="same"></span>
							</div>
						</td>
	
					</th>
					</form>
				</tr>
				<tr class="tr1">
					<th>
						<p class="thName">
							휴대전화 번호
						</p>
					</th>
					<td>
						<div class="form-layer">
							<input type="text" class="select-nomalsize" name="ownerPhone" placeholder="휴대전화 번호" value="${ requestScope.selectOwner.ownerPhone }" disabled="disabled" style="background: lightgray">
						</div>
						
					</td>
				</tr>
				<tr class="tr1">
					<th>
					
						<p class="thName">
							휴대전화 번호<br> 변경
						</p>
					</th>
					<td>
				<p style="color: gray; font-size: 13px">	* 전화번호 형식으로 입력해주세요. (ex.010-xxxx-xxxx)</p>
						<div class="form-layer">
					<form action="${ pageContext.servletContext.contextPath }/owner/phoneNoChange" method="post" onsubmit="return modifyphonenumber()">
						
							<input type="text" class="select-nomalsize" name="ownerPhonechange" placeholder="변경할 휴대전화 번호를 입력해주세요" id="userPhone">
							<button class="submit-btn" type="submit" style="margin-left: 20px;">변경하기</button>
					</form>
						</div>
					
						
					</td>
				</tr>
				
				<tr class="tr1">
					<th>
						<p class="thName">
							신고 누적 횟수
						</p>
					</th>
					<td>
					<p style="color: gray; font-size: 13px">* 신고 누적횟수에 따라 불이익을 받을 수 있습니다.</p>
						<div class="form-layer">
							<input type="text" class="select-nomalsize" value="${ requestScope.reportedCount }" name="account_holder" value="15" disabled style="background-color: lightgrey; font-size: large; width: 70px; font-weight: bold; text-align: center; color: #e03633e8;">
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<form action="" >
			<button class="submit-btn" type="submit" style="margin-bottom: 10px; background-color: #ccc; box-shadow: 0 3px 0 #a3a3a3; margin-left:800px; margin-top: 15px;" onclick="location.href='#pop01'">
				회원 탈퇴
			</button>
		</form>
</div>
<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(daumPostCode) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script> -->

				<!-- 회원탈퇴 팝업창 -->
				<div id="pop01" class="overlay">
					<div class="popup">
						<a href="#none" class="close">&times;</a>
							<p style="font-size: 20px; color: red; padding-bottom: 10px;">회원탈퇴</p>

							<div class="cont-step cont-step_02" id="contStep02" style="display: block;">
								<div class="cont-step_preface">
									<h4 class="h4">왜 떠나시는지 이유가 있을까요? </h4>
								</div>
								<br>
								<!-- 탈퇴이유 -->
								<form action="/bonggeuda/owner/ownerWithdraw" method="post">
								<ul class="reason-list" style="text-align: left;">
									<li>
										<input id="reasonRdo0" type="radio" name="radios" value="UN_USE_FREQUENTLY">
										<label for="reasonRdo0">사용을 잘 안하게 돼요</label>
									</li>
									<li>
										<input id="reasonRdo1" type="radio" name="radios" value="HAVE_NO_LIKED_HOTEL">
										<label for="reasonRdo1">숙소가 망했어요</label>
									</li>
									<li>
										<input id="reasonRdo2" type="radio" name="radios" value="DIFFICULT_TO_USE">
										<label for="reasonRdo2">예약, 취소, 혜택받기 등 사용이 어려워요</label>
									</li>
									<li>
										<input id="reasonRdo4" type="radio" name="radios" value="INFO_TO_DELETE">
										<label for="reasonRdo4">개인정보 보호를 위해 삭제할 정보가 있어요</label>
									</li>
									<li>
										<input id="reasonRdo5" type="radio" name="radios" value="EXISTING_ID">
										<label for="reasonRdo5">다른 계정이 있어요</label>
									</li>
									<li>
										<input id="reasonRdo6" type="radio" name="radios1" value="" checked>
										<label for="reasonRdo6">기타</label>
										<div class="reason-innder-box reason-innder-box6"  style="margin-bottom: 10px;">
											<input name="reason" style="width:100%;float: left;" placeholder="탈퇴 사유를 적어주세요">
										</div>
									</li>
									</ul>
									<br>
								<div class="password-wrap">
									<div class="button-wrap" style="text-align: center;">
									
										<button class="submit-btn"  style="background-color: orange;" type="submit">
										<input type="hidden" name="ownerNo" value="${ requestScope.selectOwner.ownerNo }">
										탈퇴하기
										</button>
									</div>
								</div>
								</form>
							</div>
							<script>
							$(document).ready(function(){
 
								// 라디오버튼 클릭시 이벤트 발생
								$("input:radio[name=radios]").click(function(){
							 
									if($("input[name=radios]:checked").val() == "OTHER"){
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

<script>
	function daumPostCode(){
		alert("주소를 찾아봅시다~");

	}
	
</script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            
        }
    }).open();
</script>
<script type="text/javascript">
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

</script>
</div>
</div>
</body>
<!--footer-->
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