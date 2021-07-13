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
<title>봉그다 숙박숙박 :: 숙소 수정</title>
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

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
</head>
<body>
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
<div class="clearfix"> </div>
</div>	
</div>
<!--//-->	
<div class=" banner-regist"> <!--상단 메뉴바-->
	<div class=" container">
		<h3>숙소 수정</h3> 
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

<!--//header-->
<!--등록 단계 버튼-->
<div class="menu-step">
	<div class="todo-layer">
		<nav>
			<ul class="stepbox" id="ulStep">
				<li>
				<a >                        
					<span class="btn-todo-on"><img src="${pageContext.servletContext.contextPath}/resources/owner/icon/step1.png" width="64px" height="64px"></span>
					<br><br>
					<span class="todo-desc on">사업자정보 확인</span>
				</a>                    
				</li>
				<li class="prog">
					<span class="do">&nbsp;</span>
					<span>&nbsp;</span>
					<span class="do">&nbsp;</span>
					<span>&nbsp;</span>
					<span class="do">&nbsp;</span>
					<span>&nbsp;</span>
					<span class="do">&nbsp;</span>
					<span>&nbsp;</span>
					<span class="do">&nbsp;</span>
				</li>
				<li>
				<a >                        
					<span class="btn-todo-off"><img src="${pageContext.servletContext.contextPath}/resources/owner/icon/step2.png" width="64px" height="64px"></span>
					<br><br>
					<span class="todo-desc">소개 작성</span>
				</a>                    
				</li>
				<li class="prog">
					<span class="do">&nbsp;</span>
					<span>&nbsp;</span>
					<span class="do">&nbsp;</span>
					<span>&nbsp;</span>
					<span class="do">&nbsp;</span>
					<span>&nbsp;</span>
					<span class="do">&nbsp;</span>
					<span>&nbsp;</span>
					<span class="do">&nbsp;</span>
				</li>
				<li>
				<a >                        
					<span class="btn-todo-off"><img src="${pageContext.servletContext.contextPath}/resources/owner/icon/step3.png" width="64px" height="64px"></span>
					<br><br>
					<span class="todo-desc">이용규칙 관리</span>
				</a>                    
				</li>

			</ul>
		</nav>
	</div>
