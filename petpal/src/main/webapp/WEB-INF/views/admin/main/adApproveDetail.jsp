<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
	<style>
	.table > tr > th{
	text-align: center;
	border: none;
	}
	.table > tr > th{
	text-align: center;
	border: none;
	}
	</style>
	
	<script>
	function click_ad(){
		var adCode = document.getElementById('adPopUpCode').value;
		var url="${ pageContext.servletContext.contextPath }/admin/adPopUp?adCode="+adCode;
		var name= "adPopUp";
		var option= "width = 600, height = 500, left = 100, top = 50, location = no";
		
		window.open(url,name,option)
		
	}
	
	
	</script>	
	
  
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">

        <div class="culmn">
            
            <!-- 헤더  시작 -->
			<jsp:include page="../../admin/common/header.jsp"></jsp:include>
			<!-- 헤더 끝 --> 


			 <!-- 바디 시작 -->
             <section>
           		<!-- 큰 컨테이너 시작 -->
                <div class="container" style="padding-bottom:5%">
                
                        <c:forEach var="adDetail" items="${ requestScope.adApproveDetail }">
                         <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" style="font-weight:800; margin-bottom:12px; font-size:25px; color:black">${adDetail.adTitle}</li>
                             </ul>
                             </c:forEach>
                               <a href="${ pageContext.servletContext.contextPath }/admin/adApproveList"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
                               			style="width:40px;height:42px; margin-right:30px; margin-top:-50px; float:right;"></a>


                        <!-- 작은 컨테이너 시작 -->
                        <div class="container" style="padding-top:15px;">
                        
                        	<!-- 광고 상세 정보 테이블 -->
                            <c:forEach var="adDetail" items="${ requestScope.adApproveDetail }">
                            <table id="table" class="table" style="text-align:left;">
                                 <tr>
                                    <th style="border: none; width: 150px;">기업명</th>
                                    <td style="border: none;">${adDetail.companyName}</td>
                                 </tr>
                                 <tr>
                                    <th style="border: none; width: 150px;">신청자 아이디</th>
                                    <td style="border: none;">${adDetail.user.id}</td>
                                 </tr>
                                 <tr>
                                    <th style="border: none; width: 150px;">사업자 번호</th>
                                    <td style="border: none;">${adDetail.companyNumber}</td>
                                 </tr>
                                 <tr>
                                    <th style="border: none; width: 150px;">사업자 전화번호</th>
                                    <td style="border: none;">${adDetail.companyPhone}</td>
                                 </tr>
                                 <tr>
                                    <th style="border: none; width: 150px;">사업자 이메일</th>
                                    <td style="border: none;">${adDetail.companyEmail}</td>
                                 </tr>
                                 <tr>
                                    <th style="border: none; width: 150px;">광고 종류</th>
                                    <td style="border: none;">
                                    	<c:choose>
		                                    <c:when test="${adDetail.adTypeCode eq 1}">
		                                    	장소 외
		                                    </c:when>
		                                    <c:when test="${adDetail.adTypeCode eq 3}">
		                                    	장소 외
		                                    </c:when>
		                                    <c:when test="${adDetail.adTypeCode eq 2}">
		                                    	장소
		                                    </c:when>
		                                    <c:when test="${adDetail.adTypeCode eq 4}">
		                                    	장소
		                                    </c:when>
                                    	</c:choose>
                                    </td>
                                 </tr>
                                 <tr>
                                    <th style="border: none; width: 150px;">광고 주수</th>
                                    <td style="border: none;">
                                      <c:choose>
		                                    <c:when test="${adDetail.adTypeCode eq 1}">
		                                    	1주
		                                    </c:when>
		                                    <c:when test="${adDetail.adTypeCode eq 2}">
		                                    	1주
		                                    </c:when>
		                                    <c:otherwise>
		                                    	2주
		                                    </c:otherwise>
                                      </c:choose>
                                    </td>
                                 </tr>
                                 <tr>
                                    <th style="border: none; width: 150px;">광고 내용</th>
                                    <td style="border: none;"> 
                                    <button class="btn text-center" onclick="click_ad();" id="adPopUpCode" value="${adDetail.adCode}" style="padding-left: 20px;padding-right: 20px;padding-top: 5px;padding-bottom: 5px;">
                                    	광고 내용 보기
                                    </button>
                                    </td>
                                 </tr>
                                 
                            </table>
                            </c:forEach>
                        	<br>
                        	<br>
                        	<br>
                         <hr>
                         
                  <!-- 광고 심사 -->
                  <!-- 심사상태 : 대기일 때 -->   
                   <c:forEach var="adDetail" items="${ requestScope.adApproveDetail }">
                   	<c:if test="${ adDetail.stateCode eq 1}" > 
	                   <div class="head_title">
	                       <p style="font-weight:800; margin-top:20px; font-size:25px; color:black">관리자 심사</p>
	                   </div>   
                   <!--관리자 심사 폼 시작 -->
	                 <form action="${ pageContext.servletContext.contextPath }/admin/adApproveDetail/${adDetail.adCode}" method="post" enctype="multipart/form-data">
		               <!-- 광고 심사 사유 입력 -->
	                   <div class="form-group mt-3">
	                        <textarea name="decisionReason" class="form-control" rows="5" placeholder="광고 심사 사유를 입력해주세요(필수)" required="" style="margin-bottom:3%;"></textarea>
	                   </div>   	
		        
	                  <div class="container">
                         <div class="row">
                             <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                 <input type="submit" name="state" value="광고 거절"  class="btn btn-outline-danger" type="button"  style="border-radius:10px; float:right; margin-right:10px; background: white; border:1px solid red; color:red;"/>
                                 <input type="submit" name="state" value="광고 승인" class="btn btn-outline-success" type="button" style="border-radius:10px; margin-right: 20px; float:right; background: white; border:1px solid green; color:green;"/>
                             </div>
                           </div>
                       </div>   
                      </form>
	                </c:if>
                    </c:forEach>
                    
                   <!-- 심사상태 : 승인 or 거절일 때 --> 
                   <!-- 관리자 심사 폼 시작 -->
                  <c:forEach var="result" items="${ requestScope.adApproveDecision }">
                   	<c:if test="${ result.stateCode ne 1}" > 
                     <div class="head_title">
                       <p style="font-weight:800; margin-top:20px; font-size:25px; color:black">심사 결과</p>
	                   </div>   
		                 <table id="table" class="table" style="text-align:left;">
	                        <tr>
	                          <th style="border: none; width: 150px;">관리자 심사 결과</th>
	                          <td style="border: none;">
	                           <c:if test="${ result.stateCode eq 2}" > 
	                          	승인
	                           </c:if>
	                           <c:if test="${ result.stateCode eq 3}" > 
	                          	거절
	                           </c:if>
	                          </td>
	                        </tr>
	                        <tr>
	                          <th style="border: none; width: 150px;">심사 관리자</th>
	                          <td style="border: none;">${ result.user.name }(${ result.user.id })</td>
	                        </tr>
	                        <tr>
	                          <th style="border: none; width: 150px;">심사 일자</th>
	                          <td style="border: none;">${ result.decision.decisionDate }</td>
	                        </tr>
	                        <tr>
	                          <th style="border: none; width: 150px;">심사 사유</th>
	                          <td style="border: none;">
	                          <textarea class="form-control" name="message" rows="5" readonly style="margin-bottom:3%; background-color:white;">
	                         ${ result.decision.decisionReason }
	                          </textarea>
	                          </td>
	                        </tr>
	                   </table>
	              	 </c:if>
	               </c:forEach>
	               <!-- 관리자 심사 폼 종료 -->
                    
                    
                 </div><!-- 작은 컨테이너 끝 -->
               </div><!-- 큰 컨테이너 끝 -->
            </section><!-- 바디 끝 -->

			<!-- 푸터 시작 -->
            <footer>
       			<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
            </footer>
			<!-- 푸터 끝 -->



        </div>

     
</html>