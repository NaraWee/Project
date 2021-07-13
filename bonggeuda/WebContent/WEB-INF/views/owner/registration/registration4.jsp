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
<!-- 객실추가 탭용 script -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
   #dialog label, #dialog input { display:block; }
   #dialog label { margin-top: 0.5em; }
   #dialog input, #dialog textarea { width: 95%; }
   #tabs { margin-top: 1em; }
   #tabs li .ui-icon-close { float: left; margin: 0.4em 0.2em 0 0; cursor: pointer; }
   #add_tab { cursor: pointer; }

   .btn{
      display: none;
      float: left;
      text-align: center;
      margin-right: 10px;
   }
</style>
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
<div class=" banner-regist"> <!--상단 메뉴바-->
   <div class=" container">
      <h3>숙소 등록</h3> 
      <!---->
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
               <span class="todo-desc on">사업자정보 확인</span>
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
               <span class="todo-desc">소개 작성</span>
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
               <span class="todo-desc">이용규칙 관리</span>
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
               <span class="btn-todo-on"><img src="${pageContext.servletContext.contextPath}/resources/owner/icon/step4.png" width="64px" height="64px"></span>
               <br><br>
               <span class="todo-desc">객실 등록</span>
            </li>
         </ul>
      </nav>
   </div>
</div>
<br>
<br><br>
   <div style="text-align: center; height: 50px; width: 700px; margin-left: 700px;">
      <button class="btn submit-btn" Id="room1" onclick="roomOneRegi()" style="display: block;"> 1번객실 </button>
      <button class="btn submit-btn" Id="room2" onclick="roomTwoRegi()" > 2번객실 </button>
      <button class="btn submit-btn" Id="room3" onclick="roomThreeRegi()" > 3번객실 </button>
      <button class="btn submit-btn" Id="room4" onclick="roomfourRegi()" > 4번객실 </button>
      <button class="btn submit-btn" Id="room5" onclick="roomfiveRegi()" > 5번객실 </button>
      <button class="btn submit-btn" onclick="roomPlus()" style="display: block; background-color: orange;"> 객실 추가 </button>
      <button class="btn submit-btn" onclick="roomRemove()" style="display: block; background-color: red;"> 객실 삭제 </button>
   </div>
   <script>
      var count = 0;
      
      function roomPlus(){
         if(document.getElementById("room4").style.display=="block"){
               document.getElementById("room5").style.display="block"
            }else if(document.getElementById("room3").style.display=="block"){
               document.getElementById("room4").style.display="block"

            }else if(document.getElementById("room2").style.display=="block"){
               document.getElementById("room3").style.display="block"

            }else if(document.getElementById("room1").style.display=="block"){
               document.getElementById("room2").style.display="block"
            }
      }
      function roomRemove(){
         
            if(document.getElementById("room5").style.display=="block"){
               document.getElementById("room5").style.display="none"
            	
           	   var el = document.getElementsByClassName('reset5');
               
               for(var i=0; i<el.length; i++){
               		el[i].value = '';
               }
               
            }else if(document.getElementById("room4").style.display=="block"){
               document.getElementById("room4").style.display="none"
           	   
               var el = document.getElementsByClassName('reset4');
               
               for(var i=0; i<el.length; i++){
               		el[i].value = '';
               }
               
            }else if(document.getElementById("room3").style.display=="block"){
               document.getElementById("room3").style.display="none"
           	   
               var el = document.getElementsByClassName('reset3');
               
               for(var i=0; i<el.length; i++){
               		el[i].value = '';
               }
               
            }else if(document.getElementById("room2").style.display=="block"){
               document.getElementById("room2").style.display="none"
               
           	   var el = document.getElementsByClassName('reset2');
               
               for(var i=0; i<el.length; i++){
               		el[i].value = '';
               }
           }
      }
      
      function roomOneRegi(){
         
         document.getElementById("registTb1").style.display="block";
         document.getElementById("registTb2").style.display="none";
         document.getElementById("registTb3").style.display="none";
         document.getElementById("registTb4").style.display="none";
         document.getElementById("registTb5").style.display="none";
      }
      function roomTwoRegi(){
            
         document.getElementById("registTb1").style.display="none";
         document.getElementById("registTb2").style.display="block";
         document.getElementById("registTb3").style.display="none";
         document.getElementById("registTb4").style.display="none";
         document.getElementById("registTb5").style.display="none";

      }
      function roomThreeRegi(){
            
         document.getElementById("registTb1").style.display="none";
         document.getElementById("registTb2").style.display="none";
         document.getElementById("registTb3").style.display="block";
         document.getElementById("registTb4").style.display="none";
         document.getElementById("registTb5").style.display="none";
      }
      function roomfourRegi(){
            
         document.getElementById("registTb1").style.display="none";
         document.getElementById("registTb2").style.display="none";
         document.getElementById("registTb3").style.display="none";
         document.getElementById("registTb4").style.display="block";
         document.getElementById("registTb5").style.display="none";
      }
      function roomfiveRegi(){
            
         document.getElementById("registTb1").style.display="none";
         document.getElementById("registTb2").style.display="none";
         document.getElementById("registTb3").style.display="none";
         document.getElementById("registTb4").style.display="none";
         document.getElementById("registTb5").style.display="block";
      }
   </script>
   
   <form action="${ pageContext.servletContext.contextPath }/registration4" method="post" encType="multipart/form-data">
   <table class="table table-bordered" id="registTb"> 
   <tbody id="registTb1">
      <tr class="tr1">
         <th>
            <p>
               객실정보
            </p>
         </th>
         <td>
            <div class="basic" >
                  <span class="form-title" style="display:inline-block";>객실명</span>
                  <input class="select-nomalsize" type="text" name="roomName" placeholder="이름을 입력하세요." value="" required="required">
               </div>
                  <span class="form-title" style="display:inline-block";>최대 정원</span>
                  <span>
                     <select name="roomMax" class="select-nomalsize" >
                        <option value="1">1명</option>
                        <option value="2" selected>2명</option>
                        <option value="3">3명</option>
                        <option value="4">4명</option>
                        <option value="5">5명</option>
                        <option value="6">6명</option>
                        <option value="7">7명</option>
                        <option value="8">8명</option>
                        <option value="9">9명</option>
                        <option value="10">10명</option>
                        <option value="11">11명</option>
                        <option value="12">12명</option>
                     </select>
                  </span>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               객실<br>
               이미지 정보
            </th>
            <td>
               <div class="basic">
                  <p class="description" style="margin-bottom: 3px;">* 객실의 전반적인 이미지를 업로드 해주시기 바랍니다.</p>
                  <p class="description" style="margin-bottom: 3px;">* 이미지 장소는 짧게 기입해주시기 바랍니다. 예시) 객실명, 침대, 화장실 등</p>
                  <p class="description text-normal">* 첫 이미지가 메인 이미지이며 드래그를 통해 순서 변경이 가능합니다.</p>
                  <span class="form-title" style="display:inline-block";>    </span>
                  <br>
					<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this,1)" required="required">
               </div>
            </td>   
         </tr>
         <tr>
            <th>
               객실 <br> 소개글
            </th>
            <td>
               <div class="form-layer">
                  <textarea class="form-control textarea-layer" rows="8" name="roomIntro" placeholder="객실 내 침대 구성과, 전용 욕실 여부 등 객실 소개/구성을 자세히 기재해 주세요." required="required"></textarea>
                  <div remain-traffic_info" class="maxText">(최대 1000자)</div>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               요금 설정
            </th>
            <td>
               <div class="basic">
                  <span class="form-title" style="display:inline-block";>정상가(비수기)</span>
                  <input class="select-nomalsize" type="number" name="roomFee"  value="" style="width: 150px;" min="0" step="1000" required="required">
                  <span class="form-title" style="display:inline-block";>원</span>
               </div>

               <div class="basic">
                  <span class="form-title" style="display:inline-block";>성수기</span>
                  <input class="select-nomalsize" type="number" name="peakFee"  value="" style="width: 150px;" min="0" step="1000">
                  <span class="form-title" style="display:inline-block"; >원</span>
               </div>
            </td>
         </tr>
         <tr>
            <br>
            <th colspan="2" style="background-color: white; ">
                  <button button class="submit-btn" type="submit" style="margin-top: 10px; margin-bottom: 10px;" onclick="roomRegiFinish()">숙소 등록 완료</button>
            </th>
         </tr>
      </tbody>
