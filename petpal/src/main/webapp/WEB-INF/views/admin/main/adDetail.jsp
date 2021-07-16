<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
       <head>
       <style>
		.table > tbody> tr > th {
		    width: 150px;
		    border: none;
		}
		.table > tbody> tr > td {
		    border: none;
		}
		.text-uppercase {
			margin-left: 5px;
			font-weight: 600;
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
                <div class="container" style="padding-bottom:10%">
             			<!-- 제목 -->
                        <!-- <div class="head_title text-left fix">
                            <h2 class="text-uppercase">광고 신청 상세보기(광고제목)</h2>
                            <br>
                        </div> -->
                        
                        <c:forEach var="adDetail" items="${ requestScope.adApproveDetail }">
                        <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" style="font-weight:800; margin-bottom:12px; font-size:25px; color:black">${adDetail.adTitle}</li>
                             </ul>
                        </c:forEach>
                               <a href="${ pageContext.servletContext.contextPath }/admin/adList"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
                               			style="width:40px;height:42px; margin-right:30px; margin-top:-50px; float:right;"></a>


                        <!-- 작은 컨테이너 시작 -->
                        <div class="container"  style="padding-top:15px;">
                        	<c:forEach var="adDetail" items="${ requestScope.adApproveDetail }">
                        
                        	<!-- 광고 상세 정보 테이블 -->
                            <table class="table">
                                 <tr>
                                    <th style="border:none">기업명</th>
                                    <td style="border:none">${adDetail.companyName}</td>
                                 </tr>
                                 <tr>
                                    <th style="border:none">신청자 아이디</th>
                                    <td style="border:none">${adDetail.user.id}</td>
                                 </tr>
                                 <tr>
                                    <th style="border:none">사업자 번호</th>
                                    <td style="border:none">${adDetail.companyNumber}</td>
                                 </tr>
                                 <tr>
                                    <th style="border:none">사업자 전화번호</th>
                                    <td style="border:none">${adDetail.companyPhone}</td>
                                 </tr>
                                 <tr>
                                    <th style="border:none">사업자 이메일</th>
                                    <td style="border:none">${adDetail.companyEmail}</td>
                                 </tr>
                                 <tr>
                                    <th style="border:none">광고 종류</th>
                                    <td style="border:none">
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
                                    <th style="border:none">광고 주수</th>
                                    <td style="border:none">
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
                        	<br>
                        	<br>
                        	<br>
                         <hr>
                   
                    <c:set var="day" value="<%=new java.util.Date()%>" />
                    <c:set var="today"><fmt:formatDate value="${day}" pattern="yyyy-MM-dd" /></c:set> 
                    <fmt:parseDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
				    <fmt:parseDate value="${adApprove.postStartDate}" pattern="yyyy-MM-dd" var="startday" />
				    <fmt:parseDate value="${adApprove.postEndDate}" pattern="yyyy-MM-dd" var="endday" />
				    <fmt:parseDate value="${adApprove.applyDate}" pattern="yyyy-MM-dd" var="applyday" />
				    <fmt:parseDate value="${adApprove.payDate1st}" pattern="yyyy-MM-dd" var="pay1stday" />
				    <fmt:parseDate value="${adApprove.cancelApplyDate}" pattern="yyyy-MM-dd" var="cancelApplyDay" />        
                   
                   
                     <div class="head_title">
                       <p style="font-weight:800; margin-top:20px; font-size:25px; color:black">결제 상세</p>
                   </div>
                    
                    <c:if test="${ not empty adDetail.cancelApplyDate }">
	                   <h3 class="text-uppercase">광고 취소</h3>
                       <table class="table" style="margin-bottom:3%">
                       <tr>
                          <th scope="col" style="border:none">취소 신청 일자</th>
                          <td style="border:none">${ adDetail.cancelApplyDate }</td>
                       </tr>
                        <tr>
                          <th scope="col" style="border:none">환불 여부</th>
                          <td style="border:none">
                          <c:choose>
                              <c:when test="${ empty adDetail.payDate1st }">
                               N
                               </c:when>
                               <c:when test="${ adDetail.payDate1st eq adDetail.cancelApplyDate }">
                               Y
                               </c:when>
                               <c:otherwise>
                               N
                               </c:otherwise>
                            </c:choose>
                          </td>
                       </tr>
                        <tr>
                          <th scope="col" style="border:none">2차 징수 여부</th>
                          <td style="border:none">
                          <c:choose>
                          	<c:when test="${ not empty adDetail.postStartDate and startday <= cancelApplyDay }">
                          	   Y
                          	</c:when>
                         	<c:otherwise>
                          	   N
                          	</c:otherwise>
                          </c:choose>
                          </td>
                       </tr>
                       </table>
                       </c:if>
                  
                   <!-- 게시상태 : 게시전일 때 -->   
                   <!-- 1차 결제 -->
                     <h3 class="text-uppercase">1차 결제</h3>
                   
                    <table class="table" style="margin-bottom:3%">
                       <tr>
                          <th scope="col" style="border:none">1차 가격</th>
                          <td style="border:none">
                          <c:choose>
		                    <c:when test="${adDetail.adTypeCode eq 1}">
		                    	200,000원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 3}">
		                    	100,000원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 2}">
		                    	350,000원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 4}">
		                    	250,000원
		                    </c:when>
                           </c:choose>
                          </td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">1차 결제 여부</th>
                          <td style="border:none">
                          <c:if test="${ not empty adDetail.payDate1st }">
      						 Y
                          </c:if>
                          <c:if test="${ empty adDetail.payDate1st }">
      						 N
                          </c:if>
                          </td>
                       </tr>
                       <tr>
                          <th scope="col"style="border:none">1차 결제 금액</th>
                          <td style="border:none">
                          <c:if test="${ not empty adDetail.payDate1st }">
      						<c:choose>
		                    <c:when test="${adDetail.adTypeCode eq 1}">
		                    	200,000원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 3}">
		                    	100,000원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 2}">
		                    	350,000원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 4}">
		                    	250,000원
		                    </c:when>
                           </c:choose>
                          </c:if>
                          <c:if test="${ empty adDetail.payDate1st }">
      						 -
                          </c:if>
                          </td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">1차 결제 일자</th>
                          <td style="border:none">
                          	<c:if test="${ not empty adDetail.payDate1st }">
                          	${ adDetail.payDate1st }
                          	</c:if>
                         	 <c:if test="${ empty adDetail.payDate1st }">
      						 -
                          	</c:if>
                          	
                          </td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">1차 결제 방법</th>
                          <td style="border:none">
                          <c:if test="${ not empty adDetail.payDate1st }">
                          	카카오페이
                          </c:if>
                          <c:if test="${ empty adDetail.payDate1st }">
      						 -
                          </c:if>
                          </td>
                       </tr>
                       </table>
                     
                     
                      <c:if test="${ startday <= today and today <= endday }">
	                   <h3 class="text-uppercase">게시 상태</h3>
                       <table class="table" style="margin-bottom:3%">
                       <tr>
                          <th scope="col" style="border:none">총 클릭 수</th>
                          <td style="border:none">${ adDetail.clickNum }회</td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">예상 2차 가격</th>
                          <td style="border:none">
                          ${ adDetail.price2nd }원
                          </td>
                        </tr>
                       </table>
                       </c:if>
                    
                    <c:if test="${ not empty adDetail.cancelApplyDate or (adDetail.postEndDate < day) }">
	                   <h3 class="text-uppercase">2차 결제</h3>
                       <table class="table" style="margin-bottom:3%">
                       <tr>
                          <th scope="col" style="border:none">2차 가격</th>
                          <td style="border:none">
                           ${ adDetail.price2nd }원
                          </td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">총 클릭 수</th>
                          <td style="border:none">
                          ${ adDetail.clickNum }회
                          </td>
                       </tr>
                       <tr>
                          <th scope="col"style="border:none">결제 여부</th>
                          <td style="border:none">
                          <c:if test="${ not empty adDetail.payDate2nd }">
      						 Y
                          </c:if>
                          <c:if test="${ empty adDetail.payDate2nd }">
                          	N
                          </c:if>
                          </td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">결제 금액</th>
                          <td style="border:none">
                          <c:if test="${ not empty adDetail.payDate2nd }">
      						 ${ adDetail.price2nd }원
                          </c:if>
                          <c:if test="${ empty adDetail.payDate2nd }">
                          	-
                          </c:if>
                          </td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">결제 일자</th>
                          <td style="border:none">
                           <c:if test="${ not empty adDetail.payDate2nd }">
      						 ${ adDetail.payDate2nd }
                          </c:if>
                          <c:if test="${ empty adDetail.payDate2nd }">
                          	-
                          </c:if>
                          </td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">세금계산서 발행일자</th>
                          <td style="border:none">
                          </td>
                       </tr>
                       </table>
             
	                   <h3 class="text-uppercase">총 납부 금액 : 
	                        <c:choose>
		                    <c:when test="${adDetail.adTypeCode eq 1}">
		                      ${ adDetail.price2nd + 200000 }원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 3}">
		                    	100,000원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 2}">
		                      ${ adDetail.price2nd + 350000 }원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 4}">
		                    	250,000원
		                    </c:when>
                           </c:choose>
	                   </h3>
                       <table class="table" style="margin-bottom:3%">
                       <tr>
                          <th scope="col" style="border:none">1차 납부 금액</th>
                          <td style="border:none">
                           <c:choose>
		                    <c:when test="${adDetail.adTypeCode eq 1}">
		                    	200,000원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 3}">
		                    	100,000원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 2}">
		                    	350,000원
		                    </c:when>
		                    <c:when test="${adDetail.adTypeCode eq 4}">
		                    	250,000원
		                    </c:when>
                           </c:choose>
                          </td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">2차 납부 금액</th>
                          <td style="border:none">
                           ${ adDetail.price2nd }원
                          </td>
                       </tr>
                    </table>
                    </c:if>
                    
                   
                    
             	
             		</c:forEach>
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