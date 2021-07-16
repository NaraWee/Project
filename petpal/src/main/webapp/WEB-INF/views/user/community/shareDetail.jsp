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

			section > button{
			 background-color: #B9062F; 
                height: 35px;
                color: white;
                border-color: #B9062F; 
                border: 1px solid;
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                margin-left: 20px;
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
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
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
        </style>
        
		<!-- summerNote -->
    	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    	<script>
		    const message = '${ requestScope.message }';
		    if(message != null && message !== '') {
		    	alert(message);
		    }
		    
	 
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


        <div class="culmn">
            <!--Home page style-->

            <!--Home Sections-->
            
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
            

            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left;">커뮤니티</div>
                <c:if test="${requestScope.shareInfo.stateCode == 1 && requestScope.shareInfo.userCode eq sessionScope.loginUser.code }">
                	<button style="margin-left:900px; background-color:rgb(175, 175, 175);" onclick="location.href='${ pageContext.servletContext.contextPath }/user/sharefree/update/status/${requestScope.shareInfo.boardCode}'" >나눔 완료</button>
                </c:if>
                <c:if test="${requestScope.shareInfo.stateCode == 2 }">
                	<button style="margin-left:900px; background-color:rgb(175, 175, 175);">나눔 완료</button>
                </c:if>
                <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/shareFree/list'" style="width:50px; cursor:pointer; float: right;">
            </section> <!--End off Home Sections-->

            <section id="menutable" class="menutable">
				<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
		            <table class="table" style="margin-bottom: 50px; border-collapse: separate;">
						<tbody><tr>
							<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px;"><b>제목</b></td>
							<td>${requestScope.shareInfo.boardTitle }</td>
							<td style="text-align: center; background-color: #F1FAF8;"><b>조회수</b></td>
							<td style="border-radius: 0px 21px 0px 0px;">${requestScope.shareInfo.boardViews }
							<span>
							<img onclick="location.href='#reportPost'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px; float:right; margin-right: 10px;">
							</span>
							</td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8;"><b>작성자</b></td>
							<td>
							${requestScope.shareInfo.userNickname }<button onclick="location.href='#directMessage'" style="float:right;">쪽지보내기</button>
							</td>
							<td style="text-align: center; background-color: #F1FAF8;"><b>작성일자</b></td>
							<td>${requestScope.shareInfo.boardDate }</td>
						</tr>
					</tbody></table>
					<div style="margin-bottom: 30px; text-align:center;">
						<c:out value="${ requestScope.shareInfo.boardContent }" escapeXml="false"/>
					</div>
		        <div style="margin: 0px auto; margin-bottom: 50px; text-align:right;">
		        	<c:if test="${sessionScope.loginUser.code eq requestScope.shareInfo.userCode}">
		        		<button id="underline-btn" style="margin-right:10px;margin-top: 40px;" onclick="location.href='${ pageContext.servletContext.contextPath }/user/sharefree/modify/${ requestScope.shareInfo.boardCode }'">수정하기</button>
		        	</c:if>
		        </div> 
		        </div>
            </section>
            
         <!-- 게시글 신고 팝업창 -->
         <form action="${ pageContext.servletContext.contextPath }/user/sharefree/insert/report" method="POST">
            <div id="reportPost" class="overlay">
                <div class="popup">
                    <a href="" class="close">&times;</a>
                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px;">게시글 신고</p>
                    <div class="findpwd-content" id="contStep02" style="display: block;">
                        <div class="cont-step_preface">
                            <hr style="border:0.5px solid #A8A8A8;">
                        </div>
                        <!-- 신고 내용 입력 -->
                        <div style="text-align: center; margin-top: 30px; width: 80%;"><input type="text" id="reportContent_board" placeholder="신고내용을 입력하세요" style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
                         <c:if test="${!empty sessionScope.loginUser }">
                        	<div style="text-align: center; margin-top: 30px;"><button class="btn_submit" type="button" onclick="location.href='#completeReport'">신고하기</button></div>
                        </c:if>
                         <c:if test="${empty sessionScope.loginUser }">
                        	<div style="text-align: center; margin-top: 30px;"><button class="btn_submit" disabled>로그인 후 신고가능합니다.</button></div>
                    	</c:if>
                    </div>
                </div>
            </div>
            
            <!-- 신고 완료 팝업창 -->
	            <div id="completeReport" class="overlay">
	                <div class="popup">
	                    <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 50px;">
	                     	신고가 정상적으로 접수되었습니다.<br>
	                    </p>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
	                     	신고에 대한 처리는 1~2일 소요될 수 있으며<br>
	                     	신고 내역에서 확인 가능합니다.
	                    </p>
	                    <input type="hidden" name="reportContent" id="reportContent">
	                    <input type="hidden" name="contentCode" id="contentCode">
	                    <input type="hidden" name="boardTitle" id="boardTitle">
	                    <div style="text-align: center; margin-top: 30px;"><button type = "submit" id = "btn_report_submit" class="btn_submit" onclick="location.href='#none'">확인</button></div>
                   		
                   		<script>
                   		
                   		 $j3("#btn_report_submit").click(function(){
	                   			console.log("여기오나?");
	                   			var content = $j3("#reportContent_board").val(); 
	                   			var Bcode = ${requestScope.shareInfo.boardCode};
	                   			var Btitle = "${requestScope.shareInfo.boardTitle}";
	                   			
	                   			$j3("#reportContent").val(content);
                   				$j3("#contentCode").val(Bcode);
                   				$j3("#boardTitle").val(Btitle);
                   				
                   			});
                   		</script>
                    </div>
                </div>
           </form>
            
            <!-- 쪽지 팝업창 -->
           <form action="${pageContext.servletContext.contextPath }/user/sharefree/insert/message" method="post">
          
            <div id="directMessage" class="overlay">
                <div class="popup">
                    <a href="" class="close">&times;</a>
                    <p style="font-size: 20px; text-align: left; padding-bottom: 10px; margin-top: 10px;">받는이 : <c:out value="${requestScope.shareInfo.userNickname }"/></p>
                    <div class="findpwd-content" id="contStep02" style="display: block;">
                        <!-- 신고 내용 입력 -->
                        <div style="text-align: center; margin-top: 30px; width: 100%;"><input type="text" name="messageContent" placeholder="내용을 적어주세요" style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
                         <c:if test="${!empty sessionScope.loginUser }">
                       	 <div style="text-align: center; margin-top: 30px;"><button type="button" class="btn_submit" onclick="location.href='#completeMessage'">보내기</button></div>
			           </c:if>
 						<c:if test="${empty sessionScope.loginUser }">
                     	   <div style="text-align: center; margin-top: 30px;"><button type="button" style="background-color:red !important;"class="btn_submit">로그인 후 이용가능</button></div>
         			  </c:if>
                    </div>
                </div>
            </div>
            
             <!-- 전송 완료 팝업창 -->
            <div id="completeMessage" class="overlay">
                <div class="popup">
                    <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 50px;">
                     	쪽지 전송에 성공하였습니다.<br>
                    </p>
                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
                     	보낸 쪽지는 마이페이지에서 확인 가능합니다.
                    </p>
                    		<input type="hidden" value="${ requestScope.shareInfo.userCode }" name="receivecode">
                        	<input type="hidden" value="${ requestScope.shareInfo.boardCode }" name="boardcode">
                        	<input type="hidden" value="${ requestScope.shareInfo.userNickname }" name="receiveUserNick">
                        <div style="text-align: center; margin-top: 30px;"><button type="submit" class="btn_submit" >확인</button></div>
                    </div>
                </div>
           </form>
          </div>
          
            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
      </body>
</html>