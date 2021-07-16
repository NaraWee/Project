<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			td {
				height:48px;
			}
		
			td>p {
				margin-top: 5px; 
				margin-bottom: 0px;
			}
		
	   		td > input::placeholder {
	       		font-size: 15px;
	       		color:#a1a1a1;
	   		}
	   		td > input {
	   			vertical-align: -webkit-baseline-middle;
	   		}
	   
	   		.note-modal-content {height: 400px;}
	   
	   		.table {margin-bottom: 1px !important;}
	   
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
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		
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
	
        <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
            <div style="color: #45B99C; font-size: 25px; font-weight: 600; float: left">프렌들리 플레이스</div>
            <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/views/user/main/sharePlace.jsp'" style="width:50px; float: right; cursor: pointer !important;">
        </section>

		<div class="blog-list" style="position: absolute; top:25%; width: 15%; margin-top: 45px;">
			<nav>
				<ul style="margin-left: 25%;">
					<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/select/shareInfo/list" style="color: #979797;">일반 정보 공유</a></li>
					<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
					<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/select/sharePlace/list"style="color: #45B99C; font-size: 1.3em; font-weight: 600;">프렌들리 플레이스</a></li>
				</ul>
			</nav>
		</div>
    	<section id="menutable" class="menutable">
	    	<form method="post" action="${pageContext.servletContext.contextPath}/user/insert/write/sharePlace" enctype="multipart/form-data">
				<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 30px;">
					<table class="table" style="border-collapse: separate;">
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px; width:25%;"><p><strong>제목</strong></p></td>
							<td style="border-radius: 0px 21px 0px 0px"><input type="text" name="boardTitle" placeholder="제목을 입력하세요" required style="border: none; width: 80%"></td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; width:25%;"><p><strong>장소 이름</strong></p></td>
							<td><input type="text" name="placeName" placeholder="장소명을 입력하세요" required style="border: none; width: 80%"></td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; width:25%;"><p><strong>장소 주소</strong></p></td>
							<td>
								<input type="text" id="address" name="placeAddress" placeholder="장소 주소를 검색해주세요" data-readonly required style="border: none; width: 80%">
								<input type="hidden" id="postcode" name="postCode" >
								<img src="${ pageContext.servletContext.contextPath }/resources/images/location.png" onclick="searchAddress()" style="width:35px; margin-right:40px; float: right; cursor:pointer">									
							</td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; width:25%;"><p><strong>장소 연락처</strong></p></td>
							<td><input type="text" name="placePhone" placeholder="장소 연락처를 입력하세요" required style="border: none; width: 80%"></td>
						</tr>
					</table>
					<textarea id="summernote" name="boardContent"></textarea>
	  				<script>
		  				$j3('#summernote').summernote({
			  	            placeholder: '프렌들리플레이스 게시글을 작성해주세요',
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
							    url: '${pageContext.servletContext.contextPath}/user/insert/sharePlaceImg',
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
			    
			</form>
        </section>
			    <%-- <div id="completeReport" class="overlay">
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
            
        <!-- 주소검색 -->
		<script>
			function searchAddress() {
			    new daum.Postcode({
			        oncomplete : function(data) {
			
			        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			           var fullAddr = ''; // 최종 주소 변수
			           var extraAddr = ''; // 조합형 주소 변수
			 
			           // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			
			               fullAddr = data.roadAddress;
			
			            } else { // 사용자가 지번 주소를 선택했을 경우(J)
			
			                fullAddr = data.jibunAddress;
			            }
			
			            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			            if (data.userSelectedType === 'R') {
			
			                //법정동명이 있을 경우 추가한다.
			                if (data.bname !== '') {
			                	
			                     extraAddr += data.bname;
			                }
			
			                // 건물명이 있을 경우 추가한다.
			                if (data.buildingName !== '') {
			                	
			                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			
			                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			                fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
			
			            }
			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
			            document.getElementById('address').value = fullAddr;
			
			            // 커서를 상세주소 필드로 이동한다.
			            document.getElementById('address').focus();
			        }
			    }).open();
			}
		</script>
            
        <!-- 오른쪽 배너 -->
        <jsp:include page="../../common/banner.jsp"/>

  		<jsp:include page="../common/footer.jsp"/>
</html>