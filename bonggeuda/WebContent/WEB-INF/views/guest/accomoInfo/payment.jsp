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
<title>봉그다숙박</title>
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.servletContext.contextPath }/resources/guest/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${pageContext.servletContext.contextPath }/resources/guest/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/styles.css" rel="stylesheet">
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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
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
.guestInfo{
    text-align: left;
}
.guestInfo p{
    font-size: 20px;
}
.guestInfo h3{
    font-size: 30px;
}

.all_check{
	font-weight: bolder;
}
.agree{
    text-align: left;
    margin-top: 40px;
    font-size: 20px;
}

.agree input{
    width: 15px;
    height: 15px;
    margin: 20px 13px 0 13px;
}

.agree b{
    margin-left: 15px;
    color: red;
}

.agree u{
	font-weight: normal;
	
}


.right section{
	text-align: left;
	margin:30px 20px 0 20px;

}

.accommoInfo p{
	margin-bottom : 30px;
	font-size: 21px;
	line-height: 40px;
}

.accommoInfo strong{
	font-size: 17px;
	color: rgba(0, 0, 0, 0.4);
}
.totalPrice{
	line-height: 40px;
}
.totalPrice strong{
	color: rgba(0, 0, 0, 0.4);
}
.totalPrice b{
	font-size: 23px;
	color: black;
}
.in_price{
	color: red;
	font-size: 27px;
	font-weight: bolder;
}
.payButton{
	width: 360px;
	height: 50px;
	border: 0;
    outline: 0;
	background: #6eceda;
	color: white;
	font-size: 20px;
	border-radius: 10px;
	box-shadow: 0 3px 0 #0e8c73;

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
  padding: 20px;
  max-width: 350px;
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
  max-width: 350px;
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
	border-style: none;
	box-shadow: 0 3px 0 #0e8c73;
	border-radius: 10px;
	padding: 5px;
}


