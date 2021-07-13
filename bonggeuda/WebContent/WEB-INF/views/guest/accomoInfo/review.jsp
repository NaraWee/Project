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
<title>Real Home A Real Estate Category Flat Bootstarp Resposive Website Template | Buy :: w3layouts</title>
<link href="${pageContext.servletContext.contextPath}/resources/guest/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.servletContext.contextPath}/resources/guest/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${pageContext.servletContext.contextPath}/resources/guest/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath}/resources/guest/css/styles.css" rel="stylesheet">

<link href="${pageContext.servletContext.contextPath}/resources/guest/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<!-- <link href="css/common.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/product.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all" /> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
.reviewStar11{
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
    <!-- 숙소상세정보 -->
    <center>

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
                    <br><br>
                    <div class="ownerComment">
                        <h4 style="text-align: left;"><b>사장님 한마디</b></h4>
                        <br>
                        <p>제주도 최고의 호텔!!<br>여기로오세요~</p>
                    </div>
                </div>
            </div>

            <br><br>
            <!-- 안내/예약, 정보, 리뷰 -->
            
            <div style="width:600px; height:30px; display: flex; ">
                
				<button type="button" style="padding : 0 20px 0 20px" >
                    <span>리뷰목록</span>
				</button>
			</div>
            <hr>
            <!-- 리뷰 -->
			<div id="btn3_content">
                <div style="margin: 0 auto;">
                    <br>
    
                    <c:choose>
                        <c:when test="${ accomo.reviewScore eq 0}">
                            <h3>등록된 리뷰없음</h3>
                            <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar00" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore lt 1}">
                            <h3>1보다작아요</h3>
                            <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar05" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 1 &&  accomo.reviewScore lt 1.5}">
                            <h3>1점이상1.5미만이에요</h3>
                            <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar10" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 1.5 && accomo.reviewScore lt 2}">
                        <h3>1.5이상와2미만에요</h3>
                            <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar15" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 2 && accomo.reviewScore lt 2.5}">
                        <h3>2이상 2.5미만</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar20" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore le 2 && accomo.reviewScore lt 3}">
                        <h3>2.5이상점과 3점미만</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar25" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 3 && accomo.reviewScore lt 3.5}">
                        <h3>3과 3.5 사이이에요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar30" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 3.5 && accomo.reviewScore lt 4}">
                        <h3>3.5와 4 사이에요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar35" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br></c:when>
                        <c:when test="${ accomo.reviewScore ge 4 && accomo.reviewScore lt 4.5}">
                        <h3>4점이에요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar40" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore ge 4.5 && accomo.reviewScore lt 5}">
                        <h3>4와 5사이에요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar45" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                        <c:when test="${ accomo.reviewScore eq 5}">
                        <h3>5점이에요</h3>
                        <br>
                            <div style="display: flex; width: 180px; margin: 0 auto;">
                                <div class="reviewStar50" ></div>
                                <div  style="margin: 0 auto; width: 50px"><h3>${ accomo.reviewScore }</h3></div>
                            </div>
                            <br>
                        </c:when>
                    </c:choose>
                    
                    
                     <p>
                        전체리뷰  :  ${totalCount} 개
                    </p>
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
                                        <div class="like" id="like${best.reviewNo}"value = '${best.reviewNo}'  ></div>
                                        <div><p name="review${best.reviewNo}">${best.upCnt }</p></div>
                                        <div class="unlike" id="unlike${best.reviewNo}"value = '${best.reviewNo}' ></div>
                                        <div><p name="review${best.reviewNo}">${best.downCnt }</p></div>
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
                                        <div class="like" id="like${normalReview.reviewNo}"value = '${normalReview.reviewNo}'  ></div>
                                        <div><p name="review${normalReview.reviewNo}">${normalReview.upCnt }</p></div>
                                        <div class="unlike" id="unlike${normalReview.reviewNo}"value = '${normalReview.reviewNo}' ></div>
                                        <div><p name="review${normalReview.reviewNo}">${normalReview.downCnt }</p></div>
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
				<hr>
				<div class="clearfix"> </div>
	    <nav>
		<ul class="pagination">
		  <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
		  <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		  <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
	   </ul>
	   </nav>
                
                <!-- //리뷰내용 -->
            </div>
            
             <!-- //리뷰정보 -->
             <!-- 리뷰내용 -->
           
           
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