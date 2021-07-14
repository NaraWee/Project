<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        


        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    	
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">
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
	            		<form action="${ pageContext.servletContext.contextPath }/user/adopt/write" method="post" enctype="multipart/form-data" id="adoptWrite">
						<div style="width: 55%;  margin: 0px auto;  margin-bottom: 50px; ">
		                	<table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px; ">
		                	<div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left; ">동물의 정보는 어떻게 되나요?
		                	<hr style="border: 1px solid #000000; width: 1066px;height: 0px;left: 177.5px;">
		                	</div>
		                	
								<tr>
									<td>품종</td>
									<td>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dogOrcat" value="C" checked> 고양이</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dogOrcat" value="D" > 강아지</label>
										<input type="text" id="ownerName" name ="adoptBreed" style="width: 130px; background: #F1FAF8;"placeholder=" 예시) 닥스훈트" required >								
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
									<td><input type="text" name="adoptAge" id="ownerName" style="width: 80px; background: #F1FAF8;" required>  살</td>
								</tr>
								<tr>
									<td>몸무게</td>
									<td><input type="text" name="adoptWeight" id="ownerName" style="width: 80px; background: #F1FAF8;" required>  KG</td>
								</tr>
								<tr>
									<td>색상</td>
									<td><input type="text" name="adoptColor" id="ownerName" style="width: 180px; background: #F1FAF8;" required>  </td>
								</tr>
								<tr>
									<td>사는곳</td>
									<td><input type="text" name="address" id="ownerName" style="width: 180px; background: #F1FAF8;" placeholder="예시) 서울시 강남구" required></td>
								</tr>
								<tr>
									<td>소개</td>
									<td><textarea rows="3" name="adoptIntroduce" id="textArea" class="input-xlarge" style="background: #F1FAF8;"
									placeholder=" 예시) 소심하지만 사람을 좋아하는 아이입니다. 부디 이 아이의 평생 가족을 찾을 수 있게 해주세요. 현재 곰팡이 질환을 앓고 있어요 지금 치료중이지만 피부가 약해진 아이니 꼭 유의해주셔야해요 &#13;&#10;입양신청때 제가 더 필요로 하는 서류가 있어서 모두 충족시킬 수 있는 책임감 있으신 분을 찾고있어요!"
									required></textarea></td>
									
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
									<td><input type="text" name="adoptPhone" id="ownerPhone" style="width: 240px; background: #F1FAF8;" placeholder=" 예시) 010-1234-5678" required></td>
								</tr>
								<tr>
									<td>주의사항</td>
									<td><input type="text" name="adoptCaution" id="ownerPhone" style="width: 330px; background: #F1FAF8;" placeholder=" 예시) 밤 8시이후는 문자로 부탁드립니다." required></td>
								</tr>
									
						</table>
                    	<div style="margin: 0px auto; text-align: center; margin-bottom: 50px"><button type="submit" id="registAdopt">글올리기</button></div>
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
        
</html>