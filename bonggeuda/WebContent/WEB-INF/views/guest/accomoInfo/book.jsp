<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>봉그다숙박숙박</title>
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.servletContext.contextPath }/resources/guest/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${pageContext.servletContext.contextPath }/resources/guest/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/styles.css" rel="stylesheet">
<!--//menu-->

<!-- theme-style -->
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<!-- <link href="css/common.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/product.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.container h3{
	display: block; 
	font-size: 18px; 
	color: rgba(0,0,0,0.87);
}

.list_wrap button{
	width: 180px;
	height: 30px;
	padding: 1px 5px 1px 5px;
}
.detailList{
    width: 1000px; height: 300px; margin-bottom: 15px; padding: 20px 20px 20px 20px;border: 1px solid rgba(0, 0, 0, 0.08);  display: flex;
}

.detailImg{
    width:45%; height:100%;  margin-right: 20px; 
}

.detailInfo{
   width: 53%; display: block;
}
.detail_btn{
	width: 90%;
	height: 30px;
	border: 0;
	outline: 0;
	color: white;
	background-color: #6eceda;
	border-radius: 10px;
	box-shadow: 0 3px 0 #0e8c73;
}
.info_btn{
	width: 100%;
	height: 30px;
	border: 0;
	outline: 0;
	background-color: white;
}

.accomoInfo{
	width:400px; 
	height: 470px; display: block; margin-left: 50px;
}
.accomoInfo h2, h4{
	text-align: left;
}
.accomoInfo h2{
	font-weight: bold;
	font-size: 28px;
}
.accomoInfo h3{
	text-align: left; 
	display: flex; 
	font-size: 23px;
}
.accomoInfo h3>p{
	background: #6eceda; 
	border-radius: 10px; 
	color:white;
	padding: 5px; 
	font-size: 20px; 
	margin-right: 10px;
}
.accomoInfo{
	text-align: left;
}
.ownerComment{
	background-color: rgba(0, 0, 0, 0.08);  
	padding: 20px 20px 20px 20px;
}

