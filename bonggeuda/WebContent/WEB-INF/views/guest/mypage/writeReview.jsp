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
	td {
		font-size: 20px;
		color: #a3a3a3;
	}
	tr, td {
		width: 180px;
		height: 50px;
		text-align: left;
	}
	.review-btn {
		border-radius: 10px;
		margin-top: 5px;
		background: #6eceda;
		color: white;
		border-style: none;
		box-shadow: 0 3px 0 #0e8c73;
		height: 35px;
	}
	.review-btn:hover {
		background-color: #4aa9b6;
		box-shadow: 0 3px 0 #23a188;
	}
	.review-btn:active {
		box-shadow: none;
	}
	.review_rating{width: 100%; height:30px; overflow: hidden; margin: 0 auto; }
  	.rating {display: inline-block;}
  	.rating > input {display: none; margin: 0 5px;}
  	.rating > label:before {display: inline-block; content: "\f005"; background: url('${pageContext.servletContext.contextPath}/resources/guest/images/emptystar.png') 0 0 no-repeat; width:30px; height:30px; color:rgba(0,0,0,0); background-size: 30px;}
  	.rating > input[type="radio"] + label {color: #999; float: right; margin: 0 5px;}
 	.rating > input:checked ~ label{content: "\f005"; display: inline-block; background: url('${pageContext.servletContext.contextPath}/resources/guest/images/fullstar.png') 0 0 no-repeat; width:30px; height:30px; padding: 0; background-size: 30px; z-index: 5;}
  	.rating > input:checked ~ label:before {background:none;}
	.rating label:hover,
	.rating label:hover ~ label {
  		content: "\f005"; display: inline-block; background: url('${pageContext.servletContext.contextPath}/resources/guest/images/fullstar.png') 0 0 no-repeat; width:30px; height:30px; padding: 0; background-size: 30px; z-index: 5;
	}
	input, textarea{
		background-color:#FFFFFF;
		background-image:url("/SRC2/_image/inputBG.gif");
		background-position:left top;
		background-repeat:no-repeat;
		border:1px #AAAAAA solid;
		padding-top:5px;
		font-family:tahoma;
		font-size:12px;
		color:#777777;
	}
	div.guestReview div {
		text-align: left;
		float: left;
		width: 100%;
		margin-bottom: 10px;
	}
	
	.input-picture{
		text-align: left;
	}
	.input-picture h5{
		margin-bottom: 10px;
	}
	.input-picture input{
		width: 100%;
		padding-top: 2px;
	}
	.title-img-area {
		width:350px;
		height:200px;
		border:2px dashed darkgray;
		text-align:left;
		display:table-cell;
		vertical-align:middle;
	}
	.title-img-area:hover, .content-img-area1:hover, 
	.content-img-area2:hover, .content-img-area3:hover {
		cursor:pointer;
	}
	.content-img-area1, .content-img-area2, .content-img-area3 {
		width:150px;
		height:100px;
		border:2px solid rgba (0,0,0,0.8);
		text-align:left;
		display:table-cell;
		vertical-align:middle;
	}

	.thumbnail-insert-area {
		width:500px;
		height:450px;
		margin-left:auto;
		margin-right:auto;
	}
	.thumbnail-btn-area {
		width:150px;
		margin-left:auto;
		margin-right:auto;
	}

	.thumbnail-file-area input[type=file] {
		display:none;
	}
	</style>
<title>봉그다 숙박숙박</title>
<link href="${pageContext.servletContext.contextPath}/resources/guest/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.servletContext.contextPath}/resources/guest/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${pageContext.servletContext.contextPath}/resources/guest/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath}/resources/guest/css/styles.css" rel="stylesheet">
<!--//menu-->
<!--theme-style-->
<link href="${pageContext.servletContext.contextPath}/resources/guest/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
			<li class="blog-list" style=" font-size: 1.3em; font-weight: 600;"><a href="${ pageContext.servletContext.contextPath }/userbooklist/select" style="color: #6eceda;">예약 내역</a></li>
			<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/usermyinfo/select">내 정보 관리</a></li>
			<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/userreportlist/select">신고내역</a></li>
		</ul>
		</div>
		</nav>
	</div>


	<div class="mmiddle">
		<div class="tab">
			<span class="tab_btn active">리뷰 작성</span>
		</div>

	<form action="${ pageContext.servletContext.contextPath }/userwritereview/selectAndinsert" method="post" encType="multipart/form-data">
	<div id="cont_area" style="padding-top: 30px;"><!-- 본문 콘텐츠-->
		<div class="cont_inner" id="policy_page" style="min-height: 435px; text-align: left; float: left; width: 100%;">

			<div class="guestReview">
				<div class="reviewScore">
					<div class="review_rating">
						<fieldset name="rating" class="rating" style="border-style: none; padding: 0px;">
							<input type="radio" class="rating1" id="rating_1_star5" name="rating_1" value="5"><label for="rating_1_star5"></label>
							<input type="radio" class="rating1" id="rating_1_star4" name="rating_1" value="4"><label for="rating_1_star4"></label>
							<input type="radio" class="rating1" id="rating_1_star3" name="rating_1" value="3"><label for="rating_1_star3"></label>
							<input type="radio" class="rating1" id="rating_1_star2" name="rating_1" value="2"><label for="rating_1_star2"></label>
							<input type="radio" class="rating1" id="rating_1_star1" name="rating_1" value="1" checked><label for="rating_1_star1"></label>
						</fieldset>
					</div>
				</div>
				<div class="reviewTitle">
						리뷰 제목 : <input type="text" name="reviewTitle" style="width:250px;height:30px;">
				</div>
				<div>
				이용 객실 : <input style="width:250px;height:30px;" value=" ${ requestScope.reviewInfo.accomoName } ${ requestScope.reviewInfo.roomName }" disabled>
				</div>
				<div> 리뷰 내용 : 
				<textarea name="reviewContent" style="width:400px;height:150px; resize: none;" scrolling="yes"></textarea>
				</div>
				<!-- <div class="input_picture" style="display: flex;">
					<p style="margin-top: 8px;">사진 추가 : &nbsp</p>
					<input type="file" name="singlefile" multiple style="border-style: none;"><br>
				</div> -->
						<div>리뷰 사진</div>
				<div class="input-picture">
						<table>
						<td>
							<div class="content-img-area1" id="contentImgArea1">
								<img id="contentImg1" width="150" height="130">
							</div>
						</td>
<!-- 						<td>
							<div class="content-img-area2" id="contentImgArea2">
								<img id="contentImg2" width="150" height="120">
							</div>
						</td>
						<td>
							<div class="content-img-area3" id="contentImgArea3">
								<img id="contentImg3" width="150" height="120">
							</div>
						</td> -->
						</table>
						<div class="thumbnail-file-area">
					<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)">
