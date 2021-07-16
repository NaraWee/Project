<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <!-- include libraries(jQuery, bootstrap) -->


        <style>
            .menutable > div > img {
                margin-bottom: 20px;
				width: 20%;
                margin: 0px auto;
                display: block;
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

        </style>
        
      <script src="https://kit.fontawesome.com/4978ce16d0.js" crossorigin="anonymous"></script>
    	    <!-- summerNote -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    	<script>
          var $j3 = jQuery.noConflict();
          
          const message = '${ requestScope.message }';
		    if(message != null && message !== '') {
		    	alert(message);
		    }
		    
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


        <div class="culmn">
            <!--Home page style-->


            <!--Home Sections-->
            

            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left;">커뮤니티</div>
                <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/shareFree/list'" style="width:50px; cursor:pointer; float: right;">
            </section> <!--End off Home Sections-->
            
			<div class="blog-list" style="position: absolute; top:25%; width: 15%; margin-top: 45px;">
				<nav>
					<ul style="margin-left: 30%;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/select/freeboard/list" style="color: #979797;" >자유게시판</a></li>
							<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/shareFree/list" style="color: #45B99C; font-size: 1.3em; font-weight: 600;">무료나눔</a></li>
							<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/review" style="color: #979797;">용품리뷰</a></li>
					</ul>
				</nav>
			</div>

            <section id="menutable" class="menutable">
				<form action = "${ pageContext.servletContext.contextPath }/user/shareFree/updateBoard/${requestScope.shareDetail.boardCode}" method="post" enctype="multipart/form-data">
				<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 20px;">
					<table class="table" style="margin-bottom: 0px; border-collapse: separate;">
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px; width:25%;"><b>제목</b></td>
							<td style="border-radius: 0px 21px 0px 0px"><input type="text" name="boardTitle" value="${requestScope.shareDetail.boardTitle}" style="border: none; width: 80%"></td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; width:25%;"><b>작성자</b></td>
							<td><input type="text" name="userNickname" value="${requestScope.shareDetail.userNickname }" style="border: none; width: 80%" readonly></td>
						</tr>
					</table>
						<input type="hidden" id = "originFileName" name="pictureName"/>
						<input type="hidden" id = "saveName" name="pictureNewName"/>
						<input type="hidden" id = "filePath" name="pictureURL"/>
						<input type="hidden" id = "utilPath" name="pictureUtilPath"/>
  						<textarea id="summernote" name="boardContent">${ requestScope.shareDetail.boardContent }</textarea>
  						 <script>
  						$j3('#summernote').summernote({
					    	  placeholder: '무료 나눔 게시글을 작성해주세요',
					          tabsize: 2,
					          height: 500,
					          callbacks:{
					        	  onImageUpload : function(files,editor,welEditable){
					        		  for(var i=files.length-1; i>=0;i--){ 
					        		  uploadSummernoteImageFile(files[0],this);
					        		 } 
					        	  }
					        	}
					      });
					      
					      /* 이미지 파일 업로드 */
					      
					     function uploadSummernoteImageFile(file, editor) {
									var data = new FormData();
									data.append("file", file);
									$j3.ajax({
										data : data,
										type : "POST",
										url : "${pageContext.servletContext.contextPath}/user/shareFree/insert/shareImg",
										contentType : false,
										processData : false,
										enctype:'multipart/form-data',
										success : function(data) {
							            	//항상 업로드된 파일의 url이 있어야 한다.
											$j3(editor).summernote('insertImage', data.url);
							            	console.log(data.url);
							            	console.table(data);
							            	$j3('#originFileName').val(data.originFileName);
							            	$j3('#saveName').val(data.saveName);
							            	$j3('#filePath').val(data.filePath);
							            	$j3('#utilPath').val(data.utilPath);
							            	
										}
									});
								}
					    </script>
		        </div>
		         <div style="margin: 0px auto; margin-top: 10px; text-align: center;"><button type="submit">등록하기</button></div>
			</form>
            </section>
            
         

            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
     </body>
</html>