<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <style>
            a > img {
                width: 50%;
                height: 50%;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: 15px;
                margin-right: 15px;
                text-align: center;
            }
            td > input {
                width: 95%;
                border-radius: 10px;
                border: none;

            }
            tr, td {
            	font-size: 17px;
				text-align: left;
			}
            td > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
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
                margin-left: 20px;
            }
            td > input::placeholder {
                font-size: 15px;
                color:#a1a1a1;
            }
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
        
        <!-- summerNote -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    	<script>
    		var $j3 = jQuery.noConflict();
    	</script>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">

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
        
            <jsp:include page="../common/userHeader.jsp"/>

            <section id="account" class="account" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600;">광고 신청</div>
            </section>
            
			<section id="account" class="account" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="font-size: 20px; font-weight: 600; float: left; margin-left: 10px; margin-top:20px;">광고 내용 작성</div>
                <img src="/petpal_front/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/adsubmit2'" style="width:50px; float: right;">
                <br><br>
                <hr style="border-color: rgb(175, 175, 175);">
            </section>
            
            <section id="menutable" class="menutable">
            	<form action="${ pageContext.servletContext.contextPath }/user/insert/adsubmit3" method="post" enctype="multipart/form-data">
					<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 20px;">
						<table class="table" style="margin-bottom: 50px; border-collapse: separate; margin-bottom:0px;">
							<tr>
								<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px; width:25%;"><b>제목</b></td>
								<td style="border-radius: 0px 21px 0px 0px"><input type="text" name="adTitle" id="adTitle" placeholder="제목을 입력하세요" required></td>
							</tr>
							<tr>
								<td style="text-align: center; background-color: #F1FAF8; width:25%;"><b>기업 / 상호명</b></td>
								<td><c:out value="${ requestScope.insertAdSubmit2.companyName }"/></td>
							</tr>
						</table>
  						<textarea name="adContent" id="summernote"></textarea>
  						<script>
  						
  						$j3('#summernote').summernote({
  	                        placeholder: '광고 게시물을 작성해주세요',
  	                         tabsize: 2,
  	                         height: 500,
  	                         callbacks: {
  	                           onImageUpload: function(files, editor, welEditable) {
  	                                 sendFile(files[0], editor,welEditable);
  	                             }
  	                       }
  	                     });
  					
					      function sendFile(file, editor,welEditable) {
						  		var form_data = new FormData();
							        	form_data.append('file', file);
							        	$j3.ajax({
								          	data: form_data,
								          	type: "POST",
								          	url: '${pageContext.servletContext.contextPath}/user/insert/imgTest',
								          	cache: false,
								          	contentType: false,
								          	enctype: 'multipart/form-data',
								          	processData: false,
								          	success: function(data) {
								          		$j3('#summernote').summernote('editor.insertImage', data.url);
								          		console.log(data.url);
								          		$j3("#pictureName").val(data.pictureName);
								          		$j3("#pictureUrl").val(data.pictureUrl);
								          		$j3("#pictureNewName").val(data.pictureNewName);
								          		$j3("#pictureUtilPath").val(data.pictureUtilPath);
								          	}
						       		 });
						      }  
					    </script>
		        	</div>
                    <input type="hidden" value="${ requestScope.insertAdSubmit2.adTypeCode }" name="adTypeCode"/>
                    <input type="hidden" value="${ requestScope.insertAdSubmit2.adWeek }" name="adWeek"/>
                    <input type="hidden" value="${ requestScope.insertAdSubmit2.companyName }" name="companyName"/>
                    <input type="hidden" value="${ requestScope.insertAdSubmit2.leaderName }" name="leaderName"/>
                    <input type="hidden" value="${ requestScope.insertAdSubmit2.companyNumber }" name="companyNumber"/>
                    <input type="hidden" value="${ requestScope.insertAdSubmit2.companyLocation }" name="companyLocation"/>
                    <input type="hidden" value="${ requestScope.insertAdSubmit2.companyPhone }" name="companyPhone"/>
                    <input type="hidden" value="${ requestScope.insertAdSubmit2.companyEmail }" name="companyEmail"/>
                    <input type="hidden" value="${ requestScope.insertAdSubmit2.industry }" name="industry"/>
                    <input type="hidden" value="${ requestScope.insertAdSubmit2.industryDetail }" name="industryDetail"/>
                    <input type="hidden" value="${ requestScope.insertAdSubmit2.adTypeCode }" name="adTypeCode"/>
                    <input type="hidden" id="pictureName" name="pictureName"/>
                    <input type="hidden" id="pictureUrl" name="pictureUrl"/>
                    <input type="hidden" id="pictureNewName" name="pictureNewName"/>
                    <input type="hidden" id="pictureUtilPath" name="pictureUtilPath"/>
                    <div style="margin: 0px auto; margin-top: 10px; margin-bottom: 15px; text-align: center;"><button type="submit">등록하기</button></div>
            	</form>
            </section> 
            
            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
</html>