<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.bonggeuda.sugbag.model.dto.AccomoInfoDTO" %>
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
<link href="${pageContext.servletContext.contextPath}/resources/guest/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.servletContext.contextPath }/resources/guest/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${pageContext.servletContext.contextPath }/resources/guest/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/guest/css/styles.css" rel="stylesheet">

<!--theme-style-->
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

.suksoList{
    width: 800px; height:250px;
    border-style: 0px;
	
}

.banner-buying h3 span {
    border-bottom: 7px solid #6eceda;
}

.accept{
	width: 100px; 
	height: 80; 
	padding: 8px 0 8px 0;
	background: #6eceda; 
	color: white; 
	border-style: none;
	box-shadow: 0 3px 0 #0e8c73;
	border-radius: 10px;
}

.reset{
	margin-right: 10px; 
	width: 100px; 
	height: 80; 
	padding: 8px 0 8px 0; 
	border-radius: 10px; 
	border-style: none;
	box-shadow: 0 3px 0 rgba(0, 0, 0, 0.4);
}
.infoThumb{
	width: 100%; 
	height: 50%; 
	margin-top: 120px; 
	padding: 20px 20px 5px 20px;
}
.infoThumb h2{
	text-align: left; 
	color: white;
	font-size: 30px;
}
.infoScore{
	color: orange; 
	width: 85%; 
	text-align: left;
	font-size: 20px;
}

.infoPrice{
	color:white; 
	width : 30%; 
	text-align:right;
	font-size:  20px; 
	font-weight: bold;
}
#chekList>label{
   margin-bottom:10px;
}
</style>
</head>
<body>
<!--header-->


<jsp:include page="../../common/guestheader.jsp"/>
<!--//-->
<div class=" banner-buying">
	<div class=" container">
	<h3 style="color: #fff; font-weight: 500; font-size: 3em;"><span style="border-bottom: 7px solid #6eceda;">숙소예약</span></h3> 
	<!---->
	
	<div class="clearfix"> </div>
		<!--initiate accordion-->
		
      		
	</div>