</table>
<br><br>
<table class="table table-bordered"  id="registTb" style=" margin-top: -70px;"> 
   <tbody id="registTb2" style="display: none; ">
      <tr class="tr1">
         <th>
            <p>
               객실정보
            </p>
         </th>
         <td>
            <div class="basic" >
                  <span class="form-title" style="display:inline-block";>객실명</span>
                  <input class="select-nomalsize reset2" type="text" name="roomName2" placeholder="이름을 입력하세요." value="">
               </div>
               <div class="basic">
                  <span class="form-title" style="display:inline-block";>최대정원</span>
                  <span>
                     <select name="roomMax2" class="select-nomalsize reset2">
                        <option value="1">1명</option>
                        <option value="2" selected>2명</option>
                        <option value="3">3명</option>
                        <option value="4">4명</option>
                        <option value="5">5명</option>
                        <option value="6">6명</option>
                        <option value="7">7명</option>
                        <option value="8">8명</option>
                        <option value="9">9명</option>
                        <option value="10">10명</option>
                        <option value="11">11명</option>
                        <option value="12">12명</option>
                     </select>
                  </span>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               객실<br>
               이미지 정보
            </th>
            <td>
               <div class="basic">
                  <p class="description" style="margin-bottom: 3px;">* 객실의 전반적인 이미지를 업로드 해주시기 바랍니다.</p>
                  <p class="description" style="margin-bottom: 3px;">* 이미지 장소는 짧게 기입해주시기 바랍니다. 예시) 객실명, 침대, 화장실 등</p>
                  <p class="description text-normal">* 첫 이미지가 메인 이미지이며 드래그를 통해 순서 변경이 가능합니다.</p>
                  <span class="form-title" style="display:inline-block";>    </span>
                  <br>
					<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this,2)">
               </div>
            </td>   
         </tr>
         <tr>
            <th>
               객실 <br> 소개글
            </th>
            <td>
               <div class="form-layer">
                  <textarea class="form-control textarea-layer reset2" rows="8" name="roomIntro2" placeholder="객실 내 침대 구성과, 전용 욕실 여부 등 객실 소개/구성을 자세히 기재해 주세요."></textarea>
                  <div class="maxText">(최대 1000자)</div>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               요금 설정
            </th>
            <td>
               <div class="basic">
                  <span class="form-title" style="display:inline-block";>정상가(비수기)</span>
                  <input class="select-nomalsize reset2" type="number" name="roomFee2"  value="" style="width: 150px;" min="0" step="1000">
                  <span class="form-title" style="display:inline-block"; >원</span>
               </div>

               <div class="basic">
                  <span class="form-title" style="display:inline-block";>성수기</span>
                  <input class="select-nomalsize reset2" type="number" name="peakFee2"  value="" style="width: 150px;" min="0" step="1000">
                  <span class="form-title" style="display:inline-block"; >원</span>
               </div>
            </td>
         </tr>
         <tr>
            <br>
            <th colspan="2" style="background-color: white; ">
                  <button button class="submit-btn" type="submit" style="margin-top: 10px; margin-bottom: 10px;" onclick="roomRegiFinish()">숙소 등록 완료</button>
            </th>
         </tr>
      </tbody>
