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
    <style>
        div.tab, div.tab-content {
              margin-left: 25%;
              margin-right: 14%;
        }
        .table tbody tr th{
            background: white;
        }
        table.table tr th{
            text-align: center;
            padding: 5px;
            line-height: 2.5;
            font-weight: 500;
            width: auto;
        }
        th a:hover{
            color: #6eceda !important;
        }
        
		

     </style>
<title>Real Home A Real Estate Category Flat Bootstarp Resposive Website Template | Blog :: w3layouts</title>
<link href="${pageContext.servletContext.contextPath }/resources/admin/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.servletContext.contextPath }/resources/admin/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--menu-->
<script src="${pageContext.servletContext.contextPath }/resources/admin/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath }/resources/admin/css/styles.css" rel="stylesheet">
<!--//menu-->
<!--theme-style-->
<link href="${pageContext.servletContext.contextPath }/resources/admin/css/style.css" rel="stylesheet" type="text/css" media="all" />  
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body style="background: white;">
<!--header-->




<div class="header">
	<div class="container">
		<!--logo-->
			<div class="logo">
				<h1><a href="index.html">Bonggeuda</a></h1>
			</div>
		<!--//logo-->
		<div class="top-nav">
			<ul class="right-icons">
				<li><span ><a  href="${ pageContext.servletContext.contextPath }/user/list">사용자관리</a></span></li>
				<li onclick="location.href='${pageContext.servletContext.contextPath}/owner/list'"><a>업체관리</a></li>
				<li><a  href="${ pageContext.servletContext.contextPath }/user/booklist">예약현황</a></li>
				<li onclick="location.href='${pageContext.servletContext.contextPath}/sales/paylist'"><a>매출관리</a></li>
				<li><a  href="${ pageContext.servletContext.contextPath }/qna/list">문의&신고</a></li>
				<li><a  href="${ pageContext.servletContext.contextPath }/notice/list">공지&이벤트</a></li>
			</ul>

			
		<div class="clearfix"> </div>
			<!---pop-up-box---->
				   
			<link href="${pageContext.servletContext.contextPath }/resources/admin/css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
            <script src="${pageContext.servletContext.contextPath }/resources/admin/js/jquery.magnific-popup.js" type="text/javascript"></script>
			<!---//pop-up-box---->
				<div id="small-dialog" class="mfp-hide">
					    <!----- tabs-box ---->
				<div class="sap_tabs">	
				     <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
						  <ul class="resp-tabs-list">
						  	  <li class="resp-tab-item " aria-controls="tab_item-0" role="tab"><span>All Homes</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>For Sale</span></li>
							  <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>For Rent</span></li>
							  <div class="clearfix"></div>
						  </ul>				  	 
						  <div class="resp-tabs-container">
						  		<h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span class="resp-arrow"></span>All Homes</h2><div class="tab-1 resp-tab-content resp-tab-content-active" aria-labelledby="tab_item-0" style="display:block">
								 	<div class="facts">
									  	<div class="login">
											<input type="text" value="Search Address, Neighborhood, City or Zip" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search Address, Neighborhood, City or Zip';}">		
									 		<input type="submit" value="">
									 	</div>        
							        </div>
						  		</div>
							     <h2 class="resp-accordion" role="tab" aria-controls="tab_item-1"><span class="resp-arrow"></span>For Sale</h2><div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
									<div class="facts">									
										<div class="login">
											<input type="text" value="Search Address, Neighborhood, City or Zip" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search Address, Neighborhood, City or Zip';}">		
									 		<input type="submit" value="">
									 	</div> 
							        </div>	
								 </div>									
							      <h2 class="resp-accordion" role="tab" aria-controls="tab_item-2"><span class="resp-arrow"></span>For Rent</h2><div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
									 <div class="facts">
										<div class="login">
											<input type="text" value="Search Address, Neighborhood, City or Zip" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search Address, Neighborhood, City or Zip';}">		
									 		<input type="submit" value="">
									 	</div> 
							         </div>	
							    </div>
					      </div>
					 </div>
					 <script src="${pageContext.servletContext.contextPath }/resources/admin/js/easyResponsiveTabs.js" type="text/javascript"></script>
				    	<script type="text/javascript">
						    $(document).ready(function () {
						        $('#horizontalTab').easyResponsiveTabs({
						            type: 'default', //Types: default, vertical, accordion           
						            width: 'auto', //auto or any width like 600px
						            fit: true   // 100% fit in a container
						        });
						    });
			  			 </script>	
				</div>
				</div>
				 <script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});
																						
						});
				</script>
					
	
		</div>
		<div class="clearfix"> </div>
		</div>	