</div>
<form action="/bonggeuda/owner/modifyAccomo1" method="post">
<table id="registTb" class="table table-bordered">
	<thead>
	</thead>
		<tbody>
			<tr class="tr1">
				<th>
					<p class="thName">
						매출 정산
						<br>
						계좌 정보
					</p>
				</th>
				<td>
					<p class="description">
					<b>정산받을 계좌의 정보(은행, 계좌번호, 예금주)</b>를 봉그다숙박 관리자에게 메일로 보내주세요.<br>
					관리자 메일 : bonggeuda@subak.com	
					</p>
				</td>
			</tr>
			<tr class="tr1">
				<th>
					<p class="thName">
						사업자 <br>
						등록 정보
					</p>
				</th>
				<td>
			
					<div class="form-layer">
						<span class="form-title" style="display:inline-block";>상호명<br>(법인명)</span>
						<input type="text" class="select-nomalsize" name="accomoName" placeholder="사업자 등록증상 상호명" value="<c:out value="${ requestScope.rmAccomoInfo.accomoName }"/>" required="required">
					</div>
					<p class="description">* 게스트하우스 이름은 별도로 기입이 가능하오니 필히 사업자 상호, 등록번호를 입력해주시기 바랍니다.
					</p>
					<div class="form-layer">
						<span class="form-title" style="display:inline-block";>등록증상<br>대표명</span>
						<input type="text" class="select-nomalsize" name="ceoName" placeholder="대표자 명을 입력하세요" value="<c:out value="${ requestScope.rmAccomoInfo.ceoName }"/>" required="required">
					</div>

					<div class="form-layer">
						<span class="form-title" style="display:inline-block";>업종</span>
					<c:choose>
					<c:when test="${ requestScope.rmAccomoInfo.accomoType  eq  '펜션' }">
						<label class="checkbox-inline icon-label"><input type="radio" value="모텔" name="accomoType" checked>펜션</label>
						<label class="checkbox-inline icon-label"><input type="radio" value="호텔" name="accomoType" >호텔</label>
						<label class="checkbox-inline icon-label"><input type="radio" value="게스트하우스" name="accomoType">게스트하우스</label>
					</c:when>
					<c:when test="${ requestScope.rmAccomoInfo.accomoType  eq '호텔' }">
						<label class="checkbox-inline icon-label"><input type="radio" value="모텔" name="accomoType" >펜션</label>
						<label class="checkbox-inline icon-label"><input type="radio" value="호텔" name="accomoType" checked>호텔</label>
						<label class="checkbox-inline icon-label"><input type="radio" value="게스트하우스" name="accomoType">게스트하우스</label>
					</c:when>
					<c:when test="${ requestScope.rmAccomoInfo.accomoType  eq  '게스트하우스' }">
						<label class="checkbox-inline icon-label"><input type="radio" value="모텔" name="accomoType" >펜션</label>
						<label class="checkbox-inline icon-label"><input type="radio" value="호텔" name="accomoType" >호텔</label>
						<label class="checkbox-inline icon-label"><input type="radio" value="게스트하우스" name="accomoType"checked>게스트하우스</label>
					</c:when>
					</c:choose>

					</div>
					<div class="form-layer">
						<span class="form-title" style="display:inline-block";>사업자<br> 등록번호</span>
						<input type="text" class="select-nomalsize" name="registNo" placeholder="숫자만 입력하세요" value="<c:out value="${ requestScope.rmAccomoInfo.registNo }"/>" required="required">
					</div>
					<div class="form-layer">
						<span class="form-title" style="display:inline-block";>업체 주소</span>
						<input type="text" class="select-nomalsize"  style="margin-bottom: 8px;"  name="address" placeholder="사업자 등록증상 주소를 입력하세요" value="<c:out value="${ requestScope.rmAccomoInfo.address }"/>" required="required">
						<button class="submit-btn" type="button" style="margin-left: 10px;" onclick="openZipSearch()"  >주소 검색</button>
						<br>
						<input type="text" style="margin-left: 125px; margin-top: 0px;" class="select-nomalsize" name="adrDetail" placeholder="나머지 주소를 입력하세요." value="" >
					</div>
					<div class="form-layer">
						<span class="form-title" style="display:inline-block";>세금계산서<br> 이메일</span>
						<input type="text" class="select-nomalsize" name="email" placeholder="이메일을 입력하세요" value="<c:out value="${ requestScope.rmAccomoInfo.email }"/>" required="required">
					</div>

				</td>
			</tr>
			<tr>
				<th>
					<p class="thName">
						호스트 <br>
						홈페이지<br>
						(선택정보)
					</p>
					<td>
						<div class="form-layer">
							<span class="form-title" style="display:inline-block";>홈페이지</span>
							<input type="text" class="select-nomalsize" name="homepage" placeholder="홈페이지 주소" value="<c:out value="${ requestScope.rmAccomoInfo.homepage }"/>">
						</div>

					</td>
					
				</th>
			</tr>
			<tr>
				<br>
				<th colspan="2" style="background-color: white; ">



				        <input type="hidden" name="accomoNo" value="<c:out value="${ rmAccomoInfo.accomoNo }"/>">
						<button class="submit-btn" type="submit" style="margin-top: 10px; margin-bottom: 10px;">수정하기</button>

					</form>

				</th>
				
			</tr>

		</tbody>
		<br><br>
</table>
<!-- <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(daumPostCode) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script> -->

<script>
function openZipSearch() {
	new daum.Postcode({
		oncomplete: function(data) {
			/* $('[name=zip]').val(data.zonecode); //우편번호 (5자리) */
			$('[name=address]').val(data.address);
			$('[name=adrDetail]').val(data.buildingName);
		}
	}).open();
}
</script>

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