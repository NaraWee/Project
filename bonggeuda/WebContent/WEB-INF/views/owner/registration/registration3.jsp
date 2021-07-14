<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>봉그다 숙박숙박 :: 숙소 등록</title>
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/styles.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/responsiveslides.min.js"></script>
<!--달력-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
				<li><a href="/bonggeuda/owner/booking">예약관리</a></li>
				<li><a href="/bonggeuda/owner/notice">공지사항</a></li>
				<li><a href="/bonggeuda/owner/mypage">마이페이지</a></li>
				<li><a href="/bonggeuda/"><i class="glyphicon glyphicon-user"></i>Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!--header-->
<!--//-->	
<div class=" banner-regist"> <!--상단 메뉴바-->
	<div class=" container">
		<h3>숙소 등록</h3> 
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
					<span class="btn-todo-off"><img src="${pageContext.servletContext.contextPath}/resources/owner/icon/step1.png" width="64px" height="64px"></span>
					<br><br>
					<span class="todo-desc on" style="color: rgb(226, 226, 226);">사업자정보 확인</span>
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
					<span class="btn-todo-off"><img src="${pageContext.servletContext.contextPath}/resources/owner/icon/step2.png" width="64px" height="64px"></span>
					<br><br>
					<span class="todo-desc" style="color: rgb(226, 226, 226);">소개 작성</span>
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
					<span class="btn-todo-on"><img src="${pageContext.servletContext.contextPath}/resources/owner/icon/step3.png" width="64px" height="64px"></span>
					<br><br>
					<span class="todo-desc" style="color: #6eceda;">이용규칙 관리</span>
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
					<span class="btn-todo-off"><img src="${pageContext.servletContext.contextPath}/resources/owner/icon/step4.png" width="64px" height="64px"></span>
					<br><br>
					<span class="todo-desc" style="color: rgb(226, 226, 226);">객실 등록</span>
				</li>
			</ul>
		</nav>
	</div>
</div>
<form action="${ pageContext.servletContext.contextPath }/registration3" method="post">
<table id="registTb" class="table table-bordered">
	<thead>

	</thead>
		<tbody>
			<br><br><br>
			         <th>
            편의시설<br>서비스 시설안내 
         </th>
         <td>
            <label for="theme1" class="checkbox-inline icon-label" style="margin-right: 25px;">
               <input type="checkbox" id="theme1" name="facility"  value="세탁기">세탁기
            </label>
            <label for="theme2" class="checkbox-inline icon-label">
               <input type="checkbox" id="theme2" name="facility"  value="건조기">건조기
            </label>
            <label for="theme5" class="checkbox-inline icon-label">
               <input type="checkbox" id="theme5" name="facility"  value="객실내흡연">객실내흡연
            </label>
            <label for="theme6" class="checkbox-inline icon-label" >
               <input type="checkbox" id="theme6" name="facility"  value="와이파이" >와이파이
            </label>
            <br>
            <label for="theme7" class="checkbox-inline icon-label" >
               <input type="checkbox" id="theme7" name="facility"  value="욕실용품">욕실용품
            </label>
            <label for="theme8" class="checkbox-inline icon-label" >
               <input type="checkbox" id="theme8" name="facility"  value="에어컨">에어컨
            </label>
            <label for="theme9" class="checkbox-inline icon-label">
               <input type="checkbox" id="theme9" name="facility"  value="냉장고">냉장고
            </label>
            <label for="theme11" class="checkbox-inline icon-label">
               <input type="checkbox" id="theme11" name="facility"  value="반려견동반">반려견동반
            </label>
            <br>
            <label for="theme13" class="checkbox-inline icon-label">
               <input type="checkbox" id="theme13" name="facility"  value="조식포함">조식포함
            </label>
            <label for="theme18" class="checkbox-inline icon-label">
               <input type="checkbox" id="theme18" name="facility"  value="개인사물함">개인사물함
            </label>
            <label for="theme19" class="checkbox-inline icon-label" >
               <input type="checkbox" id="theme19" name="facility"  value="TV">TV
            </label>
            <label for="theme20" class="checkbox-inline icon-label" >
               <input type="checkbox" id="theme20" name="facility"  value="무료주차">무료주차
            </label>
         </td>
			<tr class="tr1">
				<th>
					이용시간
				</th>
				<td>
					<div class="warning">
						<p> 
							* 봉그다 숙박숙박은 24시간 체크인 예약 가능 사이트입니다.
							<br>
							* 자세한 요금 규정은 공지사항을 참고해 주세요.
							<a href="QnA.html">&nbsp[바로가기]</a>                        
						</p>
					</div>
					<div class="basic">
						<span class="form-title" style="display:inline-block";>체크인 시간</span>
						<span>
							<select name=checkIn class="select-time" required="required">
								<option value="00:00">0:00</option>
								<option value="1:00">1:00</option>
								<option value="2:00">2:00</option>
								<option value="3:00">3:00</option>
								<option value="4:00">4:00</option>
								<option value="5:00">5:00</option>
								<option value="6:00">6:00</option>
								<option value="7:00">7:00</option>
								<option value="8:00">8:00</option>
								<option value="9:00">9:00</option>
								<option value="10:00">10:00</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00" selected>15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
								<option value="21:00">21:00</option>
								<option value="22:00">22:00</option>
								<option value="23:00">23:00</option>
								<option value="24:00">24:00</option>
							</select>
						</span>
					</div>
					<div class="basic">
						<span class="form-title" style="display:inline-block";>체크아웃 시간</span>
						<span>
							<select name="checkOut" class="select-time">

								<option value="11:00" selected>11:00</option>

							</select>
						</span>
					</div>
				</td>
			</tr>
			<tr class="tr1">
				<th>
					성수기 설정
				</th>
				<td>
					<div class="basic">
						<span class="form-title" style="display:inline-block";>기간 선택</span>
						<label><input type="date" name="peakStart" required="required"></label>
						<span>~</span>
						<label><input type="date" name="peakEnd" required="required"></label>
					</div>
				</td>
			</tr>
			<tr>
				<br>
				<th colspan="2" style="background-color: white; ">
					<button name="accomoName" value="${ requestScope.accomoDTO.accomoName }" class="submit-btn" type="submit" style="margin-top: 10px; margin-bottom: 10px;">저장하기</button>
		            	<input type="hidden" name="ceoName" value="${ requestScope.accomoDTO.ceoName }">
		            	<input type="hidden" name="accomoType" value="${ requestScope.accomoDTO.accomoType }">
		            	<input type="hidden" name="registNo" value="${ requestScope.accomoDTO.registNo }">
		            	<input type="hidden" name="address" value="${ requestScope.accomoDTO.address }">
		            	<input type="hidden" name="adrDetail" value="${ requestScope.accomoDTO.adrDetail }">
		            	<input type="hidden" name="email" value="${ requestScope.accomoDTO.email }">
		            	<input type="hidden" name="homepage" value="${ requestScope.accomoDTO.homepage }">
		            	<input type="hidden" name="accomoPath" value="${ requestScope.accomoDTO.accomoPath }">
		            	<input type="hidden" name="near" value="${ requestScope.accomoDTO.near }">
		            	<input type="hidden" name="rule" value="${ requestScope.accomoDTO.rule }">
		            	<input type="hidden" name="parking" value="${ requestScope.accomoDTO.parking }">
		            	<input type="hidden" name="selectRequestNextVal" value="${ requestScope.selectRequestNextVal }">
					</form>
				</th>
			</tr>
		</tbody>
	</table>
<br><br><br>
<br><br><br>
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
</form>
<!--//footer-->
</body>
</html>