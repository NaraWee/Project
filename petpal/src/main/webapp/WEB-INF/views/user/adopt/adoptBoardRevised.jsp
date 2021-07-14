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
			td > button:hover {
				background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid;
			}
			div > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                width: 130px;
                margin-right: 20px;
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
            	height: 130px;
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
			
			.box-file-input label{
			  display:inline-block;
			  background:#45B99C;
			  color:#fff;
			  padding:0px 15px;
			  line-height:35px;
			  cursor:pointer;
			}
        </style>
    	
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


        <div class="culmn">
            <!--Home page style-->


         
            <!--Home Sections-->
			                
			
            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                
            </section> <!--End off Home Sections-->
            <section id="menutable" class="menutable">
	            		<form action="${ pageContext.servletContext.contextPath }/user/adopt/update/${requestScope.adoptDetail.boardCode}" method="post" enctype="multipart/form-data" id="adoptWrite">
						<div style="width: 55%;  margin: 0px auto;  margin-bottom: 50px; ">
		                	<table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px; ">
		                	<div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left; ">동물의 정보는 어떻게 되나요?
		                	<hr style="border: 1px solid #000000; width: 1066px;height: 0px;left: 177.5px;">
		                	</div>
		                	
								<tr>
									<td>품종</td>
									<td>
										<c:if test="${requestScope.adoptDetail.dogOrcat eq 'C' }">
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dogOrcat" value="C" checked> 고양이</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dogOrcat" value="D" > 강아지</label>
										</c:if>
										<c:if test="${requestScope.adoptDetail.dogOrcat eq 'D' }">
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dogOrcat" value="C" > 고양이</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dogOrcat" value="D" checked> 강아지</label>
										</c:if>
										<input type="text" id="ownerName" name ="adoptBreed" style="width: 130px; background: #F1FAF8;" value = "${requestScope.adoptDetail.adoptBreed}" required >								
									</td>
								</tr>	
								<tr>
									<td>성별</td>
									<td>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="adoptGender" value="F" checked> 암컷</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="adoptGender" value="M" > 수컷</label>								
									</td>
								</tr>
								<tr>
									<td>나이</td>
									<td><input type="text" name="adoptAge" id="ownerName" style="width: 80px; background: #F1FAF8;" value = "${requestScope.adoptDetail.adoptAge}" required>  살</td>
								</tr>
								<tr>
									<td>몸무게</td>
									<td><input type="text" name="adoptWeight" id="ownerName" style="width: 80px; background: #F1FAF8;" value = "${requestScope.adoptDetail.adoptWeight}" required>  KG</td>
								</tr>
								<tr>
									<td>색상</td>
									<td><input type="text" name="adoptColor" id="ownerName" style="width: 80px; background: #F1FAF8;" value = "${requestScope.adoptDetail.adoptColor}" required>  </td>
								</tr>
								<tr>
									<td>사는곳</td>
									<td><input type="text" name="address" id="ownerName" style="width: 180px; background: #F1FAF8;" value = "${requestScope.adoptDetail.address}" required></td>
								</tr>
								<tr>
									<td>소개</td>
									<td><textarea rows="3" name="adoptIntroduce" id="textArea" class="input-xlarge" style="background: #F1FAF8;" required><c:out value = "${requestScope.adoptDetail.adoptIntroduce}"/></textarea></td>
									
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
								<table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px;  ">
								<div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left; ">보호자님 연락은 어떻게 할까요?
		                			                	<hr style="border: 1px solid #000000; width: 1066px;height: 0px;left: 177.5px;">
		                	</div>
								
								<tr>
									<td>연락처</td>
									<td><input type="text" name="adoptPhone" id="ownerPhone" style="width: 240px; background: #F1FAF8;" value = "${requestScope.adoptDetail.adoptPhone}" required></td>
								</tr>
								<tr>
									<td>주의사항</td>
									<td><input type="text" name="adoptCaution" id="ownerPhone" style="width: 330px; background: #F1FAF8;" value = "${requestScope.adoptDetail.adoptCaution}" required></td>
								</tr>
									
						</table>
                    	<div style="margin: 0px auto; text-align: center; margin-bottom: 50px"><button type="submit" id="registAdopt">입양글 수정하기</button></div>
	                	</div>
	                	</form>
            </section>

            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>
            
            <script>
       			function fileLimit(fl){
       				if(fl.files.length == 0){
       					alert("0개 이상의 파일이 입력 되었습니다. 최소 한장은 넣어주세요!");
       					fl.style.backgourndColor='red';
       					fl.value="";
       				};
       				if(fl.files.length > 4){
       					alert("4장 초과로 사진이 첨부되었습니다. 4장만 추가해주세요!");
       					fl.reset();
       				};
       			};
            	
            </script>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
       </body>
</html>