<!-- 					<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this,2)">
					<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this,3)"> -->
				</div>
				</div>
			</div>
			<div>
				<input type="hidden" name="bookNo" value="${ requestScope.reviewInfo.bookNo }">
				<button class="review-btn" type="submit" onclick="notice()">리뷰작성</button>
			</div>
		</div>
	</div>
	</form>

	<script>
		function notice(){
			alert("리뷰가 등록 되었습니다.")
		}
		
		const $contentImgArea1 = document.getElementById("contentImgArea1");
		const $contentImgArea2 = document.getElementById("contentImgArea2");
		const $contentImgArea3 = document.getElementById("contentImgArea3");
				
		$contentImgArea1.onclick = function() {
			document.getElementById("thumbnailImg1").click();
		}
		
		$contentImgArea2.onclick = function() {
			document.getElementById("thumbnailImg2").click();
		}
		
		$contentImgArea3.onclick = function() {
			document.getElementById("thumbnailImg3").click();
		}
		
	
		function loadImg(value, num) {
			if (value.files && value.files[0]) {
				const reader = new FileReader();
				reader.onload = function(e) {
					switch(num){
					case 1:
						document.getElementById("contentImg1").src = e.target.result;
						break;
					case 2:
						document.getElementById("contentImg2").src = e.target.result;
						break;
					case 3:
						document.getElementById("contentImg3").src = e.target.result;
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>


	<div class="clearfix"> </div>
	<br><br><br>
</div>
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