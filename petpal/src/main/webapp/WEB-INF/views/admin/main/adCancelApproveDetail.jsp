<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
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
		
       </style>
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
                
                 <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" style="font-weight:800; margin-bottom:12px; font-size:25px; color:black">광고 취소 상세보기(광고제목)</li>
                             </ul>
                               <a href="${ pageContext.servletContext.contextPath }/admin/adList"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
                               			style="width:40px;height:42px; margin-right:30px; margin-top:-50px; float:right;"></a>
                

                        <!-- 작은 컨테이너 시작 -->
                        
                        <div class="container">
                        <div class="col-md-6">
             			<!-- 제목 -->
                        <div class="head_title text-left fix">
                            <h2 class="text-uppercase">광고 취소 상세보기(광고제목)</h2>
                            <br>
                        </div>
                        
                        	<!-- 광고 상세 정보 테이블 -->
                            <table class="table" id="table">
                                 <tr>
                                    <th scope="col" style="border: none;">기업명</th>
                                    <td style="border: none;">반려나라</td>
                                 </tr>
                                 <tr>
                                    <th scope="col" style="border: none;">신청자 아이디</th>
                                    <td style="border: none;"></td>
                                 </tr>
                                 <tr>
                                    <th scope="col" style="border: none;">사업자 번호</th>
                                    <td style="border: none;"></td>
                                 </tr>
                                 <tr>
                                    <th scope="col" style="border: none;">사업자 등록증</th>
                                    <td style="border: none;"> <button class="btn text-center" style="padding-left: 20px;padding-right: 20px;padding-top: 5px;padding-bottom: 5px;">사업자 등록증 보기</button></td>
                                 </tr>
                                 <tr>
                                    <th scope="col" style="border: none;">사업자 전화번호</th>
                                    <td style="border: none;"></td>
                                 </tr>
                                 <tr>
                                    <th scope="col" style="border: none;">사업자 이메일</th>
                                    <td style="border: none;"></td>
                                 </tr>
                                 <tr>
                                    <th scope="col" style="border: none;">광고 종류</th>
                                    <td style="border: none;"></td>
                                 </tr>
                                 <tr>
                                    <th scope="col" style="border: none;">광고 주수</th>
                                    <td style="border: none;"></td>
                                 </tr>
                                 <tr>
                                    <th scope="col" style="border: none;">광고 내용</th>
                                    <td style="border: none;"> <button class="btn text-center" style="padding-left: 20px;padding-right: 20px;padding-top: 5px;padding-bottom: 5px;"">광고 내용 보기</button></td>
                                 </tr>
                                 
                            </table>
                        	<br>
                        	<br>
                        	<br>
                     </div>
                     
                  <!-- 광고 취소 상세 -->
                  
                   <div class="col-md-6">   
                   <div class="head_title text-left fix">
                       <h2 class="text-uppercase">광고 취소</h2>
                   </div>   
                    <table class="table" style="margin-bottom:3%;">
                       <tr>
                          <th scope="col" style="border: none;">취소 신청 일자</th>
                          <td style="border: none;">2021-06-20</td>
                       </tr>
                       <tr>
                          <th scope="col" style="border: none;">취소 사유</th>
                          <td style="border: none;"><textarea class="form-control" name="message" rows="5" value="" readonly style="margin-bottom:3%; background-color:white;"></textarea></td>
                       </tr>
                    <!-- 승인된 경우 -->
                    <%-- <test="${ requestScope.~ eq ~}" >  --%>
                     </table>
                     <br>
                     <br>
                     <br>
	               </div>
	               </div>
	               
	               <!-- 환불 내역 시작 -->
                   <!-- 1차납부일자와 환불신청일자가 동일할 때(당일 환불 신청 시) 환불 가능 -->
                   <!-- 환불 여부가 Y일 때 -->
                   <%-- <test="${ requestScope.~ eq ~}" >  --%>
                   <div class="container">
	               <div class="col-md-6" > 
                   <div class="head_title text-left fix">
                       <h2 class="text-uppercase">환불 내역</h2>
                   </div> 
                   <table class="table" style="margin-bottom:3%">
                       <tr>
                          <th scope="col" style="border: none;">환불 금액</th>
                          <td style="border: none;">2000000</td>
                       </tr>
                       <tr>
                          <th scope="col" style="border: none;">환불 일자</th>
                          <td style="border: none;">2021-06-20</td>
                       </tr>
                       <tr>
                          <th scope="col" style="border: none;">환불 일자</th>
                          <td style="border: none;">2021-06-20</td>
                       </tr>
                    </table>
                    <br>
                    <br>
                    <br>
                    </div>
                    </div>
	               <!-- </> -->
	               <!-- 환불 내역 종료 --> 
	               
	               
	               <!-- 2차 납부 -->
                   <!-- 1차납부일자보다 환불신청일자가 크고 총 클릭 수가 0보다 클 때 2차 납부 시작 -->
                   <!-- 2차 납부 결제 여부가 Y이면 게시 완료일자를 환불심사일자로 바꾸고 게시상태(게시종료)로 바꿈 -->
                   <!-- 후납부 징수를 똑같이 진행 -->
                   <%-- <test="${ requestScope.~ eq ~}" >  --%>
                   <div class="container">
                   <div class="col-md-6"> 
                   <div class="head_title text-left fix">
                       <h2 class="text-uppercase">2차 결제</h2>
                   </div> 
                      <table class="table" style="margin-bottom:3%">
                       <tr>
                          <th scope="col"  style="border:none;">2차 가격</th>
                          <td style="border: none;">1000000</td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none;">총 클릭 수</th>
                          <td style="border: none;"></td>
                       </tr>
                       <tr>
                          <th scope="col" style="border:none;">결제 여부</th>
                          <td style="border: none;"></td>
                       </tr>
                       </table>
                       <br>
                       <br>
                       <br>
                   </div>
                   </div>
	               <!-- </> -->
	               <!-- 환불 내역 종료 -->        
                    
                    
               </div><!-- 큰 컨테이너 끝 -->
            </section><!-- 바디 끝 -->

			<!-- 푸터 시작 -->
            <footer>
       			<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
            </footer>
			<!-- 푸터 끝 -->



        </div>

     
</html>