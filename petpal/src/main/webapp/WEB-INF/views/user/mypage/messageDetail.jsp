<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
    <head>
        <style>
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
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

        <!--Google Font link-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">


        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.css"> 
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick-theme.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/animate.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/iconfont.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/magnific-popup.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootsnav.css">

        <!-- xsslider slider css -->


        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/xsslider.css">-->




        <!--For Plugins external css-->
        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/plugins.css" />-->

        <!--Theme custom css -->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">
        <!--<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/colors/maron.css">-->

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" />

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
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

            <section id="message" class="message" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600;">쪽지 확인</div>
            </section> <!--End off Home Sections-->

            <section id="account" class="account" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="font-size: 20px; font-weight: 600; float: left; margin-left: 10px; float:left; margin-top:20px;">쪽지 상세보기</div>
                <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/message?type=A'" style="width:50px; float: right;">
                <br><br>
                <hr style="border-color: rgb(175, 175, 175);">
            </section>

            <section id="messagetable" class="messagetable">
                <div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px;">
                <table class="table" style="margin-bottom: 50px;" id="messageList">
                    <thead>
                        <tr style="background-color: #F1FAF8;">
                            <th style="text-align: center; border-radius: 21px 0px 0px 0px;"><b>보낸 사람</b></th>
                            <th style="text-align: center; "><b>받는 사람</b></th>
                            <th style="text-align: center;"><b>쪽지 내용</b></th>
                            <th style="text-align: center; border-radius: 0px 21px 0px 0px;"><b>날짜</b></th>
                        </tr>
                    </thead>
                   <tbody>
	                    <c:forEach items="${ msgList }" var="list">
						<tr>
							<td style="text-align: center;">${ list.sendUserNick }</td>
							<td style="text-align: center;">${ list.receiveUserNick }</td>
							<td style="text-align: center;">${ list.messageContent }</td>
							<td style="text-align: center;">${ list.messageDate }</td>
						</tr>
						</c:forEach>
	             </tbody>
                 </table>
                 </div>
                  <div class="text-center">
						<ul class="pagination">
						<li>
							<c:if test="${paging.startPage != 1 }">
								<li><a href="${ pageContext.servletContext.contextPath }/user/mypage/message/messageDetail?userCode1=${ oneList.userCode1 }&userCode=${ oneList.userCode }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
							</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<li><a>${p }</a></li>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<li><a href="${ pageContext.servletContext.contextPath }/user/mypage/message/messageDetail?userCode1=${ oneList.userCode1 }&userCode=${ oneList.userCode }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
									</c:when>
								</c:choose>
							</c:forEach>
							<c:if test="${paging.endPage != paging.lastPage}">
								<li><a href="${ pageContext.servletContext.contextPath }/user/mypage/message/messageDetail?userCode1=${ oneList.userCode1 }&userCode=${ oneList.userCode }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
							</c:if>
							</li>
						</ul>
					</div>
                </div>
            
            <c:if test="">
            </c:if>
            <form action="${ pageContext.servletContext.contextPath }/user/mypage/message/messageSend" method="post">
            <section id="sendmessage" class="sendmessage" style="width: 70%; margin: 0px auto;">
                <input type="text" name="messageContent" placeholder="message">
                <%-- <input type="hidden" value="${ oneList.receiveUserNick }" name="receiveUserNick">
                <input type="hidden" value="${ oneList.sendUserNick }" name="sendUserNick">
                <input type="hidden" value="${ oneList.userCode1 }" name="userCode1">
                <input type="hidden" value="${ oneList.userCode }" name="userCode"> --%>
                <input type="hidden" value="${ userCode1 }" name="userCode1">
                <input type="hidden" value="${ userCode }" name="userCode">
                <button class="sendmessagecontent">쪽지 보내기</button>
            </section>
           </form>

            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>
</body>
            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        
</html>