<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>봉그다 숙박숙박 :: 숙소 수정</title>
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/scripts.js"></script>
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/styles.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/resources/owner/css/style.css" rel="stylesheet" type="text/css" media="all" />	
<script src="${pageContext.servletContext.contextPath}/resources/owner/js/responsiveslides.min.js"></script>
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
				<li><a href="/bonggeuda/owner/bookingList">예약관리</a></li>
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
               <span class="btn-todo-on"><img src="${pageContext.servletContext.contextPath}/resources/owner/icon/step2.png" width="64px" height="64px"></span>
               <br><br>
               <span class="todo-desc" style="color: #6eceda;">소개 작성</span>
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
               <span class="btn-todo-off"><img src="${pageContext.servletContext.contextPath}/resources/owner/icon/step3.png" width="64px" height="64px"></span>
               <br><br>
               <span class="todo-desc" style="color: rgb(226, 226, 226);">이용규칙 관리</span>
            </li>

         </ul>
      </nav>
   </div>
</div>
<form action="${ pageContext.servletContext.contextPath }/owner/modifyAccomo2" method="post" encType="multipart/form-data">
<table id="registTb" class="table table-bordered">
   <thead>
   </thead>
      <tbody>
         <br><br>
         <tr class="tr1">
            <th>

               업체 이미지<br>(최대 5장) 
            </th>
            <td>
               <div class="basic">
                  <p class="description" style="margin-bottom: 3px;">* 객실 및 업체 전경, 로비, 주차장 등 업체의 전반적인 이미지를 업로드해주시기 바랍니다.</p>
                  <p class="description" style="margin-bottom: 3px;">* 이미지 교체를 원하시면 "변경"을 선택하시고 삭제를 원하시면 우측 "삭제"를 선택하시기 바랍니다.</p>
                  <p class="description"  style="margin-bottom: 3px;">* 이미지 장소는 짧게 기입해주시기 바랍니다. 예시) 전경, 로비, 주차장 등</p>
                  <p class="description text-normal">* 첫 이미지가 메인 이미지이며 드래그를 통해 순서 변경이 가능합니다.</p>
                  <span class="form-title" style="display:inline-block;">    </span>
                  <br>
					<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)" required="required">
               </div>
            </td>   
            
         </tr>
         
            <th>
               오시는길
            </th>
            <td>
               <div class="form-layer">
                  <textarea class="form-control textarea-layer" rows="9" name="accomoPath" placeholder="주요 버스터미널이나 기차역 혹은 공항 등에서 숙소까지 찾아가는 방법을 자세히 기재해 주세요."required="required">${ requestScope.rmAcoomoDTO.accomoPath }</textarea>
                  <div remain-traffic_info" class="maxText">(최대 1000자)</div>
               </div>
               
            </td>
         </tr>
         <tr>
            <th>
               주변 정보
            </th>
            <td>
               <div>
                  <p class="description" style="margin-bottom: 3px;">* 숙소 주변의 명소(교통, 관광, 쇼핑 등 )와 이동수단, 게스트하우스로부터 소요시간을 기입해주세요.</p>
               </div>
               <div class="form-layer">
                  <textarea class="form-control textarea-layer" rows="9" name="near" placeholder="숙소 주변의 명소를 홍보하여 주세요. 교통, 관광, 쇼핑 명소부터 게스트하우스까지의 소요시간을 작성해 주시면 게스트들이 예약할 때 큰 도움이 됩니다." required="required">${ requestScope.rmAcoomoDTO.near }</textarea>
                  <div remain-traffic_info" class="maxText">(최대 1000자)</div>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               숙소 이용<br>
               규칙
            </th>
            <td>
               <div class="form-layer">
                  <textarea class="form-control textarea-layer" rows="7" name="rule" placeholder="숙소 내 필수 이용규칙을 기재해주세요." required="required">${ requestScope.rmAcoomoDTO.rule }</textarea>
                  <div remain-traffic_info" class="maxText">(최대 500자)</div>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               주차장<br>
               정보
            </th>
            <td>
               <div class="form-layer">
                  <textarea class="form-control textarea-layer" rows="7" name="parking" placeholder="주차장 유/무료 정보 및 시간당 요금을 기재해주세요." required="required">${ requestScope.rmAcoomoDTO.parking }</textarea>
                  
                  <div remain-traffic_info" class="maxText">(최대 500자)</div>
               </div>
            </td>
         </tr>
         <tr>
            <br>
            <th colspan="2" style="background-color: white; ">
           		  <input type="hidden" name="rmAccomoNo" value="<c:out value="${ requestScope.rmAcoomoDTO.rmAccomoNo }"/>">
           		  <input type="hidden" name="accomoName" value="<c:out value="${ requestScope.rmAcoomoDTO.accomoName }"/>">
                  <input type="hidden" name="ceoName" value="<c:out value="${ requestScope.rmAcoomoDTO.ceoName }"/>">
            	  <input type="hidden" name="accomoType" value="<c:out value="${ requestScope.rmAcoomoDTO.accomoType }"/>">
            	  <input type="hidden" name="registNo" value="<c:out value="${ requestScope.rmAcoomoDTO.registNo }"/>">
            	  <input type="hidden" name="address" value="<c:out value="${ requestScope.rmAcoomoDTO.address }"/>">
            	  <input type="hidden" name="adrDetail" value="<c:out value="${ requestScope.rmAcoomoDTO.adrDetail }"/>">
            	  <input type="hidden" name="email" value="<c:out value="${ requestScope.rmAcoomoDTO.email }"/>">
            	  <input type="hidden" name="homepage" value="<c:out value="${ requestScope.rmAcoomoDTO.homepage }"/>">
            	
                  <button name="" value="" class="submit-btn" type="submit" style="margin-top: 10px; margin-bottom: 10px;">저장하기</button>

            </th>
         </tr>
      </tbody>
</table>
</form>
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
<!--//footer-->
</body>
</html>