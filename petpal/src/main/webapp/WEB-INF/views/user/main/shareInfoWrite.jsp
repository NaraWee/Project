<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
        <style>
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
             .overlay {
  				position: fixed;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				background: rgba(0, 0, 0, 0.7);
				transition: opacity 500ms;
				visibility: hidden;
				opacity: 0;
				z-index: 900;
				height: 150% !important;
			}
			.overlay:target {
				visibility: visible;
				opacity: 1;
			}
			.popup {
				position: fixed;
				width: 60%;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
				-webkit-transition: opacity .5s, visibility 0s linear .5s;
				transition: opacity .5s, visibility 0s linear .5s;
				z-index: 1;
			}
			.popup:target {
				visibility: visible;
				opacity: 1;
				-webkit-transition-delay: 0s;
				transition-delay: 0s;
			}
			.popup-close {
				position: absolute;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
			}
			.popup .close {
				position: absolute;
				right: 5px;
				top: 5px;
				padding: 5px;
				color: #000;
				transition: color .3s;
				font-size: 2em;
				line-height: .6em;
			}
			.popup .close:hover {
				color: #007a5c;
			}
            .btn_submit, .certification {
                background-color: #45B99C; 
                height: 45px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                width: 100px;
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

            <!--Home Sections-->

        <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
            <div style="color: #45B99C; font-size: 25px; font-weight: 600; float: left">일반 정보 공유</div>
            <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/shareInfo/list'" style="width:50px; float: right; cursor: pointer !important;">
        </section>

		<div class="blog-list" style="position: absolute; top:25%; width: 15%; margin-top: 45px;">
			<nav>
				<ul style="margin-left: 30%;">
					<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/select/shareInfo/list" style="color: #45B99C; font-size: 1.3em; font-weight: 600;">일반 정보 공유</a></li>
					<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
					<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/select/sharePlace/list" style="color: #979797;">프렌들리 플레이스</a></li>
				</ul>
			</nav>
		</div>
    
       	<section id="menutable" class="menutable">
			<form action="${pageContext.servletContext.contextPath}/user/insert/write/shareInfo" method="post" enctype="multipart/form-data">
				<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 30px;">
					<table class="table" style="border-collapse: separate;">
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px; width:25%;"><b>제목</b></td>
							<td style="border-radius: 0px 21px 0px 0px"><input type="text" name="boardTitle" placeholder="제목을 입력하세요" required style="border: none; width: 80%"></td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; width:25%;"><b>작성자</b></td>
							<td><c:out value="${ requestScope.writeUser.userNickName }"/></td>
						</tr>
					</table>
					<textarea name="boardContent" id="summernote"></textarea>
	  				<script>
	  					$j3('#summernote').summernote({
	  	                    placeholder: '정보공유 게시글을 작성해주세요',
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
							    url: '${pageContext.servletContext.contextPath}/user/insert/shareInfoImg',
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
			    <div style="margin: 0px auto; text-align: center; margin-bottom: 50px;"><button class="reviewWrite">게시글 작성</button></div>
            
<%-- 			    <div id="completeReport" class="overlay">
					<div class="popup">
				    	<img alt="warning" src="${ pageContext.servletContext.contextPath }/resources/images/warning.png" style="width: 120px; margin: 0px auto; margin-left: 38%; margin-bottom: -70px;">
						<i class="far fa-times-circle fa-4x" style="float:right; color:#45B99C; cursor:pointer;" onclick="location.href='#none'"></i>
				     	<p style="font-size: 30px; text-align: center; font-weight:bold; color: black; margin-top: 50px;">
				       		<strong>글 작성 신청이 완료되었습니다.</strong><br>
				     	</p>
				     	<p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
				       		검토에는 1~2일 소요 될 수 있습니다.
				     	</p>
				 		<div style="text-align: center; margin-top: 30px;"><button class="btn_submit">확인</button></div>
				 	</div>
			    </div> --%>
			</form>
        </section>
            
        <!-- 오른쪽 배너 -->
        <jsp:include page="../../common/banner.jsp"/>

		<jsp:include page="../common/footer.jsp"/>
		
</html>