<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<!DOCTYPE html>
<html>
    <head>
        <style>
            .menutable > div > img {
                margin-bottom: 20px;
				width: 20%;
                margin: 0px auto;
                display: block;
            }
			div > button, form > button {
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
            div > button:hover {
				background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid;
			}
			#notcancel, #notcancel:hover {
				float: right;
				margin-right: 10px;
				background:lightgray;
				color: white;
			}
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
    </head>

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

            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left;">광고 내역</div>
                <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/adApply/detail?adCode=${ requestScope.adApplyDetail.adCode }'" style="width:50px; float: right;">
            </section> <!--End off Home Sections-->

			<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="isToday"/>
			<fmt:parseNumber value="${requestScope.adApplyDetail.decisionDate.time / (1000*60*60*24)}" integerOnly="true" var="isDecisionDate"/>
            <section id="menutable" class="menutable">
				<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 20px;">
					<table class="table" style="margin-bottom: 50px; border-collapse: separate;">
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px; width:25%;"><b>제목</b></td>
							<td style="border-radius: 0px 21px 0px 0px"><c:out value="${ requestScope.adApplyDetail.adTitle }"/></td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; width:25%;"><b>기업 / 상호명</b></td>
							<td><c:out value="${ requestScope.adApplyDetail.companyName }"/></td>
						</tr>
					</table>
					<div style="margin-bottom: 30px; text-align:center;">
						<c:out value="${ requestScope.adApplyDetail.adContent }" escapeXml="false"/>
					</div>
		        </div>
		        <div style="width: 70%; margin: 0px auto; margin-bottom: 50px;">
		        	<!-- 광고 취소 분기처리 -->
		        	<c:if test="${ isDecisionDate ne '0' }">
			        	<c:if test="${ requestScope.adApplyDetail.stateCode ne '4' && !(today > requestScope.adApplyDetail.postEndDate) && !(requestScope.adApplyDetail.stateCode eq '3') && !(isToday-isDecisionDate > 3 && requestScope.adApplyDetail.postYn eq 'N') }">
			        		<form action="${ pageContext.servletContext.contextPath }/user/update/cancel/ad" method="post">
					        	<input type="hidden" value="${ requestScope.adApplyDetail.adCode }" name="adCode"/>
					        	<input type="hidden" value="${ requestScope.adApplyDetail.payDate1st }" name="payDate1st"/>
			        			<button style="float: right; margin-right: 10px;">광고 취소</button>
			        		</form>
			        	</c:if>
			        	<c:if test="${ requestScope.adApplyDetail.stateCode eq '4' || today > requestScope.adApplyDetail.postEndDate || requestScope.adApplyDetail.stateCode eq '3' || (isToday-isDecisionDate > 3 && requestScope.adApplyDetail.postYn eq 'N') }">
			        		<button id="notcancel" disabled>취소 불가</button>
			        	</c:if>
		        	</c:if>
		        	<c:if test="${ isDecisionDate eq '0' }">
			        	<c:if test="${ requestScope.adApplyDetail.stateCode ne '4' && !(today > requestScope.adApplyDetail.postEndDate) && !(requestScope.adApplyDetail.stateCode eq '3') }">
			        		<form action="${ pageContext.servletContext.contextPath }/user/update/cancel/ad" method="post">
					        	<input type="hidden" value="${ requestScope.adApplyDetail.adCode }" name="adCode"/>
					        	<input type="hidden" value="${ requestScope.adApplyDetail.payDate1st }" name="payDate1st"/>
			        			<button style="float: right; margin-right: 10px;">광고 취소</button>
			        		</form>
			        	</c:if>
		        	</c:if>
		        </div>
            </section>

            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
</html>