</table>
<br><br>
<table class="table table-bordered" id="registTb" style=" margin-top: -70px;"> 
   <tbody id="registTb3" style="display: none; ">
      <tr class="tr1">
         <th style="width: 100px;">
            <p>
               객실정보
            </p>
         </th>
         <td>
            <div class="basic" >
                  <span class="form-title" style="display:inline-block";>객실명</span>
                  <input class="select-nomalsize reset3" type="text" name="roomName3" placeholder="이름을 입력하세요." value="">
               </div>
               <div class="basic">
                  <span class="form-title" style="display:inline-block";>최대 정원</span>
                  <span>
                     <select name="roomMax3" class="select-nomalsize reset3">
                        <option value="1">1명</option>
                        <option value="2" selected>2명</option>
                        <option value="3">3명</option>
                        <option value="4">4명</option>
                        <option value="5">5명</option>
                        <option value="6">6명</option>
                        <option value="7">7명</option>
                        <option value="8">8명</option>
                        <option value="9">9명</option>
                        <option value="10">10명</option>
                        <option value="11">11명</option>
                        <option value="12">12명</option>
                     </select>
                  </span>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               객실<br>
               이미지 정보
            </th>
            <td>
               <div class="basic">
                  <p class="description" style="margin-bottom: 3px;">* 객실의 전반적인 이미지를 업로드 해주시기 바랍니다.</p>
                  <p class="description" style="margin-bottom: 3px;">* 이미지 장소는 짧게 기입해주시기 바랍니다. 예시) 객실명, 침대, 화장실 등</p>
                  <p class="description text-normal">* 첫 이미지가 메인 이미지이며 드래그를 통해 순서 변경이 가능합니다.</p>
                  <span class="form-title" style="display:inline-block";>    </span>
                  <br>
					<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this,3)">
               </div>
            </td>   
         </tr>
         <tr>
            <th>
               객실 <br> 소개글

            </th>
            <td>
               <div class="form-layer">
                  <textarea class="form-control textarea-layer reset3" rows="8" name="roomIntro3" placeholder="객실 내 침대 구성과, 전용 욕실 여부 등 객실 소개/구성을 자세히 기재해 주세요."></textarea>
                  <div remain-traffic_info" class="maxText">(최대 1000자)</div>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               요금 설정
            </th>
            <td>
               <div class="basic">
                  <span class="form-title" style="display:inline-block";>정상가(비수기)</span>
                  <input class="select-nomalsize reset3" type="number" name="roomFee3"  value="" style="width: 150px;" min="0" step="1000">
                  <span class="form-title" style="display:inline-block"; >원</span>
               </div>

               <div class="basic">
                  <span class="form-title" style="display:inline-block";>성수기</span>
                  <input class="select-nomalsize reset3" type="number" name="peakFee3"  value="" style="width: 150px;" min="0" step="1000">
                  <span class="form-title" style="display:inline-block"; >원</span>
               </div>
            </td>
         </tr>
         <tr>
            <br>
            <th colspan="2" style="background-color: white; ">
                  <button button class="submit-btn" type="submit" style="margin-top: 10px; margin-bottom: 10px;" onclick="roomRegiFinish()">숙소 등록 완료</button>
             
            </th>
            
         </tr>
      </tbody>