.ownerComment p{
	text-align: left;
}
.selectType{
	width:85%; 
	height:30px; 
	display: flex;
}
.selectType>button{
	background: none;
	border-style: none;
	padding: 0 20px 0 20px;
	height: 50px;
}
.selectType>button:hover{
	color: #6eceda;
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
  width: 600px;
  padding: 20px;
  max-width: 600px;
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
  max-width: 600px;
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

.popup strong{
	font-weight: bold;
	font-size : 17px;
	text-align: left;
}

.popup hr{
	background-color: black;
}

.popup li{
	font-size: 13px;
	text-align: left;
}

.popup b{
	color : red
}
.popup p{
	text-align: left;
	margin-bottom: 5px;
}
.check{
	margin-top: 10px;
	font-size: 15px;
	color : rgba(0, 0, 0, 0.6)
}
.check>div{
	width : 50%;
}
.date{
	text-align: right;
	margin-left: 50px;
}

.payAgree{
	background-color: #6eceda;
	color: white;
	border: 2px solid #6eceda;
}
popup>li{
	list-style: square;
}
.accordion {
    font-family:Arial, Helvetica, sans-serif; 
    margin:0 auto;
    font-size:14px;
    border-radius:10px;
    padding:10px;
    background:#fff;
	text-align: left;
}
.accordion ul {
    list-style:none;
    margin:0;
    padding:0;    
}
.accordion li {
    margin:0;
    padding:0;
}
.accordion [type=radio], .accordion [type=checkbox] {
    display:none;
}
.accordion label {
    display:block;
    font-size:16px;
    line-height:16px;
    cursor:pointer;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
	font-weight: normal;
}
.accordion ul li label:hover, .accordion [type=radio]:checked ~ label, .accordion [type=checkbox]:checked ~ label {
    /* background:#C02942; */
    color:#6eceda;
}
.accordion .content {
	margin-top: 5px;
    padding:0 10px;
    overflow:hidden;
	background: rgb(250, 250, 250);
    border:1px solid #fff; /* Make the border match the background so it fades in nicely */
    -webkit-transition: all .5s ease-out;
    -moz-transition: all .5s ease-out;
}

.accordion p {
    color:#333;
    margin:10px 10px 0px 20px;
	text-align: left;
}
.accordion h3 {
    text-align: left;
	font-size: 20px;
    padding:0;
    margin:30px 10px 0 10px;
}


/* Vertical */
.vertical ul li {
    overflow:hidden;
    margin:0 0 1px;
}

.vertical [type=radio]:checked ~ label, .vertical [type=checkbox]:checked ~ label {
    border-bottom:0;
}

.vertical ul li .content {
    height:0px;
    border-top:0;
}
.vertical [type=radio]:checked ~ label ~ .content, .vertical [type=checkbox]:checked ~ label ~ .content {
    min-height:800px;
	
}

.accordion .content2 {
	margin-top: 5px;
    padding:0 10px;
    overflow:hidden;
	background: rgb(250, 250, 250);
    border:1px solid #fff; /* Make the border match the background so it fades in nicely */
    -webkit-transition: all .5s ease-out;
    -moz-transition: all .5s ease-out;
}
.vertical ul li .content2 {
    height:0px;
    border-top:0;
}
.vertical [type=radio]:checked ~ label ~ .content2, .vertical [type=checkbox]:checked ~ label ~ .content2 {
    min-height:50px;
	
}
.reviewWrap li{
    margin-top: 50px;
    /* margin-bottom: 13px; */
}

.reviewWrap div{
    text-align: left;
    margin-bottom: 13px;
}


.hostAnswer{
    background-color: rgba(0, 0, 0, 0.08);
    margin: 10px 10px 10px 10px;
    padding: 10px 10px 10px 10px;
}

.reviewStar00{
    clear: both;
    width: 120px;
    height: 24px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 -240px no-repeat;
    background-size: 120px auto;
    text-align: right;
    
}
.reviewStar05{
    clear: both;
    width: 120px;
    height: 24px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 -216px no-repeat;
    background-size: 120px auto;
    text-align: right;
    
}
.reviewStar10{
    clear: both;
    width: 120px;
    height: 24px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 -192px no-repeat;
    background-size: 120px auto;
    text-align: right;
    
}
.reviewStar15{
    clear: both;
    width: 120px;
    height: 24px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 -168px no-repeat;
    background-size: 120px auto;
    text-align: right;
    
}
.reviewStar20{
    clear: both;
    width: 120px;
    height: 24px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 -144px no-repeat;
    background-size: 120px auto;
    text-align: right;
    
}
.reviewStar25{
    clear: both;
    width: 120px;
    height: 24px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 -120px no-repeat;
    background-size: 120px auto;
    text-align: right;
    
}
.reviewStar30{
    clear: both;
    width: 120px;
    height: 24px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 -96px no-repeat;
    background-size: 120px auto;
    text-align: right;
}
.reviewStar35{
    clear: both;
    width: 120px;
    height: 24px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 -72px no-repeat;
    background-size: 120px auto;
    text-align: right;
}
.reviewStar40{
    clear: both;
    width: 120px;
    height: 24px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 -48px no-repeat;
    background-size: 120px auto;
    text-align: right;
}
.reviewStar45{
    clear: both;
    width: 120px;
    height: 24px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 -24px no-repeat;
    background-size: 120px auto;
    text-align: right;
}
.reviewStar50{
    clear: both;
    width: 120px;
    height: 24px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 0 no-repeat;
    background-size: 120px auto;
    background-position: 0 0;
    text-align: right;
}
.reviewTitle{
    display: flex;
}

.like{
    width: 30px;
    height: 20px;
    margin-left: 13px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/like.png) 0 0 no-repeat;
    background-size: 20px 20px;
    
}
.likeClick{
    width: 30px;
    height: 20px;
    margin-left: 13px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/likeClicked.png) 0 0 no-repeat;
    background-size: 20px 20px;
    
}

.unlike{
    width: 30px;
    height: 20px;
    margin-left: 13px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/likeun.png) 0 0 no-repeat;
    background-size: 20px 20px;
}
.unlikeClick{
    width: 30px;
    height: 20px;
    margin-left: 13px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/likeunclicked.png) 0 0 no-repeat;
    background-size: 20px 20px;
}

.topReview{
    border: 1px solid;
    width: 100px;
    background: #6eceda;
    color: white;
    border-radius: 5px;
}