</div>
<!--//header-->
<div class="container" style="width: 1000; height: 800; display: flex;">
	

	<!-- Filter -->
	<div class="filter_wrap" style=" width: 300; height: 400; float: left; display: inline-block !important; top: 40px; margin: 0 32px 0 31px; padding-bottom: 10px; border: 1px solid rgba(0,0,0,0.08); border-radius: 4px; ">
		
		<hr>
		<section class="date_wrap" style="display: block; margin:10px 0 24px 0 ;  border-bottom: none; box-sizing: border-box;">
			<h3 style="display: block; font-size: 18px; color: rgba(0,0,0,0.87);">숙박일</h3>
			<br>
			<div style="margin-bottom: 10px;">
				입실<input type="date" style="margin-left: 10px;">
			</div>
			<div>
				퇴실<input type="date" style="margin-left: 10px;">
			</div>					
		</section>
		<hr>
		<h3 style="margin-bottom: 15px;">상세조건</h3>
		<form method="post" action = "${pageContext.servletContext.contextPath}/accomoSelect/search"> 
		
		<div>
			<button class="reset" type="button" onclick="location.href='${pageContext.servletContext.contextPath }/accomoSelect/list?value=${type }';">초기화</button>
			<button id="searchFacility"class="accept" >적용 </button>
		</div>
		<hr>
		<div>
			<h3 style="margin-bottom: 15px;">인원</h3>
			<div style = "display:flex; padding-left: 100px">
			<input type="number" min="1" name="personnel" style="width:50px;padding-left: 10px; margin-right: 10px;text-align: center;"></input><p>  명</p>
			</div>
			
		</div>
		<hr>
		<div  style="position :relative; width: 250px; ; display: block; padding: 0 0 0 15px;" >
			<ul id="chekList" align="left">
				<label><input type="checkbox" name="facility" value="세탁기" >  세탁기</label><br>
				<label><input type="checkbox" name="facility" value="건조기" >  건조기</label><br>
				<label><input type="checkbox" name="facility" value="객실내흡연" >  객실내흡연</label><br>
				<label><input type="checkbox" name="facility" value="와이파이" >  와이파이</label><br>
				<label><input type="checkbox" name="facility" value="욕실용품" >  욕실용품</label><br>
				<label><input type="checkbox" name="facility" value="에어컨" >  에어컨</label><br>
				<label><input type="checkbox" name="facility" value="냉장고" >  냉장고</label><br>
				<label><input type="checkbox" name="facility" value="반려견동반" >  반려견동반</label><br>
				<label><input type="checkbox" name="facility" value="조식포함" >  조식포함</label><br>
				<label><input type="checkbox" name="facility" value="개인사물함" >  개인사물함</label><br>
				<label><input type="checkbox" name="facility" value="TV" >  TV</label><br>
				<label><input type="checkbox" name="facility" value="무료주차" >  무료주차</label><br>
				<label><input type="checkbox" name="facility" value="인덕션" >  인덕션</label><br>
				<input type="hidden" name="type" value="${type}">
			</ul>
			<hr>
		</div>
		</form>
		<!-- 체크박스유지작업 -->
 		<script>
		    window.onload = function(){
		    	var condition = "${seacrh}";
		    	var facility = document.getElementsByName("facility");
		    	
		    	for(var i = 0; i <facility.length; i++ ){
                    if(condition.indexOf(facility[i].value) >= 0){
                    	facility[i].checked = true;
                    }		    		
		    	}
		    	var person = "${personnel}";
		    	
		    	if(person != null){
		    		document.getElementsByName("personnel")[0].value = person;
		    	}
		    	
		    }
		</script>
		</div>
		
		<div style="width: 900px; padding: 10px; display: flex; flex-direction: column;">

			<div class=list_wrap style="width:900px; height:30px; margin: 30px 0 0 10px; display: flex; margin-bottom: 50px;">
				<button "type="button" data-sort="HIT" onclick="doSort(this);" value="highScore">
					<span>높은평점 순</span>
				</button>
 				<button type="button" data-sort="DISTANCE" onclick="doSort(this);" value="lowScore">
					<span>낮은 평점 순</span>
				</button>
				<button type="button" data-sort="LOWPRICE" onclick="doSort(this);" value="lowPrice">
					<span>낮은 가격 순</span>
				</button>
				<button type="button" data-sort="HIGHPRICE" onclick="doSort(this);" value="highPrice">
					<span>높은 가격 순</span>
				</button>
			</div>
		   
			
			<script>
			    function doSort(p){
					var sortType="";
			    	var personnel = document.getElementsByName("personnel")[0].value;
					switch(p.value){
					    case "highScore" : sortType="highScore"; break;
					    case "lowScore" : sortType="lowScore"; break;
					    case "lowPrice" : sortType="lowPrice"; break;
					    case "highPrice" : sortType="highPrice"; break;
					}
					console.log(sortType)
			    	var arr = "";
			    	var search = document.getElementsByName("facility");
			    	
			    	for(var i = 0; i < search.length; i++){
			    		if(search[i].checked){
			    			if( i < search.length - 1 ){
 			    	    	arr+=search[i].value +","
			    			} else{
 			    	    	arr+=search[i].value;
			    			}
			    		}
			    	}
			    	
			    	console.log(arr);
			    	location.href="${pageContext.servletContext.contextPath}/accomo/sorting?sortType="+sortType+"&facility="+arr+"&type=${type}&personnel="+personnel;
			    }
			</script>
			<c:choose>
			    <c:when test="${empty accomoList}">
			        <div class="suksoList">
			            <p>일치하는 숙소 정보가 없습니다.</p>
			        </div>
			    </c:when>
		    <c:otherwise>
			<c:forEach var="accomo" items="${ requestScope.accomoList}" varStatus="st">
			<%-- <div class="suksoList" style="background: url(${pageContext.servletContext.contextPath }/resources/guest/images/sampleHouse.PNG) no-repeat; background-size: 800px 250px;" onclick="location.href='${pageContext.servletContext.contextPath }/accomoSelect/room?value='+'${accomo}';" > --%>
			<form name="selectRoom" method="get" onsubmit="return loginYN()"action="${pageContext.servletContext.contextPath }/accomoSelect/room">
            <div id="forRemove" class="remove">
			<button id="accomPicture"  type="submit"  name="no" value='${accomo.accomoNo}' class="suksoList" style="background: url(${pageContext.servletContext.contextPath }/${accomo.attachment.thumbnailPath }) no-repeat; background-size: 800px 250px;">
				<div class="infoThumb" >
					<h2 id="accomoName">${accomo.accomoName }</h2>
					<br>
					<div style="display: flex;">
					<c:choose>
					    <c:when test="${accomo.reviewScore == '0.0' }">
						<div class="infoScore">평점없음</div>
					    </c:when>
					    <c:otherwise>
						<div class="infoScore">평점 : ${accomo.reviewScore }</div>
					    </c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${accomo.minPrice == '0' }">
						<div class="infoPrice">등록된 최저가 없음</div>
						</c:when>
						<c:otherwise>
						<div id="minPrice" class="infoPrice">최저가 : ${accomo.minPrice}</div>
						</c:otherwise>
					</c:choose>

					</div>
				</div>
			<script>
			    function loginYN(){
			    	var a = "${sessionScope.member}";
			    	if(a ==""){
			    		var a = confirm("로그인이 필요한 페이지입니다.\n 로그인 하시겠습니까?");
			    		if(a){
			    			location.replace("${pageContext.servletContext.contextPath }/login/test") ;
			    			return false;
			    		} else {
			    			return false
			    		}
			    	} else {
			    		return true;
			    	}
			    }
			</script>
			</button>
			
			
			</div>
			</form>
			</c:forEach>
			</c:otherwise>
			</c:choose> 
		</div>
</div>

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