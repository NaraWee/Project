<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            div > img {
                margin-bottom: 20px;
                text-align: center;
				width: 20%;
            }
            a > img {
                width: 50%;
                height: 50%;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: 15px;
                margin-right: 15px;
                text-align: center;
            }
            .menutable > div > img {
                margin-bottom: 20px;
				width: 20%;
                margin: 0px auto;
                display: block;
            }
            .sendmessage > input {
                width: 87%;
                height: 50px;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
                margin-bottom: 50px;
            }
            .sendmessage > button {
                background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 10%;
                height: 45px; 
                font-size: 16px; 
                font-weight: 600;
                border-radius: 10px;
                margin-left: 2%;
            }
            .sendmessage > input::placeholder {
                color:#45B99C;
            }
            td > img, span > img{
            	cursor: pointer !important;
            }
            			.overlay:target {
				visibility: visible;
				opacity: 1;
			}.overlay {
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
            td > button {
            	float: right;
    			border-radius: 5px;
    			border: 1px solid;
    			color: #45B99C;
    			background: white;
            }
            td > button:hover {
            	float: right;
    			border-radius: 5px;
    			background-color: #45B99C;
                color: white;
                border-color: #45B99C; 
                border: 1px solid;
            }
            #underline-btn {
            	float: right;
    			border: none;
    			color: #45B99C;
    			background: white;
    			height: 40px;
    			width: 100px;
                font-size: 15px;
            }
            #underline-btn:hover {
            	float: right;
    			border-radius: 15px;
    			background-color: white;
                color: #45B99C;
                border-color: #45B99C; 
                border: 1px solid;
                height: 40px;
                width: 100px;
                font-size: 15px;
            }
            .findpwd-content > div, .findpwd-content > form > div {
                margin: 0px auto;
            }
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">
		<script>
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

            <!--Home Sections-->
            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600; float: left">프렌들리 플레이스</div>
                <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/sharePlace/list'" style="width:50px; float: right; cursor: pointer !important;">
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
				<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 10px;">
		            <table class="table" style="margin-bottom: 50px; border-collapse: separate;">
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px;"><b>제목</b></td>
							<td><c:out value="${ requestScope.sharePlaceDetail.boardTitle }"/></td>
							<td style="text-align: center; background-color: #F1FAF8;"><b>조회수</b></td>
							<td style="border-radius: 0px 21px 0px 0px;"><c:out value=" ${requestScope.sharePlaceDetail.boardViews }"/>
							<span>
								<c:if test="${ requestScope.sharePlaceDetail.userCode != sessionScope.loginUser.code && !empty sessionScope.loginUser.code }">
									<img onclick="location.href='#reportPost'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px; float:right; margin-right: 10px;">
								</c:if>
							</span>
							</td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8;"><b>작성자</b></td>
							<td><c:out value="${ requestScope.sharePlaceDetail.userNickName }"/><button onclick="location.href='#directMessage'">쪽지보내기</button></td>
							<td style="text-align: center; background-color: #F1FAF8;"><b>작성 일자</b></td>
							<td><c:out value="${ requestScope.sharePlaceDetail.boardPostDate }"/></td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8;"><b>장소명</b></td>
							<td><c:out value="${ requestScope.sharePlaceDetail.placeName }"/></td>
							<td style="text-align: center; background-color: #F1FAF8;"><b>장소 연락처</b></td>
							<td><c:out value="${ requestScope.sharePlaceDetail.placePhone }"/></td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8;"><b>장소 주소</b></td>
							<td><c:out value="${ requestScope.sharePlaceDetail.placeAddress }"/></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<div style="margin-bottom: 30px; text-align:center;">
						<c:out value="${ requestScope.sharePlaceDetail.boardContent }" escapeXml="false"/>
					</div>
					
					<div id="map" style="width:80%;height:400px; margin:0px auto; margin-bottom:30px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b85791a0e7d027a11d7cf8b979f0fb14&libraries=services"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 2 // 지도의 확대 레벨
						    };
						var placeAddress = '<c:out value="${ requestScope.sharePlaceDetail.placeAddress }"/>';
						var placeName = '<c:out value="${ requestScope.sharePlaceDetail.placeName }"/>';
						
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption); 
						
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch(placeAddress, function(result, status) {
						
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
						
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
						
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+placeName+'</div>'
						        });
						        infowindow.open(map, marker);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
					</script>
		       	</div>
		       	
		       	<!-- 게시글 작성자와 login 세션값 일치할 때 수정하기 버튼 보이기 -->
		       	<div style="width: 70%; margin: 0px auto; margin-bottom: 50px; text-align:right;">
		        	<c:if test="${sessionScope.loginUser.code eq requestScope.sharePlaceDetail.userCode}">
		        		<button id="underline-btn" style="margin-right:10px;" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/sharePlace/modify?boardCode=${ requestScope.sharePlaceDetail.boardCode }'">수정하기</button>
		        	</c:if>
		        </div>
		        
				<div style="color: #45B99C; width: 70%; margin: 0px auto; font-weight: 550; margin-top:40px; margin-bottom: 10px;">전체 댓글</div>
				<div style="margin-bottom: 40px;">
					<table class="table" style="margin-bottom: 50px; width: 70%; margin: 0px auto;">
				    	<tbody>
				    		<c:forEach var="arr" items="${ sharePlaceReply }">
				    			<c:if test="${ arr.replyDeleteYN eq 'N' }">
				    				<c:if test="${ arr.reportYN eq 'N' }">
							            <tr>
							                <td><c:out value="${ arr.userNickName }"></c:out></td>
							                <td><c:out value="${ arr.replyContent }"/></td>
							                <td style="text-align: center;"><c:out value="${ arr.replyDate }"/></td>
							                <input type="hidden" value="${ arr.replyCode }" name="replyCode" class="replyCode"/>
				                            	<input type="hidden" value="${ arr.userCode }" name="userCode1" class="userCode1"/>
							                <td>
							                	<c:if test="${ arr.userCode != sessionScope.loginUser.code && !empty sessionScope.loginUser.code }">
							                		<img onclick="report(this)" class="${ arr.replyCode }" title="${ arr.userCode }" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px">
							                	</c:if>
							                </td>
							            </tr>
						            </c:if>
						            <c:if test="${ arr.reportYN eq 'Y' }">
				                    	<tr>
				                        	<td><c:out value="${ arr.userNickName }"/></td>
				                        	<td><del>신고에 의해 삭제된 댓글입니다.</del></td>
				                        	<td style="text-align: center;"><c:out value="${ arr.replyDate }"/></td>
				                        	<td></td>
				                    	</tr>
	                        		</c:if>
						        </c:if>
	                        	<c:if test="${ arr.replyDeleteYN eq 'Y' }">
			                    	<tr>
			                        	<td><c:out value="${ arr.userNickName }"/></td>
			                        	<td><del>삭제된 댓글입니다.</del></td>
			                        	<td style="text-align: center;"><c:out value="${ arr.replyDate }"/></td>
			                        	<td></td>
			                    	</tr>
		                        </c:if>
					        </c:forEach>
				        </tbody>
				    </table>
			    </div>
            </section>
            
            <c:if test="${ !empty sessionScope.loginUser.code }">
	            <form action="${ pageContext.servletContext.contextPath }/user/insert/sharePlace/reply" method="post">
		            <section id="sendmessage" class="sendmessage" style="width: 70%; margin: 0px auto; margin-bottom: 50px;">
		                <input type="text" name="replyContent" id="messagecontent" placeholder="  message" required>
		                <input type="hidden" name="boardCode" value="${ requestScope.sharePlaceDetail.boardCode }">
		                <button class="sendmessagecontent">댓글 작성</button>
		            </section>
	            </form>
            </c:if>

            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>
            
			<!-- 게시글 신고 팝업창 -->
            <form action="${pageContext.servletContext.contextPath }/user/insert/sharePlace/report" method="post">
	            <div id="reportPost" class="overlay">
	                <div class="popup">
	                    <a href="" class="close">&times;</a>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px;">게시글 신고</p>
	                    <div class="findpwd-content" id="contStep02" style="display: block;">
	                        <div class="cont-step_preface">
	                            <hr style="border:0.5px solid #A8A8A8;">
	                        </div>
	                        <!-- 신고 내용 입력 -->
	                        <div style="text-align: center; margin-top: 30px; width: 80%;"><input type="text" name="reportContent" placeholder="신고내용을 입력하세요" required style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
	                        <input type="hidden" value="${ requestScope.sharePlaceDetail.boardCode }" name="boardCode">
	                        <div style="text-align: center; margin-top: 30px;"><button type="button" class="btn_submit" onclick="location.href='#completeReport'">신고하기</button></div>
	                    </div>
	                </div>
	            </div>
	            <!-- 신고 완료 팝업창 -->
	            <div id="completeReport" class="overlay">
	                <div class="popup">
		                <img alt="warning" src="${ pageContext.servletContext.contextPath }/resources/images/warning.png" style="width: 120px; margin: 0px auto; margin-left: 220px; margin-bottom: -70px;">
		                <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 50px;">
		                   	신고가 정상적으로 접수되었습니다.<br>
		                </p>
		                <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
		                   	신고에 대한 처리는 1~2일 소요될 수 있으며<br>
		                   	신고 내역에서 확인 가능합니다.
		                </p>
	                    <div style="text-align: center; margin-top: 30px;"><button class="btn_submit">확인</button></div>
	                </div>
	            </div>
	        </form>
	        
	        
	        <!-- 댓글 신고 팝업창 -->
            <form action="${pageContext.servletContext.contextPath }/user/insert/sharePlace/reportReply" method="post">
	            <div id="reportComment" class="overlay">
	                <div class="popup">
	                    <a href="" class="close">&times;</a>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px;">댓글 신고</p>
	                    <div class="findpwd-content" id="contStep02" style="display: block;">
	                        <div class="cont-step_preface">
	                            <hr style="border:0.5px solid #A8A8A8;">
	                        </div>
	                        <!-- 신고 내용 입력 -->
	                        <div style="text-align: center; margin-top: 30px; width: 80%;"><input type="text" name="replyReportContent" placeholder="신고내용을 입력하세요" required style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
	                        <div style="text-align: center; margin-top: 30px;"><button type="button" class="btn_submit" onclick="location.href='#completeReport2'">신고하기</button></div>
	                        <input type="hidden" name="inputReplyCode" id="inputReplyCode">
	                        <input type="hidden" name="inputuserCode1" id="inputuserCode1">
	                        <input type="hidden" value="${ requestScope.sharePlaceDetail.boardCode }" name="boardCode">
	                    </div>
	                </div>
	            </div>
	            <!-- 신고 완료 팝업창 -->
	            <div id="completeReport2" class="overlay">
	                <div class="popup">
	                    <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 50px;">
	                     	신고가 정상적으로 접수되었습니다.<br>
	                    </p>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
	                     	신고에 대한 처리는 1~2일 소요될 수 있으며<br>
	                     	신고 내역에서 확인 가능합니다.
	                    </p>
	                    <div style="text-align: center; margin-top: 30px;"><button class="btn_submit">확인</button></div>
	                </div>
	            </div>
            </form>			
			
			<script>
				function report (reply) {
				
					let replyCode = reply.className;
					let userCode1 = reply.title;
					
					document.getElementById("inputReplyCode").value = replyCode;
					document.getElementById("inputuserCode1").value = userCode1;
					
					location.href = '#reportComment';
				}
			</script>
            
            
            <!-- 쪽지 팝업창 -->
            <form action="${pageContext.servletContext.contextPath }/user/insert/sharePlace/message" method="post">
	            <div id="directMessage" class="overlay">
	                <div class="popup">
	                    <a href="" class="close">&times;</a>
	                    <p style="font-size: 20px; text-align: left; padding-bottom: 10px; margin-top: 10px;">받는이 : <c:out value="${ requestScope.sharePlaceDetail.userNickName }"/></p>
	                    <div class="findpwd-content" id="contStep02" style="display: block;">
	                        <!-- 쪽지 내용 입력 -->
	                        <div style="text-align: center; margin-top: 30px; width: 100%;"><input type="text" name="messageContent" placeholder="내용을 적어주세요" required style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
	                        <input type="hidden" value="${ requestScope.sharePlaceDetail.userCode }" name="userCode1">
	                        <input type="hidden" value="${ requestScope.sharePlaceDetail.boardCode }" name="boardCode">
	                        <input type="hidden" value="${ requestScope.sharePlaceDetail.userNickName }" name="receiveUserNick">
	                        <div style="text-align: center; margin-top: 30px;"><button class="btn_submit">보내기</button></div>
	                    </div>
	                </div>
	            </div>
	            <!-- 전송 완료 팝업창 -->
	            <!-- <div id="completeMessage" class="overlay">
	                <div class="popup">
	                    <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 50px;">
	                     	쪽지 전송에 성공하였습니다.<br>
	                    </p>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
	                     	보낸 쪽지는 마이페이지에서 확인 가능합니다.
	                    </p>
	                    <div style="text-align: center; margin-top: 30px;"><button class="btn_submit">확인</button></div>
	                </div>
	            </div> -->
            </form>
          
			
            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
</html>