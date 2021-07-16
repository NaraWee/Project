<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>봉그다 숙박숙박 :: 숙소 관리</title>
<link href="${pageContext.servletContext.contextPath }/resources/owner/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/jquery.min.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/owner/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/scripts.js"></script>
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/event.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/owner/css/styles.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath }/resources/owner/css/style.css" rel="stylesheet" type="text/css" media="all" />   
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/responsiveslides.min.js"></script>
<link rel="shortcut icon" href="../favicon.ico"> 
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/resources/owner/css/default.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/resources/owner/css/component.css" />
<script src="${pageContext.servletContext.contextPath }/resources/owner/js/modernizr.custom.js"></script>
<style>
   .roomCondition{
      text-align: center;
      margin-top: 100px;
      font-weight: bold;
      font-size: 13px;
   }
   
   .liMaginLefe {
    	margin-left: 30px;
    	color: black;
	}
	
	.roomName {
	   font-size: 20px;
 	   margin-left: 15px;
 	   margin-top: 25px;
	}
    
    .roomForm {
    	color: black;
    	margin-left: 15px;
    }
    h1, h2, h3, h4, h5, h6, label, p {
   	 	margin: -3px;
	}
	.roomModifyBtn {
	    font-size: 15px;
	    box-shadow: 0 3px 0 #c35a56;
	}
	.list-btn{
		background:white;
		border:0;
		outline:0;
		color:#777;
		margin-left: 10px;
	}
	.list-btn:hover{
		color:#6eceda;
	}
	th {
    	background-color: #f5f5f5;   		
    	color: black;
	}
	.roomModifyBtn:hover{
	    font-size: 15px;
	    box-shadow: 0 3px 0 #c35a56;
	}
	.table-bordered {
    	border: 0px solid #ddd;
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
				<li><a href="/bonggeuda/owner/mypage">마이페이지</a></li>
				<li><a href="/bonggeuda/"><i class="glyphicon glyphicon-user"></i>Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!--header-->
<div class=" banner-manage">
   <div class=" container">
      <h3>숙소 관리</h3> 
   <div class="clearfix"> </div>
      <!--initiate accordion-->
      <script type="text/javascript">
         $(function() {
             var menu_ul = $('.menu > li > ul'),
                    menu_a  = $('.menu > li > a');
             menu_ul.hide();
             menu_a.click(function(e) {
                 e.preventDefault();
                 if(!$(this).hasClass('active')) {
                     menu_a.removeClass('active');
                     menu_ul.filter(':visible').slideUp('normal');
                     $(this).addClass('active').next().stop(true,true).slideDown('normal');
                 } else {
                     $(this).removeClass('active');
                     $(this).next().stop(true,true).slideUp('normal');
                 }
             });
         
         });
      </script>
   </div>
</div>
<br><br>
<div class="tab" style="width: 60%;">
	<span class="tab_btn active">승인된 숙소</span>
</div>
<table class="table-bordered table" id="registTb" style="width: 60%;" >
   <thead>
      <th>대표사진</th>
      <th>숙소정보</th>
      <th>평점 & 리뷰</th>
      <th>관리</th>
   </thead>
   <tbody>
      <c:forEach var="accomoList" items="${ requestScope.approveAccomoList }">
      <tr class="room1">
         <th style="background-color: white;">
            <img src="${pageContext.servletContext.contextPath }/${ accomoList.imagePath }" style="width: 360px; height: 230px;">
         </th>
         <td class="roomList">
            <p class="roomName"><c:out value="${ accomoList.accomoName }"/></p>
            <p class="roomForm"><c:out value="${ accomoList.accomoType }"/></p>
            <br>
            <div>
            <form action="/bonggeuda/owner/accomoModify" method="post">
               <button  class="list-btn" type="submit">
               <input type="hidden" name="accomoNo" value="<c:out value="${ accomoList.accomoNo }"/>">
                숙소 수정
            </form>
            <form action="/bonggeuda/owner/roomList" method="post">
               <button  class="list-btn" type="submit">
               <input type="hidden" name="roomcAcomoNo" value="<c:out value="${ accomoList.accomoNo }"/>">
                객실 목록 보기
            </form>
            </div>
         </td>
         <td>
         	<br><br>
            <form action="${ pageContext.servletContext.contextPath }/owner/accomoReview"  method="post">
            <input type="hidden" name="accomoNo" value="<c:out value="${ accomoList.accomoNo }"/>">
            <button class="list-btn">▷ 리뷰 보러가기</button>
            </form>
            
            <form action="${ pageContext.servletContext.contextPath }/owner/sales"  method="post">
            <input type="hidden" name="accomoNo" value="<c:out value="${ accomoList.accomoNo }"/>">
            <input type="hidden" name="accomoName" value="<c:out value="${ accomoList.accomoName }"/>">
            <button class="list-btn" type="submit" >▷ 매출내역 보러가기</button>
            </form>
         </td>
         <td class="roomCondition"  style="color: black; font-size: 16px; ">
         <br>
 			<p>
        	 관리자 승인 완료
 			</p>
 			<br>
 			<form action="${ pageContext.servletContext.contextPath }/owner/AccomoRemove" id="pwdform" method="post" onsubmit="return roomRemove()">
            	<input type="hidden" name="acomoNo" value="<c:out value="${ accomoList.accomoNo }"/>">
            	<button class="roomModifyBtn" type="submit" style="background-color: orangered;">숙소 삭제</button>
       		</form>
         </td>
      </tr>
   </c:forEach>
   </tbody>
</table>

<br><br><br><br>

<div class="tab" style="width: 60%;">
	<span class="tab_btn active">승인 대기 숙소</span>
</div>
<table class="table-bordered table" id="registTb" style="width: 60%;" >
   <thead>
      <th>대표사진</th>
      <th>숙소정보</th>
      <th>평점 & 리뷰</th>
      <th>관리</th>
   </thead>
   <tbody>
      <c:forEach var="accomoList" items="${ requestScope.applyEnrollAccomoList }">
      <tr class="room1">
         <th style="background-color: white;">
            <img src="${pageContext.servletContext.contextPath }/${ accomoList.thumbNailPath }" style="width: 360px; height: 230px;">
         </th>
         <td class="roomList">
        	<br>
            <p class="roomName"><c:out value="${ accomoList.accomoName }"/></p>
            <p class="roomForm"><c:out value="${ accomoList.accomoType }"/></p>
            <br>
         </td>
         <td align="center">
         <br><br>
         	승인 대기중
         </td>
         <td class="roomCondition"  style="color: black; font-size: 16px; ">
        	<br>
            <br>
         	<form action="${ pageContext.servletContext.contextPath }/owner/StayAccomoRemove" id="pwdform" method="post" onsubmit="return roomRemove()">
          	  	<input type="hidden" name="acomoNo" value="<c:out value="${ accomoList.accomoNo }"/>">
          		<button class="roomModifyBtn" type="submit" style="background-color: orangered;">숙소 삭제</button>
         	</form>
         </td>
      </tr>
   </c:forEach>
   </tbody>
</table>

<br><br><br><br>

<div class="tab" style="width: 60%;">
	<span class="tab_btn active">거절된 숙소</span>
</div>
<table class="table-bordered table" id="registTb" style="width: 60%;" >
   <thead>
      <th>대표사진</th>
      <th>숙소정보</th>
      <th>승인 거절</th>
      <th>관리</th>
   </thead>
   <tbody>
      <c:forEach var="accomoList" items="${ requestScope.rejectAccomoList }">
      <tr class="room1">
         <th style="background-color: white;">
            <img src="${pageContext.servletContext.contextPath }/${ accomoList.thumbNailPath }" style="width: 360px; height: 230px;">
         </th>
         <td class="roomList">
         <br>
            <p class="roomName"><c:out value="${ accomoList.accomoName }"/></p>
            <p class="roomForm"><c:out value="${ accomoList.accomoType }"/></p>
         <br>
         </td>
         <td style="text-align: center;">
            <br><br>
            <p style="color: red; font-size: 16px"><b>숙소 등록 거절</b></p>
            <button type="submit" class="list-btn" onclick="location.href='#pop01'">거절 사유 보기</button>
            <div id="pop01" class="overlay">
				<div class="popup">
					<a href="#none" class="close">&times;</a>
						<p style="font-size: 20px; color: red; padding-bottom: 10px;">숙소 승인 거절</p>
							<div class="cont-step cont-step_02" id="contStep02" style="display: block;">
							<div class="cont-step_preface">
								<h4 class="h4">거절 사유</h4>
							</div>
							<br>
							<!-- 탈퇴이유 -->
							<div class="reason-innder-box reason-innder-box6"  style="margin-bottom: 10px;">
								<textarea class="rejectrReasonTextarea" placeholder="고객님께 전달드릴 예약 거절 사유를 적어주세요. 수정 불가능 하오니 신중히 적어주세요." name="rejectReson" style="height: 120px; margin-left: -5px; font-size: 22px" disabled="disabled" >${ accomoList.insPectionComment }</textarea>
							</div>
						</form>
					</div>
				</div>
			</div>
         </td>
         <td class="roomCondition"  style="color: black; font-size: 16px; ">
            <br><br>
            <form action="${ pageContext.servletContext.contextPath }/owner/RejectAccomoRemove" id="pwdform" method="post" onsubmit="return roomRemove()">
            	<input type="hidden" name="acomoNo" value="<c:out value="${ accomoList.accomoNo }"/>">
            	<button class="roomModifyBtn" type="submit" style="background-color: orangered;">숙소 삭제</button>
            </form>
            <br><br>
         </td>
      </tr>
   </c:forEach>
   </tbody>
</table>

<script>
   function roomRemove(){
   var result = confirm("정말 삭제 하시겠습니까?");
   
       if(result){
  		 var realResult = confirm("확인을 누르시면 모든 숙소 정보가 삭제 됩니다. 그래도 삭제 하시겠습니까?");
  		 
  		 	if(realResult){
  		 		
          		alert("숙소를 삭제합니다.")
          		return true;
  		 	}else{
        		alert("취소하셨습니다.")
        		return false;
  		 	}
       }else{
          alert("취소하셨습니다.")
          return false;
       }
   }
/*    function roomDisable(){

   var result = confirm("비공개 하시겠습니까?");

   if(result){
      
      $(".room1").css({"background-color":"lightgray"});

      $(".roomModifyBtnPublic").css({"background-color":"lightgreen"});
      $(".roomModifyBtnPrivate").css({"background-color":"rgba(0,0,0,0.1)"});

      $(".roomModifyBtnPrivate").attr("disabled",true);
      $(".roomModifyBtnPublic").attr("disabled",false);

      alert("숙소 비공개 되었습니다.")
   }else{
      alert("취소하셨습니다.")
   }
}

function roomAble(){
   var result = confirm("공개 하시겠습니까?");
if(result){
   $(".room1").css({"background-color":"white"});

   $(".roomModifyBtnPublic").css({"background-color":"rgba(0,0,0,0.1)"});
   $(".roomModifyBtnPrivate").css({"background-color":"lightgreen"});

   $(".roomModifyBtnPrivate").attr("disabled",false);
   $(".roomModifyBtnPublic").attr("disabled",true);

   alert("숙소 공개 되었습니다.")
}else{
   alert("취소하셨습니다.")
}
} */
</script>
</div>
</div>
<br><br><br><br><br><br>
<br><br><br><br><br><br>
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