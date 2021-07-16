<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .menutable > div > img, img {
                margin-bottom: 20px;
				width: 20%;
                margin: 0px auto;
                display: block;
            }
            .note-toolbar {
            	background-color: #F1FAF8 !important;
            }
            .note-frame {
            	border-radius: 0px 0px 20px 20px !important;
            }
            td > input::placeholder {
                font-size: 15px;
                color:#a1a1a1;
            }
            .note-modal-content {
            	height: 400px;
            }
            .table {
            	margin-bottom: 1px !important;
            }
            .reviewWrite {
            	background-color: #19A985; 
                color: white;
                border-color: #19A985; 
                border: 1px solid; 
                width: 200px; 
                height: 50px; 
                font-size: 14px; 
                font-weight: 600;
                border-radius: 10px;
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
        
 <!-- <script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'boardContent',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	  // Summernote에 글 내용 추가하는 코드
	  $("#summernote").summernote('code', '${ requestScope.review.boardContent }');
	});
</script> -->
    	
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
            <!--Home page style-->


            <jsp:include page="../common/userHeader.jsp"/>
            <!--Home Sections-->

            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 40px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600; float: left">커뮤니티</div>
            </section>

			<div class="blog-list" style="position: absolute; top:25%; width: 15%; margin-top: 45px;">
				<nav>
					<ul style="margin-left: 30%;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/views/user/community/freeBoardList.jsp" style="color: #979797;">자유게시판</a></li>
						<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/coupon/select" style="color: #979797;">무료나눔</a></li>
						<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/views/user/community/reviewList.jsp" style="color: #45B99C; font-size: 1.3em; font-weight: 600;">용품리뷰</a></li>
					</ul>
				</nav>
			</div>

            <section id="menutable" class="menutable">
		    	<form  action="${pageContext.servletContext.contextPath }/user/review/writeUpdate/updateReview" method="post">
					<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 30px;">
							<table class="table" style="border-collapse: separate;">
								<tr>
									<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px; width:25%;"><b>제목</b></td>
									<td>
										<input type="text" style="width:45%; border: 0px;" value="${ requestScope.review.boardTitle }" name="boardTitle">
									</td>
								</tr>
								<tr>
									<td style="text-align: center; background-color: #F1FAF8; width:25%;"><b>작성자</b></td>
									<td><c:out value="${ requestScope.review.userNickName }"/></td>
								</tr>
							</table>
							<textarea id="summernote" name="boardContent" required>
								${ requestScope.review.boardContent }
							</textarea>
	  						<script>
	  						$j3('#summernote').summernote({
	  	                        tabsize: 2,
	  	                        height: 500,
	  	                        callbacks: {
	  	                            onImageUpload: function(files, editor, welEditable) {
	  	                                 sendFile(files[0], editor,welEditable);
	  	                            }
	  	                    	}
	  	                    });
	  					
							function sendFile(file, editorwelEditable) {
								console.log("사진 ajax 들어옴");
							 	var form_data = new FormData();
								form_data.append('file', file);
								$j3.ajax({
									data: form_data,
									type: "POST",
									url: '${pageContext.servletContext.contextPath}/user/insert/reviewboardImg',
									cache: false,
									contentType: false,
									enctype: 'multipart/form-data',
									processData: false,
									success: function(data) {
										$j3('#summernote').summernote('editor.insertImage', data.url);
										console.log(data.url);
										$j3("#pictureName").val(data.pictureName);
										$j3("#pictureURL").val(data.pictureURL);
										$j3("#pictureNewName").val(data.pictureNewName);
										$j3("#pictureUtilPath").val(data.pictureUtilPath);
									}
							    });
							}
						</script>
			        </div>
			         <input type="hidden" id="pictureName" name="pictureName"/>
                    <input type="hidden" id="pictureURL" name="pictureURL"/>
                    <input type="hidden" id="pictureNewName" name="pictureNewName"/>
                    <input type="hidden" id="pictureUtilPath" name="pictureUtilPath"/>
                    <input type="hidden" id="boardCode" name="boardCode" value="${ requestScope.review.boardCode }"/>
			        <div style="margin: 0px auto; text-align: center; margin-bottom: 50px;"><button class="reviewWrite">수정하기</button></div>
				</form>
				<!-- <script>
				function goModify(frm) {
					
					var title = frm.title.value;
					var content = frm.content.value;
					
					if (title.trim() == ''){
						alert("제목을 입력해주세요");
						return false;
					}
					if (content.trim() == ''){
						alert("내용을 입력해주세요");
						return false;
					}
					frm.submit();
					}
				
			</script> -->
            </section>

            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
</html>