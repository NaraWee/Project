<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="${pageContext.servletContext.contextPath }/resources/admin/css/bootstrap.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="${pageContext.servletContext.contextPath }/resources/admin/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script
	src="${pageContext.servletContext.contextPath }/resources/admin/js/scripts.js"></script>
<link
	href="${pageContext.servletContext.contextPath }/resources/admin/css/styles.css"
	rel="stylesheet">
<!--//menu-->

<!-- theme-style -->
<link
	href="${pageContext.servletContext.contextPath }/resources/admin/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<!-- <link href="css/common.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/product.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<style>
.container h3 {
	display: block;
	font-size: 18px;
	color: rgba(0, 0, 0, 0.87);
}

.list_wrap button {
	width: 180px;
	height: 30px;
	padding: 1px 5px 1px 5px;
}

.detailList {
	width: 1000px;
	height: 300px;
	margin-bottom: 15px;
	padding: 20px 20px 20px 20px;
	border: 1px solid rgba(0, 0, 0, 0.08);
	display: flex;
}

.detailImg {
	width: 45%;
	height: 100%;
	margin-right: 20px;
}

.detailInfo {
	width: 53%;
	display: block;
}

.detail_btn {
	width: 90%;
	height: 30px;
	border: 0;
	outline: 0;
	color: white;
	background-color: #6eceda;
	border-radius: 10px;
	box-shadow: 0 3px 0 #0e8c73;
}

.info_btn {
	width: 100%;
	height: 30px;
	border: 0;
	outline: 0;
	background-color: white;
}

.accomoInfo {
	width: 400px;
	height: 470px;
	display: block;
	margin-left: 50px;
}

.accomoInfo h2, h4 {
	text-align: left;
}

.accomoInfo h2 {
	font-weight: bold;
	font-size: 28px;
}

.accomoInfo h3 {
	text-align: left;
	display: flex;
	font-size: 23px;
}

.accomoInfo h3>p {
	background: #6eceda;
	border-radius: 10px;
	color: white;
	padding: 5px;
	font-size: 20px;
	margin-right: 10px;
}

.accomoInfo {
	text-align: left;
}

.ownerComment {
	background-color: rgba(0, 0, 0, 0.08);
	padding: 20px 20px 20px 20px;
}

.ownerComment p {
	text-align: left;
}

.selectType {
	width: 85%;
	height: 30px;
	display: flex;
}

.selectType>button {
	background: none;
	border-style: none;
	padding: 0 20px 0 20px;
	height: 50px;
}

