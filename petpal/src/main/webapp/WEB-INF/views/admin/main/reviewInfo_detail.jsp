<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보공유 상세 페이지</title>
<style>
.table>tr>td{
	text-align: center;
}
</style>
<script>
	function click_ad(){
		var boardCode = document.getElementById('boardCode').value;
		var category1 = 0;
		if(${category} == 0){
			category1 = 1
			
		}else{
			category1 = 5
		}
		var url="${ pageContext.servletContext.contextPath }/admin/reportPopup?boardCode="+boardCode+"&category="+category1;
		var name= "PopUp";
		var option= "width = 700, height = 900, left = 100, top = 50, location = no";
		
		window.open(url,name,option)
		
	}
	
	
	</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../admin/common/header.jsp"></jsp:include> 
    
	 <section id="product" class="product">

		<div class="container">		
				<div class="row">
					 <div class="col-md-25">
                                    <!-- Nav tabs -->
                             <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" style="font-weight:800; margin-bottom:12px; font-size:30px; color:black">정보공유 상세 페이지</li>
                             </ul>
                               <a href="${pageContext.servletContext.contextPath }/admin/reviewList?category=${category}"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
                               			style="width:40px;height:42px; margin-right:30px; margin-top:-50px; float:right;"></a>
                            <div class="tab-content" style="padding-top: 15px;">
                                <div role="tabpanel" class="tab-pane active" id="profile">	
                                	<div class="col-md-10">
		                                 <table class="table">
		                                 <tr>
		                                    <th scope="col-md-3" style="border: none; width: 150px;">작성한 아이디</th>
		                                    <td style="border: none;">${ requestScope.reviewDetail.userId }</td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">작성한 유저 이름</th>
		                                    <td style="border: none;">${ requestScope.reviewDetail.userName }</td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">작성 글제목</th>
		                                    <td style="border: none;">${ requestScope.reviewDetail.boardTitle }</td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">작성 일자</th>
		                                    <td style="border: none;">${ requestScope.reviewDetail.postDate }</td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none; margin-top:10px">작성 내용</th>
		                                    <td  style="border: none;margin-top:10px"><button onclick="click_ad();" id="boardCode" value="${boardCode}" class="btn text-center" style="padding-left: 25px;padding-right: 25px;padding-top: 10px;padding-bottom: 5px;background: #19A985;color:white;">작성글 상세 보기</button></td>
		                                    
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style=" color:black">처리 여부</th>
		                                    <td style=" color:black">${requestScope.reviewDetail.state }</td>
		                                 </tr>
		                                 <c:if test="${requestScope.reviewDetail.state != '대기중' }">
		                                 <tr>
		                                    <th scope="col" style="border: none;">담당 관리자</th>
		                                    <td style="border: none;">${requestScope.reviewDetail.adminName }(${requestScope.reviewDetail.adminId })</td>
		                                 </tr>
		                                 </c:if>
		                                 <c:if test="${requestScope.reviewDetail.state eq '거절' }">
		                                 <tr>
		                                    <th scope="col" style="border: none;">거절 사유</th>
		                                    <td style="border: none;">${requestScope.reviewDetail.reason }</td>
		                                 </tr>
		                                 </c:if>
		                            	</table>
				           	 		</div>	
				           	 		<br>
				           	 		<div class="col-md-20"></div>
				           	 		<div class="container">
				           	 		<br>
				           	 		<br>
				           	 		<br>
				           	 		<br>
				           	 		<br>
				           	 		<br>
				           	 		</div>
				           	 		<br>
				           	 		<br>
				           	 		<br>
				           	 		<br>
				           	 		<div class="container">
				           	 			<div class="row">
				           	 				<c:if test="${reviewDetail.state eq '대기중' }">
						           	 		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		  									  <button class="btn btn-outline-danger" type="button"  style="border-radius:10px; float:right; margin-right:10px; background: white; border:1px solid red; color:red;">게시글 반려</button>
											  <button onclick="location.href='${pageContext.servletContext.contextPath }/admin/updateReviewDecision?decision=2&category=${category}&boardCode=${boardCode}'" class="btn btn-outline-success" type="button" style="border-radius:10px; margin-right: 20px; float:right; background: white; border:1px solid green; color:green;">게시글 승인</button>
											</div>
											</c:if>
										</div>
										<hr style="border:1px solid #DDD; background-color:#DDD;">
									</div>	
									<br>
                          </div>  
	                </div>        
	          	</div> 
               
       
                </div>        
          </div>              
      </section><!-- End off Product section -->
     
      
          <div class="modal_wrap"></div>
    
    <!-- 소요 시간 팝업 -->
    	<div id="sc_modal">
      	  <p class="modal_title">해당 게시글을 반려하시겠습니까?</p>
      	  <hr style="border:1px solid #A8A8A8;">
      	  
	       <div class="time_list">
	       <form action="${pageContext.servletContext.contextPath }/admin/updateReviewDecision" method="get">
	       <input type="hidden" name="boardCode" value="${boardCode}"/>
           <input type="hidden" name="decision" value="3"/>
           <input type="hidden" name="category" value="${category}"/>
			<textarea class="form-control" name="message" rows="10" placeholder="반려 사유를 입력해주세요 (필수)" style="margin-bottom:3%;" required></textarea>
	       </div>
	       
       	  <button type="submit" class="time_btn btn-success" >이유 등록하기</button>
       	  </form>
        <a class="modal_closebtn">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/close.png" alt="닫기" width="50px" height="50px"></a>
    	</div>
		<script src="${ pageContext.servletContext.contextPath }/resources/js/clickevent.js"></script>
      <script src="${ pageContext.servletContext.contextPath }/resources/js/modal.js"></script>
	<jsp:include page="../../admin/common/footer.jsp"></jsp:include> 	
	</body>
</html>