.reviewScore h5{
	margin-left: 13px;
}
/* .like{
    width: 30px;
    height: 20px;
    margin-left: 13px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/like.png) 0 0 no-repeat;
    background-size: 20px 20px;
    
}
.unlike{
    width: 30px;
    height: 20px;
    margin-left: 13px;
    background: url(${pageContext.servletContext.contextPath }/resources/guest/images/likeun.png) 0 0 no-repeat;
    background-size: 20px 20px;
    
} */

.topReview{
    border: 1px solid;
    width: 100px;
    background: #6eceda;
    color: white;
    border-radius: 5px;
}

#btn4_content{
    display: none;
}
table.table2{
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
	margin-bottom: 20px;
}
table.table2 tr {
    padding: 8px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.table2 td {
    padding: 8px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
textarea {
	resize: none;
	width: 550px;
}

.submit_QnA {
	width: 100px;
	border-radius: 10px;
	background: #6eceda;
	color: white;
	border-style: none;
	box-shadow: 0 3px 0 #0e8c73;
	height: 35px;
}
.submit_QnA:hover {
	background-color: #4aa9b6;
	box-shadow: 0 3px 0 #23a188;
}
.submit_QnA:active {
	box-shadow: none;
}
.question-title{
	width: 500px;
}
.suksoName{
	display: flex;
}
</style>
</head>
<body>
<!--header-->


<jsp:include page="../../common/guestheader.jsp"/>
    
    <!--//-->	
    <center>

    <!-- 숙소상세정보 -->
        <div style="width: 1170px; margin-top: 30px; padding: 10px 35px 10px 35px;">
            <!-- 숙소사진, 이름 -->
            <div style=" width : 1100px; height : 500px; padding:10px 10px 10px 0px;display: flex; flex-direction: row;">
                <!-- 숙소사진 -->
                <div style=" width : 600px; height: 470px; display: block;background: url(${pageContext.servletContext.contextPath }/${accomo.attachment.thumbnailPath }); background-size: 600px 470px;">
                    
                </div>
                <!-- 숙소이름 -->
                <div class="accomoInfo">
                    <div><h2>${accomo.accomoName }</h2></div>
                    <br>
                    <c:choose>
                        <c:when test="${accomo.reviewScore == '0.0'}">
	                    <div><h3>등록된 평점 없음</h3></div>
                        
                        </c:when>
                        <c:otherwise>
                        <div><h3><p>평점</p>${ accomo.reviewScore }점 / 5점</h3></div>
                        </c:otherwise>
                    </c:choose>
                    <br>
                    <div><h4> - 주소 : ${accomo.address }</h4></div>
                    <br>
                    <div><h4> - 오시는길 : ${accomo.path }</h4></div>
                    <br>
                    <div><h4> - 성수기 기간 : ${accomo.peakStart } ~ ${accomo.peakEnd }</h4></div>
                    <br>
                
                    <div class="ownerComment">
                        <h4 style="text-align: left;"><b>1박 기준에 따른 요금안내</b></h4>
                        <br>
                        <p> <strong>기준 체크인 시간 : ${accomo.checkIn}</strong> <br>
                            <strong>기준 체크아웃 시간 : 11:00</strong> <br>
                           (기준 체크인시간부터 기준체크아웃 시간까지 전체 이용시 1박 요금이 적용됩니다.)<br>
                           (이외 이용시간에 따라 요금이 다르게 적용됩니다.)
                           </p>
                    </div>
                </div>
            </div>

            <br><br>
            <!-- 안내/예약, 정보, 리뷰 -->
            <div style="display: flex; width: 100%;">
				<div class="selectType">
					<button class="tab_button" id="book" type="button" style="color: #6eceda; border-bottom: 3px solid #6eceda;" onclick="tabChange(this);">
						<span>객실안내 / 예약</span>
					</button>
					<button class="tab_button" id="info" type="button" onclick="tabChange(this);" >
						<span>숙소정보</span>
					</button>
					<button class="tab_button3" id="review" type="button" onclick="tabChange(this);">
						 <span>리뷰</span>
					</button>
					<button class="tab_button" id="question" type="button" onclick="tabChange(this);">
						<span>문의하기</span>
					</button>
				</div>
				<div style="text-align: right; display: flex; ">
					<button style="padding:5px;background: red; color: white; border-radius: 10px; box-shadow: 0 3px 0 orange; border-style: none;"onclick="location.href='${pageContext.servletContext.contextPath }/book/report?no=${ accomo.accomoNo }';">신고하기</button>
					<div style="margin-left:5px; width: 30px; height: 30px; background: url(${pageContext.servletContext.contextPath }/resources/guest/images/신고.jpg) no-repeat; background-size: 30px 30px;"></div>
				</div>
			</div>
            <script>
				function tabChange(tc){
					
					document.getElementById(tc.id).style.color="#6eceda";
					document.getElementById(tc.id).style.borderBottom="3px solid #6eceda";

					if(tc.id=="book"){
						document.getElementById("btn1_content").style.display="block";
						document.getElementById("btn2_content").style.display="none";
						document.getElementById("btn3_content").style.display="none";
						document.getElementById("btn4_content").style.display="none";
						document.getElementById("info").style.color="black";
						document.getElementById("info").style.borderBottomStyle="none";
						document.getElementById("review").style.color="black";
						document.getElementById("review").style.borderBottomStyle="none";
						document.getElementById("question").style.color="black";
						document.getElementById("question").style.borderBottomStyle="none";
						
					}
					if(tc.id =="info"){
						document.getElementById("btn1_content").style.display="none";
						document.getElementById("btn2_content").style.display="block";
						document.getElementById("btn3_content").style.display="none";
						document.getElementById("btn4_content").style.display="none";
						document.getElementById("book").style.color="black";
						document.getElementById("book").style.borderBottomStyle="none";
						document.getElementById("review").style.color="black";
						document.getElementById("review").style.borderBottomStyle="none";
						document.getElementById("question").style.color="black";
						document.getElementById("question").style.borderBottomStyle="none";
						
					} 
					if(tc.id=="review"){
						document.getElementById("btn1_content").style.display="none";
						document.getElementById("btn2_content").style.display="none";
						document.getElementById("btn3_content").style.display="block";
						document.getElementById("btn4_content").style.display="none";
						document.getElementById("book").style.color="black";
						document.getElementById("book").style.borderBottomStyle="none";
						document.getElementById("info").style.color="black";
						document.getElementById("info").style.borderBottomStyle="none";
						document.getElementById("question").style.color="black";
						document.getElementById("question").style.borderBottomStyle="none";
					}
					if(tc.id=="question"){
					    document.getElementById("btn1_content").style.display="none";
						document.getElementById("btn2_content").style.display="none";
						document.getElementById("btn3_content").style.display="none";
						document.getElementById("btn4_content").style.display="block";
						document.getElementById("book").style.color="black";
						document.getElementById("book").style.borderBottomStyle="none";
						document.getElementById("info").style.color="black";
						document.getElementById("info").style.borderBottomStyle="none";
						document.getElementById("review").style.color="black";
						document.getElementById("review").style.borderBottomStyle="none";
					}
				}
			</script>
            
			<br>
			<br>
			<!-- <객실안내/예약 탭> -->
			<div id="btn1_content">
			<form method = "POST" onsubmit="return bookChecking();" action="${pageContext.servletContext.contextPath }/book/booking">
			
				<div style="width: 1100px; height: 60px; padding:5px 10px 5px 10px;display: flex;justify-content: space-around; background-color: white;">
					<!-- 예약일자 입력 -->

					<div style="display: flex; ">
						<h4 style="margin: 15px;" >입실일</h4>
						<input id="checkInD" type="date" name="checkInDate" required="required" >
					</div>
					<div style="display: flex; ">
						<h4 style="margin: 15px;">퇴실일</h4>
						<input id="checkOutD" type="date" name="checkOutDate" required="required" >
					</div>
					<div style="display: flex;">
						<h4 style="margin: 15px;">인원</h4>
						<input id="person"type="number" name="people" min="1" style="width: 100px; text-align: center;" required="required">
					</div>
					<div style="display: flex;">
						<h4 style="margin : 15px;">체크인 </h4>
						<select id="checInT"style="width: 150px;" name="checkInTime" required="required">
							<option value="00:00">00:00</option>
							<option value="01:00">01:00</option>
							<option value="02:00">02:00</option>
							<option value="03:00">03:00</option>
							<option value="04:00">04:00</option>
							<option value="05:00">05:00</option>
							<option value="06:00">06:00</option>
							<option value="07:00">07:00</option>
							<option value="08:00">08:00</option>
							<option value="09:00">09:00</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>
							<option value="21:00">21:00</option>
							<option value="22:00">22:00</option>
							<option value="23:00">23:00</option>
						</select>
					</div>


				<!-- //예약일자 입력 -->
				</div>

				<hr>
				<center>
					<!-- 객실정보 -->
					<c:forEach var="roomList" items="${ roomList }" varStatus ="st">
					<div class="detailList" > 
						<div class="detailImg" style="background: url(${pageContext.servletContext.contextPath }/${roomList.attachment.thumbnailPath }) no-repeat; background-size: 100%;" ></div>
						<div class="detailInfo" >
							<div><h3>${roomList.roomName}</h3></div>
							<br>
							<div style="display: flex;">
								<div style="width: 40%;">정원</div>
								<div style="margin-left: 40px; width: 50%;">${roomList.roomMax } 인</div>
								<input type="hidden" name="roomMax" value="${roomList.roomMax }">
							</div>
							<hr>
							<div style="display: flex;">
								<div style="width: 40%;">비수기요금</div>
								<div style="margin-left: 40px; width: 50%;">${roomList.roomFee }원 / 1박</div>
								<input type="hidden" name="price" value="${roomList.roomFee }">
							<%-- <input type="hidden" name="roomNo" value="${roomList.roomNo }"> --%>
							</div>
							<hr>
							<div style="display: flex;">
								<div style="width: 40%;">성수기요금</div>
								<div style="margin-left: 40px; width: 50%;">${roomList.peakFee }원 / 1박</div>
								<input type="hidden" name="peakFee" value="${roomList.peakFee }">
							<%-- <input type="hidden" name="roomNo" value="${roomList.roomNo }"> --%>
							</div>
							<hr>
							<div>
								<input type="hidden" name="accomoName" value="${accomo.accomoName }">
								<input type="hidden" name="accomoNo" value="${accomo.accomoNo }">
								<input type="hidden" name="peakFee" value="${roomList.peakFee }">
								<input type="hidden" name="roomName" value="${roomList.roomName }">
								
								<input type="hidden" name="AccomoCheckIn" value="${accomo.checkIn }">
								
								<button class="detail_btn" type="submit" name="roomNo" value="${roomList.roomNo }">예약하기</button>
							</div>
						</div>
					</div>
					</c:forEach>
					
					<!--// 객실정보 -->
				</center>
				</form>
			</div>
			<!-- 숙소상세정보 -->
			<div id="btn2_content"class="accordion vertical" style="display: none;">
				<ul>
					<li>
						<input type="checkbox" id="checkbox-1" name="checkbox-accordion" />
						<label for="checkbox-1">기본정보</label>
						<div class="content">
							<h3>주변정보</h3>
							<p>- ${ accomo.near }</p>
							<h3>공지사항</h3>
							<p>- 성수기 : ${accomo.peakStart } ~ ${accomo.peakEnd }</p>
							<p>- ${accomo.rule }</p>
							<h3>기본정보</h3>
							<p>- 입실가능시간 : ${accomo.checkIn } | 퇴실 : ${accomo.checkOut }</p>
							<p>- 주차요금 : ${accomo.parking}</p>
							<h3>취소 및 환불 규정</h3>
							<p>- 체크인 3일 이전 : 100% 환불</p>
							<p>- 체크인 2일전 : 수수료 10% 제외 후 환불</p>
							<p>- 체크인 1일전 ~ 당일 및 No-show : 수수료 20% 제외 후 환불</p>
							<p>- 취소, 환불 시 수수료가 발생할 수 있습니다.</p>
							<h3>확인사항 및 기타</h3>
							<p>- 최대 인원 초과시 입실이 불가합니다.</p>
							<p>- 보호자 동반없는 미성년자는 이용하실 수 없습니다.</p>
							<p>- 해당 이미지는 실제와 상이 할 수 있습니다.</p>
							<p>- 위의 정보는 펜션의 사정에 따라 변경될 수 있습니다.</p>
							<p>- 성수기 기간동안 일부 객실의 경우 요금변동이 있을 수 있습니다.</p>
						</div>
					</li>
					<hr>
					<li>
						<input type="checkbox" id="checkbox-2" name="checkbox-accordion" />
						<label for="checkbox-2">편의시설 및 서비스</label>
						<div class="content2">
							<p>${accomo.facility }</p>
						</div>
					</li>
					
				</ul>
			</div>
			<hr>
            <!-- //숙소상세정보 -->
                  <!-- <script>
					    function bookChecking(){
					    	alert("호출은 되나?");
					    	var chekInD = document.getElementbyId("checkInD").value;
					    	var chekOutD = document.getElementbyId("checkOutD").value;
					    	var checkP = document.getElementbyId("person");
					    	if(chekInD>chekOutD){
					    		alert("체크인날짜가 더 빠릅니다.")
					    		return false;
					    	} 
					    	if(chekInD<chekOutD){
					    		alert("체크아웃 날짜가 이후임")
					    	}
					    	console.log(a);
					    	console.log(b);
					    	console.log(c);
					    }
					</script> -->
			<!-- 리뷰 -->
			<div id="btn3_content" style="display: none;">
                <div style="margin: 0 auto;">
                    <br>
    
                    <c:choose>
                        <c:when test="${ accomo.reviewScore eq 0}">
                            <h3>등록된 리뷰가 없어요</h3>
                            <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar00" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore lt 1}">
                            <h3>최악이에요</h3>
                            <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar05" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 1 &&  accomo.reviewScore lt 1.5}">
                            <h3>별로에요</h3>
                            <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar10" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 1.5 && accomo.reviewScore lt 2}">
                        <h3>추천하지 않아요</h3>
                            <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar15" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 2 && accomo.reviewScore lt 2.5}">
                        <h3>그냥그래요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar20" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore le 2 && accomo.reviewScore lt 3}">
                        <h3>나쁘지 않아요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar25" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 3 && accomo.reviewScore lt 3.5}">
                        <h3>평범해요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar30" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 3.5 && accomo.reviewScore lt 4}">
                        <h3>좋아요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar35" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br></c:when>
                        <c:when test="${ accomo.reviewScore ge 4 && accomo.reviewScore lt 4.5}">
                        <h3>만족해요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar40" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 4.5 && accomo.reviewScore lt 5}">
                        <h3>추천해요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar45" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore eq 5}">
                        <h3>최고에요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar50" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                    </c:choose>
                    
                    <c:choose>
                        <c:when test="${accomo.reviewScore eq 0}">
                     <p>
                        전체리뷰  :  0 개
                    </p>
                    </p>
                        </c:when>
                        <c:otherwise>
                     <p>
                        전체리뷰  :  ${totalCount} 개
                        </c:otherwise>
                    </c:choose>
                </div>
                <hr>   
                <br>

                <ul class = reviewWrap>
                	<c:forEach var="best" items="${bestReview}">
                	
                    <li>
                        <div class="guestReview">
                            <div class="topReview" style="text-align: center;">베스트리뷰</div>
                            <div class="reviewTitle">
                                <div>
                                    <h4><strong>${best.title }</strong></h4>
                                </div>
                                <c:choose>
                                    <c:when test="${best.updownStatus eq 'U' }">
                                        <div class="likeClick" id="like${best.reviewNo}"value = '${best.reviewNo}' onclick="likeHate(this);"></div>
                                        <div><p name="review${best.reviewNo}">${best.upCnt }</p></div>
                                        <div class="unlike" id="unlike${best.reviewNo }"value = '${best.reviewNo}'  onclick="likeHate(this);"></div>
                                        <div><p name="review${best.reviewNo}">${best.downCnt }</p></div>
                                    </c:when>
                                     <c:when test="${best.updownStatus eq 'D' }">
                                        <div class="like"id="like${best.reviewNo}" value = '${best.reviewNo}'  onclick="likeHate(this);"></div>
                                        <div><p name="review${best.reviewNo}">${best.upCnt }</p></div>
                                        <div class="unlikeClick"id="unlike${best.reviewNo}" value = '${best.reviewNo}'  onclick="likeHate(this);"></div>
                                        <div><p name="review${best.reviewNo}">${best.downCnt }</p></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="like" id="like${best.reviewNo}"value = '${best.reviewNo}'  onclick="likeHate(this);"></div>
                                        <div><p name="review${best.reviewNo}">${best.upCnt }</p></div>
                                        <div class="unlike" id="unlike${best.reviewNo}"value = '${best.reviewNo}' onclick="likeHate(this);"></div>
                                        <div><p name="review${best.reviewNo}">${best.downCnt }</p></div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
							
                            <div class="reviewScore" style="display: flex;">
			    				<c:choose>
                                <c:when test="${ best.starPoint eq 1}">
                                   <div  style="display:flex;width: 90px; height:18px;background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 0 no-repeat; background-size: 90px auto; background-position: 0 -147px;">
			    					</div>
                                </c:when>
                                <c:when test="${ best.starPoint eq 2}">
                                    <div  style="display:flex;width: 90px; height:18px;background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 0 no-repeat; background-size: 90px auto; background-position: 0 -110px;">
	     	    					</div>
                                </c:when>
                                <c:when test="${ best.starPoint eq 3}">
                                    <div  style="display:flex;width: 90px; height:18px;background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 0 no-repeat; background-size: 90px auto; background-position: 0 -73px;">
	  		    					</div>
                                </c:when>
                                <c:when test="${ best.starPoint eq 4}">
                                    <div  style="display:flex;width: 90px; height:18px;background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 0 no-repeat; background-size: 90px auto; background-position: 0 -35px;">
		            				</div>
                                </c:when>
                                <c:when test="${ best.starPoint eq 5}">
                                    <div  style="display:flex;width: 90px; height:18px;background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 0 no-repeat; background-size: 90px auto; background-position: 0 0;">
			    					</div>
                                </c:when>
                            </c:choose>
                             	<h5>${best.starPoint}</h5>
                            </div>
                            <div class="suksoName">
                                <p>닉네임 </p><b> · ${best.nickName}</b>
                            </div>
                            <div class=reviewContext>
                                <p>${best.content}</p>
                            </div>
                            <div class=reviewPicture  style=" width : 300px; height: 170px; display: block;background: url(${pageContext.servletContext.contextPath }/${best.attachment.thumbnailPath }); background-size: 300px 170px;">
                            </div>
                        </div>                      
                    </li>
					</c:forEach>
					                 

                    <hr>
                    <c:forEach var="normalReview" items="${requestScope.reviewList }">
                    <li>
                        <div class="guestReview">
                            <div class="reviewTitle">
                                <div>
                                    <h4><strong>${normalReview.title}</strong></h4>
                                </div>
								<c:choose>
                                    <c:when test="${normalReview.updownStatus eq 'U' }">
                                        <div class="likeClick" id="like${normalReview.reviewNo}"value = '${normalReview.reviewNo}' onclick="likeHate(this);"></div>
                                        <div><p name="review${normalReview.reviewNo}">${normalReview.upCnt }</p></div>
                                        <div class="unlike" id="unlike${normalReview.reviewNo }"value = '${normalReview.reviewNo}'  onclick="likeHate(this);"></div>
                                        <div><p name="review${normalReview.reviewNo}">${normalReview.downCnt }</p></div>
                                    </c:when>
                                     <c:when test="${normalReview.updownStatus eq 'D' }">
                                        <div class="like"id="like${normalReview.reviewNo}" value = '${normalReview.reviewNo}'  onclick="likeHate(this);"></div>
                                        <div><p name="review${normalReview.reviewNo}">${normalReview.upCnt }</p></div>
                                        <div class="unlikeClick"id="unlike${normalReview.reviewNo}" value = '${normalReview.reviewNo}'  onclick="likeHate(this);"></div>
                                        <div><p name="review${normalReview.reviewNo}">${normalReview.downCnt }</p></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="like" id="like${normalReview.reviewNo}"value = '${normalReview.reviewNo}'  onclick="likeHate(this);"></div>
                                        <div><p name="review${normalReview.reviewNo}">${normalReview.upCnt }</p></div>
                                        <div class="unlike" id="unlike${normalReview.reviewNo}"value = '${normalReview.reviewNo}' onclick="likeHate(this);"></div>
                                        <div><p name="review${normalReview.reviewNo}">${normalReview.downCnt }</p></div>
                                    </c:otherwise>
                                </c:choose>
                                
                            </div>
							<div class="reviewScore" style="display: flex;">
							<c:choose>
                            <c:when test="${ normalReview.starPoint eq 1}">
                               <div  style="display:flex;width: 90px; height:18px;background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 0 no-repeat; background-size: 90px auto; background-position: 0 -147px;">
								</div>
                        </c:when>
                        <c:when test="${ normalReview.starPoint eq 2}">
                            <div  style="display:flex;width: 90px; height:18px;background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 0 no-repeat; background-size: 90px auto; background-position: 0 -110px;">
							</div>
                        </c:when>
                        <c:when test="${ normalReview.starPoint eq 3}">
                        <div  style="display:flex;width: 90px; height:18px;background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 0 no-repeat; background-size: 90px auto; background-position: 0 -73px;">
								</div>
                        </c:when>
                        <c:when test="${ normalReview.starPoint eq 4}">
                        <div  style="display:flex;width: 90px; height:18px;background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 0 no-repeat; background-size: 90px auto; background-position: 0 -35px;">
						</div>
                        </c:when>
                        <c:when test="${ normalReview.starPoint eq 5}">
                        <div  style="display:flex;width: 90px; height:18px;background: url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png) 0 0 no-repeat; background-size: 90px auto; background-position: 0 0;">
								</div>
                        </c:when>
                        </c:choose>
								
                            	<h5>${normalReview.starPoint}</h5>
                            </div>
                            <div class="suksoName" >
                                <p>닉네임 </p><b> · ${normalReview.nickName }</b>
                            </div>
                            <div class=reviewContext>
                                <p>${normalReview.content}</p>
                            </div>
                              <div class=reviewPicture  style=" width : 300px; height: 170px; display: block;background: url(${pageContext.servletContext.contextPath }/${normalReview.attachment.thumbnailPath }); background-size: 300px 170px;">
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </ul> 
                <script>
                                function likeHate(p){
                                	
                                	var reviewNo = document.getElementById(p.id).attributes.value.value;
									var className = document.getElementById(p.id).className;
                                	var reviewName = "review" + reviewNo;
                                	var anotherId = "";
                                	var status = "";
                                	switch(className){
                                	case "like" : 
                                		document.getElementById(p.id).className = "likeClick";
                                		anotherId = "unlike" + reviewNo;
                                		document.getElementById(anotherId).className = "unlike"; 
                                		status = "U";
                                		break;
                                	case "likeClick" :
                                		document.getElementById(p.id).className = "like";
                                		anotherId = "unlike" + reviewNo;
                                		document.getElementById(anotherId).className = "unlike";
                                		status = "N";
                                		break;
                                	case "unlike" :
                                		document.getElementById(p.id).className = "unlikeClick";
                                		anotherId = "like" + reviewNo;
                                		document.getElementById(anotherId).className = "like";
                                		status = "D";
                                		break;
                                	case "unlikeClick" :
                                		document.getElementById(p.id).className = "unlike";
                                		anotherId = "like" + reviewNo;
                                		document.getElementById(anotherId).className = "like";
                                		status = "N";
                                		break;
                                	}
                                	$.ajax({
                                		
                                		url:"${pageContext.servletContext.contextPath}/accomoSelect/review",
                                		type:"post",
                                		data:{
                                			status : status,
                                			reviewNo : reviewNo
                                		},
                                		success:function(data, textStatus, xhr){
                                			document.getElementsByName(reviewName)[0].innerHTML = data.up;
                                			document.getElementsByName(reviewName)[1].innerHTML = data.down;
                                			
                                		}
                                	});
                                }

                                </script>
				<hr>
				<div class="clearfix"> </div>
<!-- 	    <nav>
	    
	    
		<ul class="pagination">
		  <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
		  <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		  <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
	   </ul>
	   </nav> -->
                
                <!-- //리뷰내용 -->
            </div>
			<!-- //리뷰 -->
			<!-- 문의 -->
			<div id="btn4_content" >
			<form method="post" action="${pageContext.servletContext.contextPath}/book/question">
				<table  style="padding-top:50px;" align = center width=100% border=0 cellpadding=2 style="margin: auto;">
					<tr>
					<td bgcolor=white align="center">
					<table class = "table2">
						<tr>
						<td style="width: 50px;">제목</td>
						<td >
							<input type="text" class = "question-title" name="title">
							<input type="hidden" name="accomoNo" value="${accomo.accomoNo }">
							<input type="hidden" name="userNo" value="${sessionScope.member.userNo }">
						</td>
						</tr>
		
						<tr>
						<!-- <td>내용</td> -->
						<td colspan="2"><textarea name = "content" cols=85 rows=15 placeholder="문의 내용을 입력해주세요"></textarea></td>
						</tr>
					</table>
						<center>
							<button class="submit_QnA" type="submit">작성</button>
						</center>
					</td>
					</tr>
			</table>
			</form>
			</div>
        </center>
	
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