</style>
</head>
<body>
<!--header-->
    <!-- 숙소상세정보 -->
    <jsp:include page="../../common/guestheader.jsp"/>
    <center>
		<form name="paymentForm" method="post" action="${pageContext.servletContext.contextPath}/book/payment">
        <div style="width: 1170px; margin-top: 60px; display: flex">
			<!-- 예약자정보 -->
            <div class="left" style="width: 700px; padding:0 10px 0 10px;  display: block;" >
                <section class="guestInfo">
                    <h3><b>예약자 정보</b></h3>
                    <br><br>
                    <p>예약자 이름</p>
                    <input id="bookName"name="bookName"style="width: 650px; height: 50px; margin-top:15px" placeholder="체크인시 필요한 정보입니다." required="required">
                    <br>
					<hr>
                    <p>휴대폰 번호</p>
                    <!-- <p style="font-size: 15px;">개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</p> -->
                   <!--  <div style="width: 650px;height: 50px; display: flex; margin-top:15px"> -->
                        <input id= "phone" name="phone"type="tel" style="width: 650px; height: 50px; margin-top:15px"placeholder="체크인시 필요한 정보입니다." required="required">
                       
                    <!-- </div> -->
					<hr>
					<!-- 쿠폰,포인트 -->
					<div style = "display :flex;">
					
					<p>할인수단선택</p>
					<!-- <-- <button type="button" id="discount">적용하기</button> -->
					
				     <button id = "discount" type = "button"style="width: 90px;margin-left: 30px; border: 0; outline: 0; background: #6eceda; color: white; font-weight: bold;box-shadow: 0 3px 0 #0e8c73;border-radius: 10px;">적용하기</button>
				        <!-- </div> -->
					<script>
					    $("#discount").click(function(){
					    	var couponNo = "0";
					    	for(var i = 0; i < $(".couponDis")[0].length; i++){
					    		if($(".couponDis")[0][i].selected)
					    			
					    			couponNo = $(".couponDis")[0][i].value;
					    			
					    	}
					 
					    	let point = $("#pointDis")[0].value;
					    	if(couponNo == 0 && (point == "" || point =="0")){
					    		alert("할인수단을 선택해주세요");
					    		$("#hiddenPrice")[0].value = ${totalPrice};
				    	    	$("#totalPrice")[0].value = ${totalPrice};
				    	    	$("#totalPrice")[0].innerHTML = ${totalPrice};
				    	    	$("#couponDiscount")[0].value = 0;
					    		return;
					    	}
					    	$.ajax({
					    		url:"${pageContext.servletContext.contextPath}/book/payment",
					    		type:"get",
					    		data:{coupon : couponNo},
					    		success:function(data, textStatus, xhr){

					    	    	let couponAmount = Number(data);
					    	    	let pointAmount = Number(point);
					    	    	let beforePrice = ${totalPrice};
					    	    	let afterPrice = beforePrice - (couponAmount +  pointAmount);

					    	    	$("#hiddenPrice")[0].value = afterPrice;
					    	    	$("#totalPrice")[0].value = afterPrice;
					    	    	$("#totalPrice")[0].innerHTML = afterPrice;
					    	    	$("#couponDiscount")[0].value = couponAmount;
									alert("할인이 적용되었습니다.");
					    	    },
					    	});
					    });
					</script>
					</div>
					<br>
					<div style="width: 100%; display: flex;">
						<p style="margin: 0 130px 0 10px; font-size: 18px;">쿠폰사용</p>
						
						<select name="couponNo" class="couponDis" id="discountCoupon" style=" width: 60%; height: 30px; margin-left: 50px;">
						<c:choose>
						  <c:when test="${empty couponList}">
							<option class="couponList"value="0"> 사용가능한 쿠폰이 없습니다.</option>
						  </c:when>
						  <c:otherwise>
							<option class="couponList" value="0"> 쿠폰을 선택하세요.</option>
							<c:forEach var="coupon" items="${couponList}" varStatus = "st">
							<%-- <option type="hidden" name="couponNo" value="${coupon.couponNo }" style="display:none;"> --%>
							<option id="couponDis"class="couponList" value="${coupon.couponNo}" > ${coupon.couponName} : ${coupon.couponDiscount}원 할인(${coupon.couponCondition}원 이상 결제시)</option>
							</c:forEach>
						  </c:otherwise>
						</c:choose>
						</select>
					</div>
					<div style="width: 100%; display: flex; margin-top: 15px;">
						<p style="margin: 0px 80px 0px 0px; font-size: 18px;">포인트사용<small>(1000포인트단위 사용가능)</small></p>
						<c:choose>
						<c:when test="${empty point || point.point == 0}">
						<input name="point" type="text" value = "0"readonly style="text-align: right; width: 10%; height: 30px;margin-left: 150px;"></input><b style="margin: 5px 0px 0px 5px;">/ 0 포인트</b>
						</c:when>
						<c:otherwise>
						<!-- <p style="width:40%;margin: 0px 85px 0px 0px; font-size: 18px;">사용가능 포인트 : </p> -->
						<input  id="pointDis"name="point"type="number" step="1000" min="0" max="${point.point }"style="text-align: right; width: 10%; height: 30px;margin-left: 170px; "> <b style="margin: 5px 0px 0px 5px;">/ ${point.point } 포인트</b>
						</c:otherwise>
						</c:choose>
					</div>
					<div style="width: 100%; display: flex; margin-top: 15px;">
						<p style="margin: 0px 80px 0px 0px; font-size: 18px;"><small>* 적용하기 버튼을 눌러야 할인이 적용됩니다.</small></p>
					</div>
					<div style="width: 100%; display: flex; margin-top: 5px;">
                        <p style="margin: 0px 80px 0px 0px; font-size: 18px;"><small>* 환불시 사용한 쿠폰과 포인트는 반환되지 않습니다.</small></p>
					</div>
					<hr>
					
					<p>요청사항</p>
					<br>
					<div style="width: 100%;">
						<textarea name="request" style="width:95%; height: 80px; resize:none;" placeholder="요청사항을 입력하세요" ></textarea>
					</div>
					<br><br>
                </section>
				<hr>
				
				<!-- 결제수단 -->
                <section class="guestInfo">
					
                    <h3><b>결제수단 선택</b></h3>
                    <br>
                    <select id="paymentType" name="paymentType" style="width: 650px; height: 50px;">
                        <option data-minprice="100" value="KAKAO">
                            카카오페이
                        </option>
