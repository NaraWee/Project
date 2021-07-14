<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
			td > button {
				background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 10px; 
                height: 15px;
                border-radius: 10px;
				margin-left: 5px;
			}
			div> button:hover {
				background-color: white; 
                color: red;
                border-color: white; 
                border: 1px solid;
			}
			div > button {
                background-color: red; 
                height: 40px;
                color: white;
                border: 1px solid red;  
                font-size: 18px; 
                font-weight: 600;
                border-radius: 10px;
                width: 150px;
                margin-right: 20px;
                margin-top:20px;
            }
            tr, td {
            	font-size: 17px;
				height: 70px;
				text-align: left;
			}
			td > input {
            	height: 40px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
            }
            td > textarea {
            	height: 100px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
                resize: vertical;
            }
            input::placeholder {
			  color: #A5A5A5;
			}
			textarea::placeholder {
			  color: #A5A5A5;
			}
        </style>
		<script type="text/javascript"src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
       	 <script>
          var $j3 = jQuery.noConflict();
       </script>
    </head>

	     <jsp:include page="../common/userHeader.jsp"/>

        <!-- Preloader -->
        <div id="loading">
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object" id="object_one"></div>
                    <div class="object" id="object_two"></div>
                    <div class="object" id="object_three"></div>
                    <div class="object" id="object_four"></div>
                </div>
            </div>
        </div><!--End off Preloader -->


        <div class="culmn" style="margin-left: -5%;">
            <!--Home page style-->

            <!--Home Sections-->
			
            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                
            </section> <!--End off Home Sections-->
            <section id="menutable" class="menutable">
            
                		<form action="${ pageContext.servletContext.contextPath }/user/missing/update/${requestScope.missingDetail.boardCode}" method="post" enctype="multipart/form-data" id="missingWrite">
						<div style="width: 55%;  margin: 0px auto;  margin-bottom: 50px; ">
		                	<table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px; ">
		                	<div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left; ">언제 어디서 잃어버렸나요?
		                		<hr style="border: 1px solid #000000; width: 1066px;height: 0px;left: 177.5px;">
		                	</div>
								<tr>
									<td>날짜</td>
									<td>
										<select class="form-select" id="year">
						                    <option value="2021" >2021</option>
							                <option value="2020">2020</option>
							                <option value="2019">2019</option>
						                 </select>	
						                 -
						                 <select class="form-select" size="1" style="overflow-y:scroll;" id="month">
						                    <option value="1" >01</option>
							                <option value="2">02</option>
							                <option value="3">03</option>
							                <option value="4">04</option>
							                <option value="5">05</option>
							                <option value="6">06</option>
							                <option value="7">07</option>
							                <option value="8">08</option>
							                <option value="9">09</option>
							                <option value="10">10</option>
							                <option value="11">11</option>
							                <option value="12">12</option>
						                 </select>
						                 -
						                 <select class="form-select" size="1" style="overflow-y:scroll;" id="date">
						                    <option value="1" >01</option>
							                <option value="2">02</option>
							                <option value="3">03</option>
							                <option value="4">04</option>
							                <option value="5">05</option>
							                <option value="6">06</option>
							                <option value="7">07</option>
							                <option value="8">08</option>
							                <option value="9">09</option>
							                <option value="10">10</option>
							                <option value="11">11</option>
							                <option value="12">12</option>
							                <option value="13">13</option>
							                <option value="14">14</option>
							                <option value="15">15</option>
							                <option value="16">16</option>
							                <option value="17">17</option>
							                <option value="18">18</option>
							                <option value="19">19</option>
							                <option value="20">20</option>
							                <option value="21">21</option>
							                <option value="22">22</option>
							                <option value="23">23</option>
							                <option value="24">24</option>
							                <option value="25">25</option>
							                <option value="26">26</option>
							                <option value="27">27</option>
							                <option value="28">28</option>
							                <option value="29">29</option>
							                <option value="30">30</option>
							                <option value="31">31</option>
						                 </select>						
									<input type="hidden" id="missingDate" name="missingDate"/>
									</td>
								</tr>
								<tr>
									<td>지역</td>
									<td>
									<input type="text" id="area" name="area" style="width: 240px; background: #F1FAF8;"  value="${requestScope.missingDetail.area }"> 
									    
									</td>
									
								</tr>
								<tr>
									<td>장소</td>
									<td><input type="text" id="place" name="place" style="width: 240px; background: #F1FAF8;"  value="${requestScope.missingDetail.place }" ></td>
								</tr>
								
								<tr>
									<td>연락처</td>
									<td><input type="text" id="phone" name="phone" style="width: 240px; background: #F1FAF8;" value="${requestScope.missingDetail.phone }" ></td>
								</tr>
								</table>
								<table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px;  ">
								<div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left; ">잃어버린 동물의 정보는 어떻게 되나요?
		                			                	<hr style="border: 1px solid #000000; width: 1066px;height: 0px;left: 177.5px;">
		                	</div>
								<tr>
									<td>품종</td>
									<td>
										<c:if test="${requestScope.missingDetail.dOc eq 'C' }">
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dOc" value="C" checked> 고양이</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dOc" value="D" > 강아지</label>
										</c:if>
										<c:if test="${requestScope.missingDetail.dOc eq 'D' }">
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dOc" value="C" checked> 고양이</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dOc" value="D" > 강아지</label>
										</c:if>
										<input type="text" id="breed" name="breed" style="width: 130px; background: #F1FAF8;" value="${requestScope.missingDetail.breed }"  >								
									</td>
								</tr>	
																<tr>
									<td>성별</td>
									<td>
										<c:if test="${requestScope.missingDetail.gender eq 'F' }">
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="gender" value="F" checked> 암컷</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="gender" value="M" > 수컷</label>													
										</c:if>
										<c:if test="${requestScope.missingDetail.gender eq 'M' }">
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="gender" value="F" > 암컷</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="gender" value="M" checked> 수컷</label>													
										</c:if>
									</td>
								</tr>
								<tr>
									<td>나이</td>
									<td><input type="text" name="age" id="age" style="width: 80px; background: #F1FAF8;" value="${requestScope.missingDetail.age }" >  살</td>
								</tr>
								<tr>
									<td>몸무게</td>
									<td><input type="text" id="weigth" name="weigth" style="width: 80px; background: #F1FAF8;" value="${requestScope.missingDetail.weigth }" >  KG</td>
								</tr>
								<tr>
									<td>색상</td>
									<td><input type="text" id="color" name="color" style="width: 150px; background: #F1FAF8;" value="${requestScope.missingDetail.color }" ></td>
								</tr>
								<tr>
									<td>특징</td>
									<td><textarea name="character" rows="3" id="character" class="input-xlarge" style="background: #F1FAF8;"
									>${requestScope.missingDetail.character }</textarea></td>
									
								</tr>
								<tr>
									<td>기타</td>
									<td><textarea name ="request" rows="3" id="request" class="input-xlarge" style="background: #F1FAF8;"
									><c:out value="${requestScope.missingDetail.request }"></c:out></textarea></td>
									
								</tr>
								<tr>
									<td>사진</td>
									<td>
										<div class="mb-3" style="border-color: none;">
										  <input type="file" name="picture" id="file" multiple="multiple" style="width: 300px; background: #F1FAF8;" onchange="fileLimit(this)" required>
										</div>
									</td>
								</tr>	
						</table>
                    	<div style="margin: 0px auto; text-align: center; margin-bottom: 50px"><button id="button" style=" width:250px;" type="submit"> 동물 신고 수정하기</button></div>
	                </div>
				</form>
            </section>
			
			<script>
       			function fileLimit(fl){
       				if(fl.files.length == 0){
       					alert("0개 이상의 파일이 입력 되었습니다. 최소 한장은 넣어주세요!");
       					fl.style.backgourndColor='red';
       					fl.value="";
       				};
       				if(fl.files.length > 3){
       					alert("2장 초과로 사진이 첨부되었습니다. 2장만 추가해주세요!");
       					fl.reset();
       				};
       			};
       	
       	$j3("#button").click(function(){
       		
       		var msYear = document.getElementById("year");
       		var msMonth = document.getElementById("month");
       		var msDate = document.getElementById("date");
       		
       		msYear = msYear.options[msYear.selectedIndex].value;
       		msMonth = msMonth.options[msMonth.selectedIndex].value;
       		msDate = msDate.options[msDate.selectedIndex].value;
       		var misDate = msYear+"-"+msMonth+"-"+msDate;
       		
       		console.log(misDate);
       		$j3("#missingDate").val(misDate);
       	
       	});
       		
            </script>
            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
   </body>
</html>