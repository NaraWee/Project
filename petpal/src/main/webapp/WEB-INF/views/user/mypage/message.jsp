<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>PET-PAL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

        <!--Google Font link-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

		<style>
            .inquiry .tab_each{display:none}
			.inquiry .tab_each:first-child{display:block}
			.inquiry .tab{display:none}
			.tab_each{clear:both;border-top:1px solid rgba(0,0,0,0.08)}
			.tab .active, .tab .tab_btn.active {
    			color: #000;
    			font-weight: bold;
    			color: #45b99c8a;
			}
			.tab span.tab_btn {
			    display: inline-block;
			    float: none;
			    position: relative;
			    width: auto;
			    height: 40px;
			    margin-right: 22px;
			    font-size: 18px;
			    line-height: normal;
			    color: rgba(0,0,0,0.56);
			    text-align: left;
			    cursor: pointer;
			}
            .tab {
    			height: auto;
    			border-bottom: 1px solid rgba(0,0,0,0.2);
			}
			.tab .active:after {
			    display: block;
			    content: '';
			    position: absolute;
			    bottom: 0;
			    left: 0;
			    width: 100%;
			    height: 2px;
			    background: #45b99c8a;
			}
			td > button {
				background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 80px; 
                height: auto; 
                font-size: 13px; 
                font-weight: 500;
                border-radius: 10px;
			}
			td > button:hover {
				background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid;
			}
			td.notbutton > button {
				background-color: rgb(175, 175, 175); 
                color: white;
                border-color: rgb(175, 175, 175); 
                border: 1px solid; 
                width: 80px; 
                height: auto; 
                font-size: 13px; 
                font-weight: 500;
                border-radius: 10px;
			}
			.filtering {
				cursor: pointer;
			}
        </style>
		
		
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.css"> 
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick-theme.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/animate.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/iconfont.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/magnific-popup.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootsnav.css">

        
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" />

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
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

            <section id="message" class="message" style="width: 70%; margin: 0px auto;  margin-bottom: 40px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600;">쪽지 확인</div>
            </section> <!--End off Home Sections-->

            <section id="list" class="list" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div class="tab">
					<span class="tab_btn active" data-toggle="tab" id="qna" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/message?type=A';">받은 쪽지</span>
					<span class="tab_btn" data-toggle="tab" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/message?type=B';">보낸 쪽지</span>
					<img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/'" style="width:50px; float: right;">
				</div>
            </section>

            <section id="messagetable" class="messagetable">
                <div class="tab-content">
	                <div id="menu0" class="tab-pane fade in active">
						<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
		               	 <table class="table table-hover" style="margin-bottom: 50px;">
		                    <thead>
		                        <tr style="background-color: #F1FAF8;">
		                            <th style="text-align: center; border-radius: 21px 0px 0px 0px;"><b>쪽지 대상</b></th>
		                            <th style="text-align: center;"><b>쪽지 내용</b></th>
		                            <th style="text-align: center; border-radius: 0px 21px 0px 0px;"><b>날짜</b></th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    
							<c:if test="${ type eq 'A' }">
		                    <c:forEach items="${ msgList }" var="list">
							<tr onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/message/messageDetail?type=A&userCode1=${ list.userCode }&userCode=${ list.userCode1 }'">
								<td style="text-align: center;"><c:out value="${ list.sendUserNick }"/></td>
								<td style="text-align: center;">${ list.messageContent }</td>
								<td style="text-align: center;">${ list.messageDate }</td>
							</tr>
							</c:forEach>
							</c:if>
							<c:if test="${ type eq 'B' }">
		                    <c:forEach items="${ msgList }" var="list">
		                    <tr onclick="location.href='${ pageContext.servletContext.contextPath }/user/mypage/message/messageDetail?type=B&userCode1=${ list.userCode1 }&userCode=${ list.userCode }'">
								<td style="text-align: center;"><c:out value="${ list.receiveUserNick }"/></td>
								<td style="text-align: center;">${ list.messageContent }</td>
								<td style="text-align: center;">${ list.messageDate }</td>
							</tr>
							</c:forEach>
							</c:if>
							
		                    </tbody>
		                </table>
		                <div class="text-center">
							<ul class="pagination">
							<li>
								<c:if test="${paging.startPage != 1 }">
									<li><a href="${ pageContext.servletContext.contextPath }/user/mypage/message?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
								</c:if>
								<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
									<c:choose>
										<c:when test="${p == paging.nowPage }">
											<li><a>${p }</a></li>
										</c:when>
										<c:when test="${p != paging.nowPage }">
											<li><a href="${ pageContext.servletContext.contextPath }/user/mypage/message?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
										</c:when>
									</c:choose>
								</c:forEach>
								<c:if test="${paging.endPage != paging.lastPage}">
									<li><a href="${ pageContext.servletContext.contextPath }/user/mypage/message?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
								</c:if>
								</li>
							</ul>
						</div>
						</div>
					</div>
	                
                </div>
            </section>
<script>
      let targetLink = document.querySelectorAll('.tab span');
  	for(var i = 0; i < targetLink.length; i++){
  		targetLink[i].classList.remove('active');
  		if(i == ${ requestScope.num}){
  			targetLink[i].classList.add('active');
  		}
  	}
</script>
            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
         
</html>