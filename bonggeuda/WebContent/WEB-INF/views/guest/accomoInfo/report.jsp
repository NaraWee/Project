<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--A Design by W3layouts 
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<style>
		
	div.tab, div.tab-content {
    margin-left: 20%;
    margin-right: 20%;
	}

	div.tab_each, div.list_none {
	margin-left: 20%;
    margin-right: 20%;
	width: 100%;
	}

	.inquiry .tab_each{display:none}
	.inquiry .tab_each:first-child{display:block}
	.inquiry .tab{display:none}
	.tab_each{clear:both;border-top:1px solid rgba(0,0,0,0.08)}


	table.table2{
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
	margin-bottom: 20px;
    }
	table.table2 tr {
        width: 50px;
        padding: 10px;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
    }
    table.table2 td {
        padding: 10px;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
    }
	textarea {
		resize: none;
		width: 500px;
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

	.writeNameBox {
    height: 49px;
    width: auto;
    background-color: #6eceda;
    margin-left: 0px;
    height: 60px;
    border: 1px solid rgb(192, 192, 192);
	}

	.titleInput {
    width: 550px;
    margin-top: 15px;
    border-radius: 5px;
	}

	.wirteContent {
    margin-left: 10px;
    width: 760px;
    margin-top: 25px;
}

.submit-btn {
    border-radius: 10px;
    margin-top: 5px;
    background: #6eceda;
    color: white;
    border-style: none;
    box-shadow: 0 3px 0 #0e8c73;
    height: 35px;
    margin: auto;
}
.input-picture{
	text-align: left;
	padding : 20px
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
	text-align:center;
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
	text-align:center;
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
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>봉그다숙박</title>
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.servletContext.contextPath }/resources/guest/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${pageContext.servletContext.contextPath }/resources/guest/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/styles.css" rel="stylesheet">
<!--//menu-->
<!--theme-style-->
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/style.css" rel="stylesheet" type="text/css" media="all" />	
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
<!--//-->	
<div class=" banner-buying">
	<div class=" container">
	<h3><span>신고하기</span></h3> 

	<div class="clearfix"> </div>      		
	</div>
</div>
<!--//header-->
<!--blog-->
<div class="blog" style="padding-bottom: 20px;">
<div class="container">
	<h3></h3>



<div id="content" class="sub_wrap more_wrap">
	<form method="post" action="${ pageContext.servletContext.contextPath }/book/report" encType="multipart/form-data">
	
	<div class="align_rt">
		<!-- Tab -->
		<div class="tab">

			<span class="tab_btn active" data-toggle="tab" href="#home" >신고 내용 작성</span>

		</div>
		<div id="content" class="sub_wrap more_wrap">
			<div class="align_rt">
				<!-- Tab -->
				<br>
				<!-- 신고내용작성 -->
				<div class="list_none" style="display: block;  width: 780px; border: 1px solid lightgray;">
					<div class="writeNameBox">
						<div class="writeNameBoxContent">
							<p style="text-align: center; font-weight: bold;">제목 <input type="text" name="title" class="titleInput" placeholder="제목을 입력하세요." required> </p>
							
						</div>
					</div>
					<textarea name="body"class="wirteContent" style="border-radius: 5px;"  rows="22" name="" placeholder="신고내용을 적어주세요." required="required"></textarea>
					<div class="input-picture">
						<h5>이미지 첨부하기<h5>
						<table>
						<td>
							<div class="content-img-area1" id="contentImgArea1">
								<img id="contentImg1" width="150" height="120">
							</div>
						</td>
						<td>
							<div class="content-img-area2" id="contentImgArea2">
								<img id="contentImg2" width="150" height="120">
							</div>
						</td>
						<td>
							<div class="content-img-area3" id="contentImgArea3">
								<img id="contentImg3" width="150" height="120">
							</div>
						</td>
						</table>
						<div class="thumbnail-file-area">
					<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)">
					<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this,2)">
					<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this,3)">
				</div>
						
					</div>
				</div>
				<br>
				<div class="list_none" style="display:block; text-align: center; width: 780px;">
				    <input type="hidden" name="accomoNo" value="${no}">
					<button class="submit-btn" onclick="location.href='${pageContext.servletContext.contextPath }/accomoSelect/room?no=${no}';">작성취소</button>
					<button class="submit-btn" type="submit" onclick="location.href='${pageContext.servletContext.contextPath }/accomoSelect/room?no=${no}';" >작성 완료</button>
				</div>
			</div>
			<script>
				function notice(){
					alert("신고가 등록 되었습니다.")
				}
			</script>
			<script>
			
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
		</div>
	</div>

	<script>
		let targetLink = document.querySelectorAll('.tab span');
		for(var i = 0; i < targetLink.length; i++) {
			targetLink[i].addEventListener('click', function(e){
        		e.preventDefault();
				for(var x = 0; x < targetLink.length; x++){
            		targetLink[x].classList.remove('active');
            		e.target.classList.add('active');
        		}
			}
		)};
	</script>
</form>
</div>
</div>


	<div class="clearfix" style="margin-bottom: 100px;"> </div>
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