<!--                         <option data-minprice="100" value="CARD">
                            신용/체크카드
                        </option> -->
                    </select>
                </section>
               <!-- 결제동의 -->
                <section class="agree" >
                    <p class="all_check" ><label><input id="allcheck" type="checkbox" name="checkAll" class="inp_chk_02" onclick="check(this);"> <span>전체 동의</span></label></p> 
                    <p><label><input type="checkbox" name="checkOne" class="inp_chk_02" required="required" onclick="check(this)"><span><u>숙소이용규칙 및 취소/환불규정 동의</u><b>(필수)</b></span></label></p> 
                    <p><label><input type="checkbox" name="checkOne" class="inp_chk_02" required="required" onclick="check(this)"><span><u>개인정보 수집 및 이용 동의</u><b>(필수)</b></span></label></label></p> 
                    <p><label><input type="checkbox" name="checkOne" class="inp_chk_02" required="required" onclick="check(this)"><span><u>개인정보 제 3자 제공 동의</u><b>(필수)</b></span></label></p>
                    <p><label><input type="checkbox" name="checkOne" class="inp_chk_02" required="required" onclick="check(this)"><span><u>만 14세 이상 확인</u><b>(필수)</b></label></span></p>
                <script>
                    function check(p){
                    	var all = document.getElementById("allcheck");
                    	var list = document.getElementsByName("checkOne");
                    	if(p.id == "allcheck"){
                        	if(all.checked){
                        		for(var i = 0; i < list.length; i++){
                    			list[i].checked = true;
                        		}
                        	} else {
                        		for(var i = 0; i < list.length; i++){
                        			list[i].checked = false;
                        		}
                        	}
                        } else {
                        	var num = 0;
                        	for(var i = 0; i < list.length; i++){
                        		if(list[i].checked){
                        		num++;
                        		}
                        	}
                        	if(num == 4){
                        		all.checked = true;
                        	} else{
                        		all.checked = false;
                        	}
                        }
                    }
                </script>
                </section>
				
            </div>
            <div class="right" style="width: 360px; margin: 0 0 100px 60px;  background-color: rgba(0, 0, 0, 0.02); display: block;">
				<section class="accommoInfo">
					<p>
						<strong>숙소이름</strong><br>
						${ accomoInfo.accomoName }
					</p> 
					<p>
						<strong>객실타입/기간</strong><br>
						${roomInfo.roomName } / ${bookInfo.day }박
					</p>
					<p>
						<strong>체크인</strong><br>
						${bookInfo.bookCheckDate } / ${bookInfo.bookCheckIn }
					</p>
					<p>
						<strong>체크아웃</strong><br>
						${bookInfo.bookCheckoutDate } / 11:00
					</p>
					<hr>
				</section>
				<section class="totalPrice">
					<p>
						<strong>
							<b>총 결제 금액</b>
							(VAT포함)
						</strong><br>
						<span id="totalPrice" class="in_price">${totalPrice }</span>
						<input id="hiddenPrice" name="finalPrice" type="hidden" value=${totalPrice }>
						<input type = "hidden" name="roomNo" value="${ roomInfo.roomNo}">
						<input type = "hidden" name="checkInDate" value="${bookInfo.bookCheckDate}">
						<input type = "hidden" id="checkOutDate"name="checkOutDate" value="${bookInfo.bookCheckoutDate}">
						<input type = "hidden" id="checkInTime"name="checkInTime" value="${bookInfo.bookCheckIn}">
						<input type = "hidden" id="personnel" name="personnel" value="${bookInfo.bookPersonnel}">
						<input type = "hidden" id="pointNo" name="pointNo" value="${point.pointNo }">
						<input id="couponDiscount" type = "hidden" name="couponDiscount" value=0>
						
					</p>
					<ul>
						<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다.</li>
						<li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span>하시면 됩니다.</li>
					</ul>
				</section>
				<br>
				<!-- <button class="payButton" onclick="location.href='mypage_reservation.html';">결제하기</button> -->
				<button type="button" class="payButton" onclick="checkContent();">결제하기</button>
				
				
            </div>
            <script>
                function checkContent(){
    		        var name = document.getElementById("bookName").value;
    		        var phone = document.getElementById("phone").value;
    		        var check = document.getElementById("allcheck").checked;
    		        if(name.length == 0){
    		        	alert("이름을 입력하세요");
    		        	return;
    		        }
    		        if(phone.length ==0){
    		        	alert("전화번호를 입력하세요");
    		        	return
    		        }
    		        
    		        if(check == false){
    		        	alert("규정에 동의하셔야 결제가 가능합니다.");
    		        	return;
    		        }
    		        location.href='#pop01';
    		       
                }
            </script>
			
			<!-- 예약내역확인 -->
			<div id="pop01" class="overlay">
				<div class="popup">
					<a href="#none" class="close">&times;</a>
						<sections style="clear: initial; ">
							<strong>예약내역확인</strong>
						</section>
						<hr>
						<sectionn>
							<p>${ accomoInfo.accomoName }</p>
							<p>${roomInfo.roomName } / ${bookInfo.day }박</p>
							<div class="check" style="display: flex;">
								<div style="text-align: left;">체크인</div>
								<div class="date">${bookInfo.bookCheckDate } / ${bookInfo.bookCheckIn }</div>
							</div>
							<div class="check" style="display: flex;">
								<div style="text-align: left;">체크아웃</div>
								<div class="date">${bookInfo.bookCheckoutDate } / 11:00</div>
							</div>
						</section>
						<hr>
						<section >
							<ul>
								<li>미성년자는 보호자 동반 시 투숙이 가능합니다</li>
								<li><b>취소 및 환불 규정</b>에 따라 취소수수료 부과 및 취소불가 될 수 있습니다.</li>
							</ul>
						</section>
						<hr>			
						<section>
								<button onclick="location.href='#none';" style="border-radius: 10px;padding: 5px; box-shadow: 0 3px 0 0 rgba(0, 0, 0, 0.2); border:1px solid rgba(0, 0, 0, 0.1);"></a>취소</button>
								
								<button id = "doPay"type = "button" class="payAgree">동의 후 결제</button>
								<!-- onclick="location.href='#pop02'" -->
						</section>
						

				</div>
			</div>
        </form>
			<!-- //예약내역확인 -->
			<!-- 예약성공 -->
			<div id="pop02" class="overlay">
				<div class="popup">
					<a href="#none" class="close">&times;</a>
						<p style="text-align: center; margin-bottom: 20px;">정상예약되었습니다</p>
						<button style="width: 200px; height: 40px; background-color: #6eceda; border: #6eceda; color: white;box-shadow: 0 3px 0 #0e8c73; border-radius: 10px;  border-style: none;" onclick="location.href='mypage_reservation.html';">확인</button>
				</div>
			</div>
			<!-- //예약성공 -->

			<!-- 예약실패 -->
			<div id="pop02" class="overlay">
				<div class="popup">
					<a href="#none" class="close">&times;</a>
						<p style="text-align: center; margin-bottom: 20px;">예약에 실패했습니다</p>
						<button style="width: 200px; height: 40px; background-color: #6eceda; border: #6eceda; color: white;box-shadow: 0 3px 0 #0e8c73; border-radius: 10px; border-style: none;" onclick="location.href='#none';">확인</button>
				</div>
			</div>
			<!-- 예약실패 -->
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
<script>
    $("#doPay").click(function(){
        var IMP = window.IMP; // 생략가능
        
        IMP.init('imp61135991'); // 
        //전달해야하는 변수
        var msg;
        const bookName = document.getElementsByName("bookName")[0].value;
        const personnel = document.getElementsByName("personnel")[0].value; 
        const checkInDate = document.getElementsByName("checkInDate")[0].value; 
        const checkOutDate = document.getElementsByName("checkOutDate")[0].value; 
        const checkInTime = document.getElementsByName("checkInTime")[0].value;
        const phone = document.getElementsByName("phone")[0].value; 
        const roomNo = document.getElementsByName("roomNo")[0].value; 
        const request = document.getElementsByName("request")[0].value;
        const finalPrice = document.getElementsByName("finalPrice")[0].value; 
        const point = document.getElementsByName("point")[0].value;
        const couponDiscount = document.getElementsByName("couponDiscount")[0].value; 
        const paymentType = document.getElementsByName("paymentType")[0].value; 
        const couponNo = document.getElementsByName("couponNo")[0].value;
        const pointNo = document.getElementsByName("pointNo")[0].value;
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'BONGGEUDA 숙박 결제',
            amount : finalPrice,
            buyer_email : 'test@tj.com',
            buyer_name : bookName,
            buyer_tel : phone,
            buyer_addr : '서울시 강남구 상섬동',
            buyer_postcode : '123-456'
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                    	imp_uid : rsp.imp_uid,
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                        
                    } else {
                    	alert("결제에 실패했습니다.");
                    	return;
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                $.ajax({
    			    		url:"${pageContext.servletContext.contextPath}/book/payment",
    				    	type:"post",
    				    	data:{
    				    		bookName : bookName,
    	                    	personnel : personnel,
    	                    	checkInDate : checkInDate,
    	                    	checkOutDate : checkOutDate,
    	                    	checkInTime : checkInTime,
    	                    	phone : phone,
    	                    	roomNo : roomNo,
    	                    	request : request,
    	                    	finalPrice : finalPrice,
    	                    	point : point,
    	                    	pointNo : pointNo,
    	                    	couponDiscount : couponDiscount,
    	                    	paymentType : paymentType,
    	                    	couponNo : couponNo
    				    	},
    				    	success:function(data, textStatus, xhr){
    				    		alert("결제 성공하였습니다!!\n예약이 완료었습니다.");
    				    		location.replace("${pageContext.servletContext.contextPath}/userbooklist/select")
    				    	},
    				    	error:function(xhr,status,error){
    				    		console.log(error);
    				    	}
    				    });
                
                ;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                alert("결제 실패하였습니다.!")
            }
        });
        
    });
    </script>
<!--//footer-->
</body>
</html>