</table>
<br><br>

<table class="table table-bordered" id="registTb"style=" margin-top: -65px;" > 
   <tbody id="registTb4" style="display: none;">
      <tr class="tr1">
         <th>
            <p>
               객실정보
            </p>
         </th>
         <td>
            <div class="basic" >
                  <span class="form-title" style="display:inline-block";>객실명</span>
                  <input class="select-nomalsize  reset4" type="text" name="roomName4" placeholder="이름을 입력하세요." value="">
               </div>
               <div class="basic">
                  <span class="form-title" style="display:inline-block";>최대 정원</span>
                  <span>
                     <select name="roomMax4" class="select-nomalsize reset4">
                        <option value="1">1명</option>
                        <option value="2" selected>2명</option>
                        <option value="3">3명</option>
                        <option value="4">4명</option>
                        <option value="5">5명</option>
                        <option value="6">6명</option>
                        <option value="7">7명</option>
                        <option value="8">8명</option>
                        <option value="9">9명</option>
                        <option value="10">10명</option>
                        <option value="11">11명</option>
                        <option value="12">12명</option>
                     </select>
                  </span>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               객실<br>
               이미지 정보
            </th>
            <td>
               <div class="basic">
                  <p class="description" style="margin-bottom: 3px;">* 객실의 전반적인 이미지를 업로드 해주시기 바랍니다.</p>
                  <p class="description" style="margin-bottom: 3px;">* 이미지 장소는 짧게 기입해주시기 바랍니다. 예시) 객실명, 침대, 화장실 등</p>
                  <p class="description text-normal">* 첫 이미지가 메인 이미지이며 드래그를 통해 순서 변경이 가능합니다.</p>
                  <span class="form-title" style="display:inline-block";>    </span>
                  <br>
					<input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this,4)">
               </div>
            </td>   
         </tr>
         <tr>
            <th>
               객실 <br> 소개글

            </th>
            <td>
               <div class="form-layer">
                  <textarea class="form-control textarea-layer reset4" rows="8" name="roomIntro4" placeholder="객실 내 침대 구성과, 전용 욕실 여부 등 객실 소개/구성을 자세히 기재해 주세요."></textarea>
                  <div remain-traffic_info" class="maxText">(최대 1000자)</div>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               요금 설정
            </th>
            <td>
               <div class="basic">
                  <span class="form-title" style="display:inline-block";>정상가(비수기)</span>
                  <input class="select-nomalsize reset4" type="number" name="roomFee4"  value="" style="width: 150px;" min="0" step="1000">
                  <span class="form-title" style="display:inline-block"; >원</span>
               </div>

               <div class="basic">
                  <span class="form-title" style="display:inline-block";>성수기</span>
                  <input class="select-nomalsize reset4" type="number" name="peakFee4"  value="" style="width: 150px;" min="0" step="1000">
                  <span class="form-title" style="display:inline-block"; >원</span>
               </div>
            </td>
         </tr>
         <tr>
            <br>
            <th colspan="2" style="background-color: white; ">
                  <button button class="submit-btn" type="submit" style="margin-top: 10px; margin-bottom: 10px;" onclick="roomRegiFinish()">숙소 등록 완료</button>
            </th>
         </tr>
      </tbody>
