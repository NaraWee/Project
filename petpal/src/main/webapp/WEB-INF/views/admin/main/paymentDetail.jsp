<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.table>tr>td{
	text-align: left !important;
}

  td > .send_btn {
                background-color: #19A985; 
                height: 40px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
            }
</style>
</head>
<body>
	<jsp:include page="../../admin/common/header.jsp"></jsp:include> 

    
    
	 <section id="product" class="product">

		<div class="container">		
				<div class="row">
					 <div class="head_title text-left fix">
		 				<p role="presentation" style="font-weight:800; font-size:25px; color:black; margin-top:10px;">광고 결제 관리</p>
                      </div>	
					 <div class="col-md-25">
                               <a href="${ pageContext.servletContext.contextPath }/admin/payList"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
                               			style="width:40px;height:42px; margin-right:30px; margin-top:-50px; float:right;"></a>
                            <div class="tab-content" style="padding-top: 15px;">
                                <div role="tabpanel" class="tab-pane active" id="profile">	
                                <div>
                                	<c:forEach var="adApprove" items="${ requestScope.payDetail }">
                                	<button type="button" style=" width: 240px; height: 50px; background-color: orange; border-radius: 50px; border: none; margin-left: 40%; pointer-events: none; font-size: 28px;
    								color: white; font-weight: bolder;"> 
    								<c:if test= "${ empty adApprove.payDate1st }">
											1차
										    </c:if>
									      	<c:if test= "${ not empty adApprove.payDate1st }">
									    	2차
										    </c:if>
    								<c:out value="${ adApprove.payNewStatus }"/>
    								</button>
    								</c:forEach>
                                </div>
                                   <hr style="border:1px solid lightgray; width:100%;">
                                	<div class="col-md-6 col-md-offset-3">
                                	
		                             <c:set var="day" value="<%=new java.util.Date()%>" />
                                     <c:set var="today"><fmt:formatDate value="${day}" pattern="yyyy-MM-dd" /></c:set> 
                                     	
									 <fmt:parseDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
									 <fmt:parseDate value="${adApprove.postStartDate}" pattern="yyyy-MM-dd" var="startday" />
									 <fmt:parseDate value="${adApprove.postEndDate}" pattern="yyyy-MM-dd" var="endday" />
									 <fmt:parseDate value="${adApprove.applyDate}" pattern="yyyy-MM-dd" var="applyday" />
									 <fmt:parseDate value="${adApprove.decision.decisionDate}" pattern="yyyy-MM-dd" var="decisionday" />
									 <fmt:parseDate value="${adApprove.payDate1st}" pattern="yyyy-MM-dd" var="pay1stday" />
									 <fmt:parseDate value="${adApprove.cancelApplyDate}" pattern="yyyy-MM-dd" var="cancelApplyDay" />
									 <fmt:parseDate value="${adApprove.payDate1st}" pattern="yyyy-MM-dd" var="payday1st" />
									   
									 
									 <fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="caltoday" />
									 <fmt:parseNumber value="${applyday.time  / (1000*60*60*24)}" integerOnly="true" var="calapplyday" /> 
									 <fmt:parseNumber value="${pay1stday.time  / (1000*60*60*24)}" integerOnly="true" var="calpay1stday" /> 
									 <fmt:parseNumber value="${cancelApplyDay.time  / (1000*60*60*24)}" integerOnly="true" var="calcancelapplyday" /> 
									 <fmt:parseNumber value="${startday.time  / (1000*60*60*24)}" integerOnly="true" var="calstartday" /> 
									 <fmt:parseNumber value="${endday.time  / (1000*60*60*24)}" integerOnly="true" var="calendday" /> 
									 <fmt:parseNumber value="${decisionday.time  / (1000*60*60*24)}" integerOnly="true" var="caldecisionday" /> 
									 <fmt:parseNumber value="${payday1st.time  / (1000*60*60*24)}" integerOnly="true" var="calpayday1st" /> 
									 <fmt:parseNumber value="${adApprove.payDate1st.time}" integerOnly="true" var="calpayday1st" /> 
									 <%-- <fmt:parseNumber value="${decisionday.time  / (1000*60*60*24) + 3*(1000*60*60*24)}" integerOnly="true" var="caldday" /> --%> 
		                               
									 <fmt:parseDate value="${caldday}" pattern="yyyy-MM-dd" var="calDday" />
		                               
		                               <table class="table text-center">
                                		
                                		<c:forEach var="adApprove" items="${ requestScope.payDetail }">
		                        
		                                 <tr>
		                                    <th scope="col" style="border: none; font-size: 22px; color: black;">1차 결제</th>
		                                    <td style="border: none;">
		                                    </td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">1차 가격</th>
		                                   <td style="border:none">
					                          <c:choose>
							                    <c:when test="${adApprove.adTypeCode eq 1}">
							                    	200,000원
							                    </c:when>
							                    <c:when test="${adApprove.adTypeCode eq 3}">
							                    	100,000원
							                    </c:when>
							                    <c:when test="${adApprove.adTypeCode eq 2}">
							                    	350,000원
							                    </c:when>
							                    <c:when test="${adApprove.adTypeCode eq 4}">
							                    	250,000원
							                    </c:when>
					                           </c:choose>
					                          </td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">1차 결제 여부</th>
		                                    <td style="border: none;">
											<c:if test="${ not empty adApprove.payDate1st }">
					      						 Y
					                          </c:if>
					                          <c:if test="${ empty adApprove.payDate1st }">
					      						 N
					                          </c:if>
		                                    </td>
		                                 </tr>
		                                   <tr>
					                          <th scope="col"style="border:none">1차 결제 금액</th>
					                          <td style="border:none">
					                          <c:if test="${ not empty adApprove.payDate1st }">
					      						<c:choose>
							                    <c:when test="${adApprove.adTypeCode eq 1}">
							                    	200,000원
							                    </c:when>
							                    <c:when test="${adApprove.adTypeCode eq 3}">
							                    	100,000원
							                    </c:when>
							                    <c:when test="${adApprove.adTypeCode eq 2}">
							                    	350,000원
							                    </c:when>
							                    <c:when test="${adApprove.adTypeCode eq 4}">
							                    	250,000원
							                    </c:when>
					                           </c:choose>
					                          </c:if>
					                          <c:if test="${ empty adApprove.payDate1st }">
					      						 -
					                          </c:if>
					                          </td>
					                       </tr>
					                       <tr>
					                          <th scope="col" style="border:none">1차 결제 일자</th>
					                          <td style="border:none">
					                          	<c:if test="${ not empty adApprove.payDate1st }">
					                          	${ adApprove.payDate1st }
					                          	</c:if>
					                         	 <c:if test="${ empty adApprove.payDate1st }">
					      						 -
					                          	</c:if>
					                          	
					                          </td>
					                       </tr>
					                       <tr>
					                          <th scope="col" style="border:none">1차 결제 방법</th>
					                          <td style="border:none">
					                          <c:if test="${ not empty adApprove.payDate1st }">
					                          	카카오페이
					                          </c:if>
					                          <c:if test="${ empty adApprove.payDate1st }">
					      						 -
					                          </c:if>
					                          </td>
					                       </tr>
		                                 
		                                   <c:if test="${ startday <= today and today <= endday }">
						                       <tr>
						                          <th scope="col" style="border:none">총 클릭 수</th>
						                          <td style="border:none">${ adApprove.clickNum }회</td>
						                       </tr>
						                       <tr>
						                          <th scope="col" style="border:none">예상 2차 가격</th>
						                          <td style="border:none">
						                          ${ adApprove.price2nd }원
						                          </td>
						                        </tr>
						                       </c:if>
                    
                    <c:if test="${ not empty adApprove.cancelApplyDate or (adApprove.postEndDate < day) }">
	                   <tr>	 
	                   	 <th scope="col" style="border: none; font-size: 22px; color: black;">2차 결제</th>
		                 <td style="border: none;"></td>
		               </tr>
                       <tr>
                          <th scope="col" style="border:none">2차 가격</th>
                          <td style="border:none">
                           ${ adApprove.price2nd }원
                          </td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">총 클릭 수</th>
                          <td style="border:none">
                          ${ adApprove.clickNum }회
                          </td>
                       </tr>
                       <tr>
                          <th scope="col"style="border:none">결제 여부</th>
                          <td style="border:none">
                          <c:if test="${ not empty adApprove.payDate2nd }">
      						 Y
                          </c:if>
                          <c:if test="${ empty adApprove.payDate2nd }">
                          	N
                          </c:if>
                          </td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">결제 금액</th>
                          <td style="border:none">
                          <c:if test="${ not empty adApprove.payDate2nd }">
      						 ${ adApprove.price2nd }원
                          </c:if>
                          <c:if test="${ empty adApprove.payDate2nd }">
                          	-
                          </c:if>
                          </td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none">결제 일자</th>
                          <td style="border:none">
                           <c:if test="${ not empty adApprove.payDate2nd }">
      						 ${ adApprove.payDate2nd }
                          </c:if>
                          <c:if test="${ empty adApprove.payDate2nd }">
                          	-
                          </c:if>
                          </td>
                       </tr>
                       </c:if>
		                                
		                                
		                                
		                                <tr>
										<th style="border: none;"></th>
										<td style="border: none;"></td>
										</tr>
		                                 
		                                 
		                                    <tr>
		                                    <th scope="col" style="border: none;">정산 카테고리</th>
		                                  	<td style="border: none;">
		                                  	<c:if test= "${ empty adApprove.payDate1st }">
											1차
										    </c:if>
									      	<c:if test= "${ not empty adApprove.payDate1st }">
									    	2차
										    </c:if>
		                                  	</td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">청구 일자</th>
		                                    <td style="border: none;">
											<c:out value="${ adApprove.payDate }"/>
		                                    </td>
		                                 </tr>
		                              <%--    <tr>
		                                    <th scope="col" style="border: none;">납부 예정 일자</th>
		                                     <td style="border: none;">
		                                     <c:if test= "${ empty adApprove.payDate1st and empty adApprove.cancelApplyDate}">
													<c:out value="${ payday1st }"/>
												</c:if>
		                                     </td>
		                                 </tr> --%>
		                                 
										<tr>
										<th style="border: none;"></th>
										<td style="border: none;"></td>
										</tr>

		                                 <tr>
		                                    <th scope="col" style="border: none; font-size: 22px; color: black;">
		                                    <c:if test= "${ empty adApprove.payDate1st }">1차</c:if>
		                                    <c:if test= "${ not empty adApprove.payDate1st }">2차</c:if>
		                                    	청구 금액(원)
		                                    </th>
		                                     <td style="border: none;">
												<c:if test= "${ empty adApprove.payDate1st }">
													 <c:choose>
											                <c:when test="${adApprove.adTypeCode eq 1}">
											                	200000
											                </c:when>
											                <c:when test="${adApprove.adTypeCode eq 3}">
											                	100000
											                </c:when>
											                <c:when test="${adApprove.adTypeCode eq 2}">
											                	350000
											                </c:when>
											                <c:when test="${adApprove.adTypeCode eq 4}">
											                	250000
											                </c:when>
									                      </c:choose>
												</c:if>
												<c:if test= "${ not empty adApprove.payDate1st and empty adApprove.payDate2nd }">
													${ adApprove.price2nd }
												</c:if>
												<c:if test= "${ not empty adApprove.payDate1st and not empty adApprove.payDate2nd }">
													${ adApprove.price2nd }
												</c:if>
		                                     </td>
		                                 </tr>
		                                 
		                                 </c:forEach>
		                                 
		                                 
		                                 
		                            </table>
		                            </div>
		                            
		                            <hr style="border:1px solid lightgray; width:100%;">
		                            <div class="col-md-6">
		                            <table class="table text-center">
		                            
		                            	<c:forEach var="adApprove" items="${ requestScope.payDetail }">
		                            	<tr>
		                                    <th class="col-md-3" style="border: none; width: 150px;">이름(유저아이디)</th>
		                                     <td style="border:none">${ adApprove.user.name }(${ adApprove.user.id })</td>
		                                 </tr>
		                                 <tr>
		                                    <th class="col-md-3" style="border: none; width: 150px;">기업명</th>
		                                     <td style="border:none">${adApprove.companyName}</td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">사업자 번호</th>
		                                    <td style="border:none">${adApprove.companyNumber}</td>
		                                 </tr>
		                                 <tr>
                                    <th style="border:none">사업자 전화번호</th>
	                                    <td style="border:none">${adApprove.companyPhone}</td>
	                                 </tr>
	                                 <tr>
	                                    <th style="border:none">사업자 이메일</th>
	                                    <td style="border:none">${adApprove.companyEmail}</td>
	                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">광고 타입</th>
		                                   <td style="border:none">
	                                    	<c:choose>
			                                    <c:when test="${adApprove.adTypeCode eq 1}">
			                                    	장소 외
			                                    </c:when>
			                                    <c:when test="${adApprove.adTypeCode eq 3}">
			                                    	장소 외
			                                    </c:when>
			                                    <c:when test="${adApprove.adTypeCode eq 2}">
			                                    	장소
			                                    </c:when>
			                                    <c:when test="${adApprove.adTypeCode eq 4}">
			                                    	장소
			                                    </c:when>
	                                    </c:choose>
                                    </td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">광고 기간</th>
		                                     <td style="border:none">
                                    		<c:choose>
		                                    <c:when test="${adApprove.adTypeCode eq 1}">
		                                    	1주
		                                    </c:when>
		                                    <c:when test="${adApprove.adTypeCode eq 2}">
		                                    	1주
		                                    </c:when>
		                                    <c:otherwise>
		                                    	2주
		                                    </c:otherwise>
                                     		</c:choose>
                                    		</td>
		                                 </tr>
		                                 </c:forEach>
		                            </table>
		                           
			           	
				           	 </div>	                       
                        	<br>
                        	<br>
                        	<br>
                            </div>  
			                </div>        
			          </div> 
       
	                </div>        
	          </div>              
      </section><!-- End off Product section -->
	

	<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
</body>
</html>