.selectType>button:hover {
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

.popup strong {
	font-weight: bold;
	font-size: 17px;
	text-align: left;
}

.popup hr {
	background-color: black;
}

.popup li {
	font-size: 13px;
	text-align: left;
}

.popup b {
	color: red
}

.popup p {
	text-align: left;
	margin-bottom: 5px;
}

.check {
	margin-top: 10px;
	font-size: 15px;
	color: rgba(0, 0, 0, 0.6)
}

.check>div {
	width: 50%;
}

.date {
	text-align: right;
	margin-left: 50px;
}

.payAgree {
	background-color: #6eceda;
	color: white;
	border: 2px solid #6eceda;
}

popup>li {
	list-style: square;
}

.accordion {
	font-family: Arial, Helvetica, sans-serif;
	margin: 0 auto;
	font-size: 14px;
	border-radius: 10px;
	padding: 10px;
	background: #fff;
	text-align: left;
}

.accordion ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.accordion li {
	margin: 0;
	padding: 0;
}

.accordion [type=radio], .accordion [type=checkbox] {
	display: none;
}

.accordion label {
	display: block;
	font-size: 16px;
	line-height: 16px;
	cursor: pointer;
	-webkit-transition: all .2s ease-out;
	-moz-transition: all .2s ease-out;
	font-weight: normal;
}

.accordion ul li label:hover, .accordion [type=radio]:checked ~ label,
	.accordion [type=checkbox]:checked ~ label {
	/* background:#C02942; */
	color: #6eceda;
}

.accordion .content {
	margin-top: 5px;
	padding: 0 10px;
	overflow: hidden;
	background: rgb(250, 250, 250);
	border: 1px solid #fff;
	/* Make the border match the background so it fades in nicely */
	-webkit-transition: all .5s ease-out;
	-moz-transition: all .5s ease-out;
}

.accordion p {
	color: #333;
	margin: 10px 10px 0px 20px;
	text-align: left;
}

.accordion h3 {
	text-align: left;
	font-size: 20px;
	padding: 0;
	margin: 30px 10px 0 10px;
}

/* Vertical */
.vertical ul li {
	overflow: hidden;
	margin: 0 0 1px;
}

.vertical [type=radio]:checked ~ label, .vertical [type=checkbox]:checked 
	 ~ label {
	border-bottom: 0;
}

.vertical ul li .content {
	height: 0px;
	border-top: 0;
}

.vertical [type=radio]:checked ~ label ~ .content, .vertical [type=checkbox]:checked 
	 ~ label ~ .content {
	min-height: 800px;
}

.accordion .content2 {
	margin-top: 5px;
	padding: 0 10px;
	overflow: hidden;
	background: rgb(250, 250, 250);
	border: 1px solid #fff;
	/* Make the border match the background so it fades in nicely */
	-webkit-transition: all .5s ease-out;
	-moz-transition: all .5s ease-out;
}

.vertical ul li .content2 {
	height: 0px;
	border-top: 0;
}

.vertical [type=radio]:checked ~ label ~ .content2, .vertical [type=checkbox]:checked 
	 ~ label ~ .content2 {
	min-height: 50px;
}

.reviewWrap li {
	margin-top: 50px;
	/* margin-bottom: 13px; */
}

.reviewWrap div {
	text-align: left;
	margin-bottom: 13px;
}

.hostAnswer {
	background-color: rgba(0, 0, 0, 0.08);
	margin: 10px 10px 10px 10px;
	padding: 10px 10px 10px 10px;
}

.reviewStar {
	clear: both;
	width: 120px;
	height: 24px;
	background:
		url(${pageContext.servletContext.contextPath }/resources/guest/images/reviewStar.png)
		0 0 no-repeat;
	background-size: 120px auto;
	background-position: 0 -24px;
	text-align: right;
}

.reviewTitle {
	display: flex;
}

.like {
	width: 30px;
	height: 20px;
	margin-left: 13px;
	background:
		url(${pageContext.servletContext.contextPath }/resources/guest/images/like.png)
		0 0 no-repeat;
	background-size: 20px 20px;
}

.unlike {
	width: 30px;
	height: 20px;
	margin-left: 13px;
	background:
		url(${pageContext.servletContext.contextPath }/resources/guest/images/likeun.png)
		0 0 no-repeat;
	background-size: 20px 20px;
}

.topReview {
	border: 1px solid;
	width: 100px;
	background: #6eceda;
	color: white;
	border-radius: 5px;
}

.reviewScore h5 {
	margin-left: 13px;
}

.like {
	width: 30px;
	height: 20px;
	margin-left: 13px;
	background:
		url(${pageContext.servletContext.contextPath }/resources/guest/images/like.png)
		0 0 no-repeat;
	background-size: 20px 20px;
}

.unlike {
	width: 30px;
	height: 20px;
	margin-left: 13px;
	background:
		url(${pageContext.servletContext.contextPath }/resources/guest/images/likeun.png)
		0 0 no-repeat;
	background-size: 20px 20px;
}

.topReview {
	border: 1px solid;
	width: 100px;
	background: #6eceda;
	color: white;
	border-radius: 5px;
}

#btn4_content {
	display: none;
}

