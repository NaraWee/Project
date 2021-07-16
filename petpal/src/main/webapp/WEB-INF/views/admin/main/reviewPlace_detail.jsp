<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프랜들리 플레이스 상세 페이지</title>
<style>
.table>tr>td{
	text-align: center;
}
</style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../../admin/common/header.jsp"></jsp:include> 

    
	 <section id="product" class="product">

		<div class="container">		
				<div class="row">
				<div class="head_title text-left fix">
		 	<p role="presentation" style="font-weight:800; font-size:25px; color:black; margin-top:10px;">프랜들리 플레이스 상세 페이지</p>
                        </div>	
					 <div class="col-md-25">
                                    <!-- Nav tabs -->
                             <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#all" aria-controls="all" role="tab" data-toggle="tab">All</a></li>
                                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">용품리뷰</a></li>
                             </ul>
                               <a href="${ pageContext.servletContext.contextPath }/views/admin/main/reviewInfo.jsp"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
                               			style="width:40px;height:42px; margin-right:30px; margin-top:-50px; float:right;"></a>
                            <div class="tab-content" style="padding-top: 15px;">
                                <div role="tabpanel" class="tab-pane active" id="profile">	
                                	<div class="col-md-10">
                                	    <div class="tab-content" style="padding:0px;">
                                        <div role="tabpanel" class="tab-pane active" id="all">	
		                                 <table class="table">
		                                 <tr>
		                                    <th scope="col-md-3" style="border: none; width: 150px;">작성한 아이디</th>
		                                    <td style="border: none;">judy123</td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">작성한 유저 이름</th>
		                                    <td style="border: none;"></td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">작성 글제목</th>
		                                    <td style="border: none;"></td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">작성 일자</th>
		                                    <td style="border: none;"></td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">장소 주소</th>
		                                    <td style="border: none;"></td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">장소 이름</th>
		                                    <td style="border: none;"></td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none;">장소 전화번호</th>
		                                    <td style="border: none;"></td>
		                                 </tr>
		                                 <tr>
		                                    <th scope="col" style="border: none; margin-top:10px">작성 내용</th>
		                                    <td style="border: none;margin-top:10px"><button class="btn text-center" style="padding-left: 25px;padding-right: 25px;padding-top: 10px;padding-bottom: 5px;background: #19A985;color:white;">작성글 상세 보기</button></td>
		                                    
		                                 </tr>
		                            	</table>
		                            	</div>
		                            	</div>
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
						           	 		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		  									  <button class="btn btn-outline-danger" type="button"  style="border-radius:10px; float:right; margin-right:10px; background: white; border:1px solid red; color:red;">게시글 반려</button>
											  <button class="btn btn-outline-success" type="button" style="border-radius:10px; margin-right: 20px; float:right; background: white; border:1px solid green; color:green;">게시글 승인</button>
											</div>
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
			<textarea class="form-control" name="message" rows="10" placeholder="반려 사유를 입력해주세요 (필수)" style="margin-bottom:3%;" required></textarea>
	            <input type="hidden" id="selection" name="selection">
	            <input type="hidden" class ="code" name="code">
	       </div>
	       
       	  <button type="submit" class="time_btn btn-success" >이유 등록하기</button>
        <a class="modal_closebtn">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/close.png" alt="닫기" width="50px" height="50px"></a>
    	</div>
		<script src="${ pageContext.servletContext.contextPath }/resources/js/clickevent.js"></script>
      <script src="${ pageContext.servletContext.contextPath }/resources/js/modal.js"></script>
	  <jsp:include page="../../admin/common/footer.jsp"></jsp:include> 
	
	</body>
</html>