</div>
<!--//-->	

<!--//header-->
<!--blog-->
	<div class="blog">
		<div class="container">
		<form action="${ pageContext.servletContext.contextPath }/report/insert" method="get">
		
			<div class="blog-list">
				<nav>
				<div class="col-md-3 blog-sidebar">
                    <ul>
                        <li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/qna/list">문의 내역</a></li>
                    	<li class="blog-list"><a href="${ pageContext.servletContext.contextPath }/report/list" style="color: #6eceda; font-size: 1.3em; font-weight: 600;">신고 내역</a></li>
                    </ul>
				</nav>
               
				<div class="tab">
				   <span class="tab_btn active">신고답변</span> 
				</div>
                <table class="type09" border="1px">
                    <thead>
                        <tr>
                            <th scope="cols"></th>
                            <th scope="cols"></th>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                            <th scope="row">제목</th>
                            <td colspan="3" style="width: 580px;" >
                            <input name="title" value="${ reportInfo.title }" style="width: 580px; height: 20px; border: 0; resize: none; overflow:hidden;">
                            
                            </input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">신고받은 구분자</th>
                            <td>
                            <input name="writer" value="${ reportInfo.wirterType }" style="width: 225px; height: 20px; border: 0; resize: none; overflow:hidden;">
                            
                            </input>
                            </td>
                            <th scope="row" style="text-align: center;">신고당한사람번호</th>
                            <td>
                            <input name="reportedNo" value="${ reportInfo.reportedNo }" style="width: 225px; height: 20px; border: 0; resize: none; overflow:hidden;">
                            
                            </input>
                            </td>
                        </tr>
                        <tr>
                        	<td colspan="4" style=" padding-top: 20px; padding-bottom: 20px; ">
                        		<c:forEach var="thumnail" items="${ requestScope.reportThumnailInfo }">
								<c:if test="${ thumnail.thumnailPath ne null }">
								<img src="${ pageContext.servletContext.contextPath }/${ thumnail.thumnailPath }" style="width: 30%">
								</c:if>
								</c:forEach>
                        	</td>
                        </tr>
                    </tbody>
                </table>

                <br>
                <table class="type09" border="1px"  style="margin-left: 285px;">
                    <thead>
                        <tr>
                            <th scope="cols"></th>
                            <th scope="cols"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">작성일자</th>
                            <td>
                            <input style="width: 260px; height: 20px; border: 0; resize: none; overflow:hidden;"> 
                            
                            </input>
                            </td>
                            <th scope="row" style="text-align: center;">신고 번호</th>
                            <td>
                            <input name="reportNo"  value="${ reportNo }" style="width: 300px; height: 20px; border: 0; resize: none; overflow:hidden;">
                            
                            </input>
                            </td>
                    </tbody>
                </table>
                <input name="content" class="form-control textarea-layer" style="width: 700px; height: 120px; margin-left: 285px;"></input>
                <button class="submit-btn" type="submit" style="margin-top: 10px; margin-bottom: 10px;">처리완료</button>
            </div>
        </div>
        </form>
        <br><br><br><br><br>
        <br><br><br><br><br>
        <br><br><br><br><br>
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
				<h2><a href="index.html">BONGGEUDA</a></h2>
			</div>
			<div class="col-md-8 footer-class">
				<p >© 2015 BONGGEUDA. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
			</div>
		<div class="clearfix"> </div>
	 	</div>
	</div>
</div>
<!--//footer-->
</body>
</html>