table.table2 {
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

.question-title {
	width: 500px;
}

.suksoName {
	display: flex;
}
</style>
</head>
<body>
	<!--header-->


	<div class="header">
		<div class="container">
			<!--logo-->
			<div class="logo">
				<h1>
					<a href="index.html">Bonggeuda</a>
				</h1>
			</div>
			<!--//logo-->
			<!-- 상단메뉴바 -->
			<div class="top-nav">
				<ul class="right-icons">
					<li><span ><a  href="${ pageContext.servletContext.contextPath }/user/list">사용자관리</a></span></li>
            <li onclick="location.href='${pageContext.servletContext.contextPath}/owner/list'"><a>업체관리</a></li>
            <li><a  href="${ pageContext.servletContext.contextPath }/user/booklist">예약현황</a></li>
            <li onclick="location.href='${pageContext.servletContext.contextPath}/sales/paylist'"><a>매출관리</a></li>
            <li><a  href="${ pageContext.servletContext.contextPath }/qna/list">문의&신고</a></li>
            <li><a  href="${ pageContext.servletContext.contextPath }/notice/list">공지&이벤트</a></li>
				</ul>
				<!-- //상단메뉴바 -->

			</div>


			<div class="clearfix"></div>


		</div>
		<div class="clearfix"></div>
	</div>

	<!--//-->
	<!-- 숙소상세정보 -->
	<center>

		<center>

			<div
				style="width: 1170px; margin-top: 30px; padding: 10px 35px 10px 35px;">
				<!-- 숙소사진, 이름 -->
				
				<c:choose>
					<c:when test="${ requestScope.sortCondition2 eq 'RM'}">
						<c:choose>
							<c:when test="${ requestScope.sortCondition3 eq 'room'}">
						
								<div class="content"><h2>객실 수정 정보 입니다.</h2></div>
							</c:when>
							<c:otherwise>


								<div
									style="width: 1100px; height: 500px; padding: 10px 10px 10px 0px; display: flex; flex-direction: row;">
									<!-- 숙소사진 -->
									<div
										style=" width : 600px; height: 470px; display: block;background: url(${pageContext.servletContext.contextPath }/${accomo.attachment.thumbnailPath }); background-size: 600px 470px;">

									</div>
									<!-- 숙소이름 -->
									<div class="accomoInfo">
										<div>
											<h2>${accomo.accomoName }</h2>
										</div>
										<br>
										<%--                     <c:choose>
							<c:when test="${accomo.reviewScore == '0.0'}">
							<div><h3>등록된 평점 없음</h3></div>
							
							</c:when>
							<c:otherwise>
							<div><h3><p>평점</p>${ accomo.reviewScore }점 / 5점</h3></div>
							</c:otherwise>
						</c:choose> --%>
										<br>
										<div>
											<h4>- 주소 : ${accomo.address }</h4>
										</div>
										<br>
										<div>
											<h4>- 오시는길 : ${accomo.path }</h4>
										</div>
										<br> <br>
										<div class="ownerComment">
											<h4 style="text-align: left;">
												<b>사장님 한마디</b>
											</h4>
											<br>
											<p>
												제주도 최고의 호텔!!<br>여기로오세요~
											</p>
										</div>
									</div>
								</div>


							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>


						<div
							style="width: 1100px; height: 500px; padding: 10px 10px 10px 0px; display: flex; flex-direction: row;">
							<!-- 숙소사진 -->
							<div
								style=" width : 600px; height: 470px; display: block;background: url(${pageContext.servletContext.contextPath }/${accomo.attachment.thumbnailPath }); background-size: 600px 470px;">

							</div>
							<!-- 숙소이름 -->
							<div class="accomoInfo">
								<div>
									<h2>${accomo.accomoName }</h2>
								</div>
								<br>
								<%--                     <c:choose>
							<c:when test="${accomo.reviewScore == '0.0'}">
							<div><h3>등록된 평점 없음</h3></div>
							
							</c:when>
							<c:otherwise>
							<div><h3><p>평점</p>${ accomo.reviewScore }점 / 5점</h3></div>
							</c:otherwise>
						</c:choose> --%>
								<br>
								<div>
									<h4>- 주소 : ${accomo.address }</h4>
								</div>
								<br>
								<div>
									<h4>- 오시는길 : ${accomo.path }</h4>
								</div>
								<br> <br>
								<div class="ownerComment">
									<h4 style="text-align: left;">
										<b>사장님 한마디</b>
									</h4>
									<br>
									<p>
										제주도 최고의 호텔!!<br>여기로오세요~
									</p>
								</div>
							</div>
						</div>


					</c:otherwise>
				</c:choose>
	
				

				<br>
				<!-- 안내/예약, 정보, 리뷰 -->
				<div style="display: flex; width: 100%;">


					<c:choose>
						<c:when test="${ requestScope.sortCondition2 eq 'RM'}">
						</c:when>

						<c:otherwise>
						
							<div class="selectType">
								<button class="tab_button" id="book" type="button" style="color: #6eceda; border-bottom: 3px solid #6eceda;" onclick="tabChange(this);">
									<span>숙소 정보</span>
								</button>
								<button class="tab_button" id="info" type="button" onclick="tabChange(this);">
									<span>숙소 상세 정보</span>
								</button>
							</div>

						</c:otherwise>
					</c:choose>
					
					
					

					<c:choose>
						<c:when test="${ requestScope.sortCondition1 eq 'Y'}">
							<button
								style="color: #6eceda; width: 250px; height: 60px; font-size: larger;">
								숙소 등록/수정 처리 완료</button>
						</c:when>

						<c:otherwise>
							<c:choose>
								<c:when test="${ requestScope.sortCondition2 eq 'EN'}">
									<button
										onclick="location.href='${pageContext.servletContext.contextPath}/owner/rminsert?requestNo=${requestScope.accomo.requestNo}';"
										style="color: #6eceda; width: 200px; height: 60px; font-size: larger;">
										숙소 등록 승인</button>
									<button onclick="location.href='#pop02';"
										style="color: #6eceda; width: 200px; font-size: larger; height: 60px;">
										숙소 등록 거절</button>

									<script>
								$("#insert").click(function() {
										location.href = "${pageContext.servletContext.contextPath}/owner/rminsert?requestNo=${requestScope.accomo.requestNo}";
								});
							</script>
								</c:when>
								<c:otherwise>
									<button id="update"
										style="color: #6eceda; width: 200px; height: 60px; font-size: larger;">
										업데이트 승인</button>
									<button onclick="location.href='#pop02';"
										style="color: #6eceda; width: 200px; font-size: larger; height: 60px;">
										업데이트 거절</button>

									<script>
								$("#update").click(function() {
										location.href = "${pageContext.servletContext.contextPath}/owner/rmupdate?accomoRequestNo=${requestScope.accomo.requestNo}&roomRequestNo=${requestScope.roomList[0].requestNo}";
								});
							</script>
								</c:otherwise>
							</c:choose>

						</c:otherwise>

					</c:choose>
					
					
				</div>
				
				
				<c:choose>
					<c:when test="${ requestScope.sortCondition2 eq 'RM'}">
						<c:choose>
							<c:when test="${ requestScope.sortCondition3 eq 'accomo'}">

								<ul>
									<div class="content">
										<h1>숙소 수정 정보</h1>
										<hr>
										<h3>주변정보</h3>
										<p>- ${ accomo.near }</p>
										<hr>
										<h3>공지사항</h3>
										<p>- 성수기 : ${accomo.peakStartDate } ~ ${accomo.peakEndDate }</p>
										<p>- ${accomo.rule }</p>
										<hr>
										<h3>기본정보</h3>
										<p>- 입실가능시간 : ${accomo.checkIn } | 퇴실 : ${accomo.checkOut }</p>
										<p>- 주차요금 : ${accomo.parking}</p>
										<hr>
										<h3>취소 및 환불 규정</h3>
										<p>- 숙박일 기준 10일전 : 100% 환불</p>
										<p>- 숙박일 기준 5일전 : 50% 환불</p>
										<p>- 숙박일 기준 1일전 ~ 당일 및 No-show : 환불불가</p>
										<p>- 취소, 환불 시 수수료가 발생할 수 있습니다.</p>
										<hr>
										<h3>확인사항 및 기타</h3>
										<p>- 최대 인원 초과시 입실이 불가합니다.</p>
										<p>- 보호자 동반없는 미성년자는 이용하실 수 없습니다.</p>
										<p>- 해당 이미지는 실제와 상이 할 수 있습니다.</p>
										<p>- 위의 정보는 펜션의 사정에 따라 변경될 수 있습니다.</p>
										<p>- 성수기 기간동안 일부 객실의 경우 요금변동이 있을 수 있습니다.</p>
										<hr>
										<h3>편의시설 및 서비스</h3>
										<p>- ${accomo.facility }p>
								</ul>
							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose>
					</c:when>

					<c:otherwise>

					</c:otherwise>
				</c:choose>



				<script>
			
					function tabChange(tc) {

						document.getElementById(tc.id).style.color = "#6eceda";
						document.getElementById(tc.id).style.borderBottom = "3px solid #6eceda";

						if (tc.id == "book") {
							document.getElementById("btn1_content").style.display = "block";
							document.getElementById("btn2_content").style.display = "none";
							document.getElementById("btn3_content").style.display = "none";
							document.getElementById("btn4_content").style.display = "none";
							document.getElementById("info").style.color = "black";
							document.getElementById("info").style.borderBottomStyle = "none";
							document.getElementById("review").style.color = "black";
							document.getElementById("review").style.borderBottomStyle = "none";
							document.getElementById("question").style.color = "black";
							document.getElementById("question").style.borderBottomStyle = "none";

						}
						if (tc.id == "info") {
							document.getElementById("btn1_content").style.display = "none";
							document.getElementById("btn2_content").style.display = "block";
							document.getElementById("btn3_content").style.display = "none";
							document.getElementById("btn4_content").style.display = "none";
							document.getElementById("book").style.color = "black";
							document.getElementById("book").style.borderBottomStyle = "none";
							document.getElementById("review").style.color = "black";
							document.getElementById("review").style.borderBottomStyle = "none";
							document.getElementById("question").style.color = "black";
							document.getElementById("question").style.borderBottomStyle = "none";

						}
						
					}
				</script>

				<hr>
				<div id="btn1_content">
				<center>
					<!-- 객실정보 -->
					<c:forEach var="roomList" items="${ roomList }" varStatus="st">
						<div class="detailList">
							<div class="detailImg"
								style="background: url(${pageContext.servletContext.contextPath }/${roomList.attachment.thumbnailPath }) no-repeat; background-size: 100%;"></div>
							<div class="detailInfo">
								<div>
									<h3>${roomList.roomName}</h3>
								</div>
								<br> <br>
								<div style="display: flex;">
									<div style="width: 40%;">가격</div>
									<div style="margin-left: 40px; width: 50%;">${roomList.roomFee }원
										/ 1박</div>
								</div>
								<hr>
								<div>
									<button class="info_btn" onclick="location.href='#pop01';">객실이용안내
										></button>
								</div>
								<hr>
								<div>
									<button class="detail_btn">숙소 등록/수정 페이지 입니다.</button>
								</div>
							</div>
						</div>
					</c:forEach>
					<!--// 객실정보 -->
				</center>
			</div>
			<!-- 숙소상세정보 -->
			<div id="btn2_content" class="accordion vertical" style="display: none;">
				<ul>
					<li><input type="checkbox" id="checkbox-1"
						name="checkbox-accordion" /> <label for="checkbox-1">기본정보</label>
						<div class="content">
							<h3>주변정보</h3>
							<p>- ${ accomo.near }</p>
							<h3>공지사항</h3>
							<p>- 성수기 : ${accomo.peakStartDate } ~ ${accomo.peakEndDate }</p>
							<p>- ${accomo.rule }</p>
							<h3>기본정보</h3>
							<p>- 입실가능시간 : ${accomo.checkIn } | 퇴실 : ${accomo.checkOut }</p>
							<p>- 주차요금 : ${accomo.parking}</p>
							<h3>취소 및 환불 규정</h3>
							<p>- 숙박일 기준 10일전 : 100% 환불</p>
							<p>- 숙박일 기준 5일전 : 50% 환불</p>
							<p>- 숙박일 기준 1일전 ~ 당일 및 No-show : 환불불가</p>
							<p>- 취소, 환불 시 수수료가 발생할 수 있습니다.</p>
							<h3>확인사항 및 기타</h3>
							<p>- 최대 인원 초과시 입실이 불가합니다.</p>
							<p>- 보호자 동반없는 미성년자는 이용하실 수 없습니다.</p>
							<p>- 해당 이미지는 실제와 상이 할 수 있습니다.</p>
							<p>- 위의 정보는 펜션의 사정에 따라 변경될 수 있습니다.</p>
							<p>- 성수기 기간동안 일부 객실의 경우 요금변동이 있을 수 있습니다.</p>
						</div></li>
					<hr>
					<li><input type="checkbox" id="checkbox-2"
						name="checkbox-accordion" /> <label for="checkbox-2">편의시설
							및 서비스</label>
						<div class="content2">
							<p>${accomo.facility }</p>
						</div></li>

				</ul>
			</div>
			<hr>
			<!-- //숙소상세정보 -->

		</center>
		<div id="pop01" class="overlay">
			<div class="popup">
				<a href="#none" class="close">&times;</a> <strong
					style="text-align: center;">객실 이용 안내</strong> <br>
				<section>
					<p>기본정보</p>
					<ul>
						<li>2인 기준 최대 2인</li>
						<li>객실 + 욕실 / 7.56평</li>
					</ul>
				</section>
				<hr>
				<section>
					<p>편의시설</p>
					<ul>
						<li>TV,개인금고,냉장고,미니바,욕실용품</li>
					</ul>
				</section>
			</div>
		</div>


		<div id="pop02" class="overlay">
			<div class="popup">

				<strong style="text-align: center;"><label
					value="${requestScope.accomo.requestNo }"></label>숙소 등록/수정 거절 사유</strong> <br>
				<section>
					<textarea style="width: 400px; height: 200px; border: 2px;"
						id="cancleReason"></textarea>
				</section>
				<button id="cancle" style="margin-top: 11px;">거절</button>

				<script>
						$("#cancle").click(function(){
							var cancleReason = document.getElementById("cancleReason").value;	
							location.href= "${pageContext.servletContext.contextPath }/owner/rmcancle?requestAccomoNo=${requestScope.accomo.requestNo}&requestRoomNo=${requestScope.roomList[0].requestNo}&cancleReason=" + cancleReason + "&sortCondition2=${requestScope.sortCondition2}";
						});
					</script>
			</div>
		</div>
		</div>
		<!--footer-->
		<!--//footer-->
</body>
</html>