</table>
<br><br>

<table class="table table-bordered" id="registTb" style=" margin-top: -68px;" > 
   <tbody id="registTb5" style="display: none;">
      <tr class="tr1">
         <th>
            <p>
               객실정보
            </p>
         </th>
         <td>
            <div class="basic" >
                  <span class="form-title" style="display:inline-block";>객실명</span>
                  <input class="select-nomalsize reset5" type="text" name="roomName5" placeholder="이름을 입력하세요." value="">
               </div>
               <div class="basic">
                  <span class="form-title" style="display:inline-block";>최대 정원</span>
                  <span>
                     <select name="roomMax5" class="select-nomalsize reset5">
                        <option value="1">1명</option>
                        <option value="2" selected>2명</option>
                        <option value="3">3명</option>
                        <option value="4">4명</option>
                        <option value="5">5명</option>
                        <option value="6">6명</option>
                        <option value="7">7명</option>
                        <option value="8">8명</option>
                        <option value="9">9명</option>
                        <option value="10">10명</option>
                        <option value="11">11명</option>
                        <option value="12">12명</option>
                     </select>
                  </span>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               객실<br>
               이미지 정보
            </th>
            <td>
               <div class="basic">
                  <p class="description" style="margin-bottom: 3px;">* 객실의 전반적인 이미지를 업로드 해주시기 바랍니다.</p>
                  <p class="description" style="margin-bottom: 3px;">* 이미지 장소는 짧게 기입해주시기 바랍니다. 예시) 객실명, 침대, 화장실 등</p>
                  <p class="description text-normal">* 첫 이미지가 메인 이미지이며 드래그를 통해 순서 변경이 가능합니다.</p>
                  <span class="form-title" style="display:inline-block";>    </span>
                  <br>
					<input type="file" id="thumbnailImg5" name="thumbnailImg5" onchange="loadImg(this,5)">
               </div>
            </td>   
         </tr>
         <tr>
            <th>
               객실 <br> 소개글

            </th>
            <td>
               <div class="form-layer">
                  <textarea class="form-control textarea-layer reset5" rows="8" name="roomIntro5" placeholder="객실 내 침대 구성과, 전용 욕실 여부 등 객실 소개/구성을 자세히 기재해 주세요."></textarea>
                  <div remain-traffic_info" class="maxText">(최대 1000자)</div>
               </div>
            </td>
         </tr>
         <tr>
            <th>
               요금 설정
            </th>
            <td>
               <div class="basic">
                  <span class="form-title" style="display:inline-block";>정상가(비수기)</span>
                  <input class="select-nomalsize reset5" type="number" name="roomFee5"  value="" style="width: 150px;" min="0" step="1000">
                  <span class="form-title" style="display:inline-block"; >원</span>
               </div>

               <div class="basic">
                  <span class="form-title" style="display:inline-block";>성수기</span>
                  <input class="select-nomalsize reset5" type="number" name="peakFee5"  value="" style="width: 150px;" min="0" step="1000">
                  <span class="form-title" style="display:inline-block"; >원</span>
               </div>
            </td>
         </tr>
         <tr>
            <br>
            <th colspan="2" style="background-color: white; ">
                  <button button class="submit-btn" type="submit" style="margin-top: 10px; margin-bottom: 10px;" onclick="roomRegiFinish()">숙소 등록 완료</button>
            </th>
         </tr>
      </tbody>
</table>
<br><br><br>
<script>
   function roomRegiFinish(){
      alert("숙소 등록을 완료했습니다");
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
</form>
<!--//footer-->
</body>
</html>