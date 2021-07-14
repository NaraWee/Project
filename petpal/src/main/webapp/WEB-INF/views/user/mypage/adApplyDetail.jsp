<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
			td > button {
				background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 10px; 
                height: 15px;
                border-radius: 10px;
				margin-left: 5px;
			}
			td > button:hover {
				background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid;
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
                width: 130px;
                margin-right: 20px;
            }
            tr, td {
            	font-size: 17px;
				height: 55px;
				text-align: left;
			}
			td > input {
            	height: 40px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
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
                <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/ad/list'" style="width:50px; float: right;">
            </section> <!--End off Home Sections-->

            <section id="menutable" class="menutable">
						<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 50px;">
							<div style="width: 80%; margin-left: 30px; margin-top: 20px;"><b style="font-size: 25px;">광고 기본 정보</b></div>
		                	<table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px;">
								<tr>
									<td>광고 대상</td>
									<td>
										<c:if test="${ requestScope.adApplyDetail.adTypeCode eq '2' || requestScope.adApplyDetail.adTypeCode eq '4' }">
											<label name="adradio" style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" value="반려동물 관련 장소" disabled checked> 반려동물 관련 장소</label>
											<label name="adradio" style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" value="반려동물 관련 물품(장소 이외)" disabled> 반려동물 관련 물품(장소 이외)</label>								
										</c:if>
										<c:if test="${ requestScope.adApplyDetail.adTypeCode eq '1' || requestScope.adApplyDetail.adTypeCode eq '3' }">
											<label name="adradio" style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" value="반려동물 관련 장소" disabled> 반려동물 관련 장소</label>
											<label name="adradio" style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" value="반려동물 관련 물품(장소 이외)" disabled checked> 반려동물 관련 물품(장소 이외)</label>								
										</c:if>
									</td>
								</tr>
								<tr>
									<td>광고 기간</td>
									<td>
										<c:if test="${ requestScope.adApplyDetail.adTypeCode eq '1' || requestScope.adApplyDetail.adTypeCode eq '2' }">
											<label name="adDate" style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" value="1주" disabled checked> 1주</label>
											<label name="adDate" style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" value="2주" disabled> 2주</label>								
										</c:if>
										<c:if test="${ requestScope.adApplyDetail.adTypeCode eq '3' || requestScope.adApplyDetail.adTypeCode eq '4' }">
											<label name="adDate" style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" value="1주" disabled> 1주</label>
											<label name="adDate" style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" value="2주" disabled checked> 2주</label>								
										</c:if>
									</td>
								</tr>
								<tr>
									<td>기업 / 상호명</td>
									<td><input type="text" id="ownerName" value="${ requestScope.adApplyDetail.companyName }" disabled></td>
								</tr>
								<tr>
									<td>사업자 번호</td>
									<td><input type="text" id="ownerNo" value="${ requestScope.adApplyDetail.companyNumber }" disabled></td>
								</tr>
								<tr>
									<td>사업자 전화번호</td>
									<td><input type="text" id="ownerPhone" value="${ requestScope.adApplyDetail.companyPhone }" disabled></td>
								</tr>
								<tr>
									<td>사업자 이메일</td>
									<td><input type="text" id="ownerEmail" value="${ requestScope.adApplyDetail.companyEmail }" disabled></td>
								</tr>	
						</table>
                    	<div style="margin: 0px auto; text-align: right; margin-bottom: 50px"><button onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/adApply/detail2?adCode=${ requestScope.adApplyDetail.adCode }'">다음으로</button></div>
	                	</div>
            </section>

            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
</html>