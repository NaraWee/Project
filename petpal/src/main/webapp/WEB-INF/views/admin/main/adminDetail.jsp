<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <style>
     #revise {
       border-radius:10px; float:right; margin-right:0px; margin-left:15px; background: white; border:1px solid green; color:green;
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
             			<!-- 제목 -->
                        <!-- <div class="head_title text-left fix">
                            <h2 class="text-uppercase">관리자 정보 상세보기</h2>
                            <br>
                        </div> -->
                          
                        <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" style="font-weight:800; margin-bottom:12px; font-size:25px; color:black">관리자 정보 상세보기</li>
                             </ul>
                               <a href="${ pageContext.servletContext.contextPath }/admin/adminList"><img src="${ pageContext.servletContext.contextPath }/resources/images/goback.png" 
                               			style="width:40px;height:42px; margin-right:30px; margin-top:-50px; float:right;"></a>
						
											
		                                  		
		                                  		
		                                  		
		                                  	

                        <!-- 작은 컨테이너 시작 -->
                        <div class="container" style="padding-top:15px;">
                        <c:choose>
		                <c:when test="${ sessionScope.loginUser.permisson eq 3}">
                        <!-- 대표관리자 접속 시 수정 가능 부분 -->
                        <form action="${ pageContext.servletContext.contextPath }/admin/updateAdmin" method="post">
                         <input type="hidden" name="userCode" value="${ adminList.code }"/>
                              <div class="form-group">
                                <label for="cname" class="col-lg-2">아이디</label>
                              	<div class="col-lg-10">
	                                  <input class="form-control" id="name" name="name"  type="text"  value="${adminList.id}" style="margin-bottom:3%" readonly="readonly"></input>
	                            </div>
                              </div>
                              
                              <div class="form-group">
	                              <label for="cname" class="col-lg-2">이름</label>
	                                <div class="col-lg-10">
	                                  <input class="form-control" id="name" name="name"  type="text"  value="${adminList.name}" style="margin-bottom:3%" readonly="readonly"></input>
	                                </div>
                               </div>
                               
                              
                               <div class="form-group">
	                              <label for="cname" class="col-lg-2">권한</label>
	                                <div class="col-lg-10">
		                                <ul>
		                                <c:choose>
		                                <c:when test="${adminList.permisson eq 2 }">
		                                <li class="col-lg-6">
		                                  	<label for="priv" class="col-lg-3">
										    	대표관리자
										  	</label>
		                              		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="3" style="margin-bottom:6%">
		                              	</li>
		                              	<li class="col-lg-6">
		                              		<label for="priv" class="col-lg-3">
										    	서브관리자
										  	</label>
		                              		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="2" style="margin-bottom:6%" checked>
		                              	</li>
		                                </c:when>
		                                
		                                <c:otherwise>
		                                <li class="col-lg-6">
		                                  	<label for="priv" class="col-lg-3">
										    	대표관리자
										  	</label>
		                              		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="3" style="margin-bottom:6%" checked>
		                              	</li>
		                              	<li class="col-lg-6">
		                              		<label for="priv" class="col-lg-3">
										    	서브관리자
										  	</label>
		                              		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="2" style="margin-bottom:6%">
		                              	</li>
		                                </c:otherwise>
		                                </c:choose>
		                                
		                              	</ul>
	                                </div>
                              	</div>
                         	 
                               <div class="form-group">
	                              <label for="cname" class="col-lg-2">이메일</label>
	                                <div class="col-lg-10">
	                                  <input class="form-control" id="name" name="name"  type="text"  value="${adminList.email}" style="margin-bottom:3%" readonly="readonly"></input>
	                                </div>
                               </div>
                               
                               <div class="form-group">
	                              <label for="cname" class="control-label col-lg-2">휴대폰번호</label>
	                                <div class="col-lg-10">
	                                  <input class="form-control" id="phoneNum" name="phoneNum"  type="text"  value="${adminList.phone}" style="margin-bottom:3%" readonly="readonly"></input>
	                                </div>
                               </div>
                               
                               <!-- 수정하기 버튼 -->
                               <!-- 대표관리자만 수정 가능 -->
                                <div class="col-lg-12">
                                 <div class="col-lg-10"></div>
                                 <div class="col-lg-2" style="padding-right:0px">
                                 	<button type="submit" class="btn text-center" id="revise">수정완료</button></div>
                                 </div>
                                 </form>
                          <div class="col-lg-12"></div>
                          <div class="col-lg-12"></div>
                          <div class="col-lg-12"></div>
                          <div class="col-lg-12"></div>
                          <div class="col-lg-12"></div>
                          <div class="col-lg-12"></div>
                          <div class="col-lg-12"></div>
                          <div class="col-lg-12"></div>
                          
                         <div class="col-lg-12">
                         <div class="col-lg-10"></div>
                         <div class="col-lg-2" style="padding-right:0px">                             
                        <button onclick="location.href='${ pageContext.servletContext.contextPath }/admin/AdminDelete?userCode=${adminList.code }'" class="btn text-center" id="revise">권한해지</button>
                         </div>
                         </div>    	
                        <!-- 대표관리자 접속 수정 가능 -->
                        </c:when>
                        <c:otherwise>
                        <!-- 서브관리자 접속 시 수정 불가 (readonly="readonly" 속성 추가 ) -->
                         <form>
                              <div class="form-group">
                                <label for="cname" class="col-lg-2">아이디</label>
                              	<div class="col-lg-10">
	                                  <input class="form-control" id="name" name="name"  type="text"  value="${adminList.id}" style="margin-bottom:3%; background-color:white;" readonly="readonly"></input>
	                            </div>
                              </div>
                              
                              <div class="form-group">
	                              <label for="cname" class="col-lg-2">이름</label>
	                                <div class="col-lg-10">
	                                  <input class="form-control" id="name" name="name"  type="text"  value="${adminList.name}" style="margin-bottom:3%; background-color:white;" readonly="readonly"></input>
	                                </div>
                               </div>
                               
                               <div class="form-group">
	                              <label for="cname" class="col-lg-2">이메일</label>
	                                <div class="col-lg-10">
	                                  <input type="email" class="form-control" id="email" name="email"  type="text"  value="${adminList.email}" style="margin-bottom:3%; background-color:white;" readonly="readonly"></input>
	                                </div>
                               </div>
                              
                               <div class="form-group">
	                              <label for="cname" class="col-lg-2">권한</label>
	                                <div class="col-lg-10">
		                                <ul>
		                                <c:choose>
		                                <c:when test="${adminList.permisson eq 2 }">
		                                <li class="col-lg-6">
		                                  	<label for="priv" class="col-lg-3">
										    	대표관리자
										  	</label>
		                              		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="3" style="margin-bottom:6%" disabled>
		                              	</li>
		                              	<li class="col-lg-6">
		                              		<label for="priv" class="col-lg-3">
										    	서브관리자
										  	</label>
		                              		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="2" style="margin-bottom:6%" checked disabled>
		                              	</li>
		                                </c:when>
		                                
		                                <c:otherwise>
		                                <li class="col-lg-6">
		                                  	<label for="priv" class="col-lg-3">
										    	대표관리자
										  	</label>
		                              		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="3" style="margin-bottom:6%" checked disabled>
		                              	</li>
		                              	<li class="col-lg-6">
		                              		<label for="priv" class="col-lg-3">
										    	서브관리자
										  	</label>
		                              		<input class="radio-inline" type="radio" name="permisson" id="permisson" value="2" style="margin-bottom:6%" disabled>
		                              	</li>
		                                </c:otherwise>
		                                </c:choose>
		                                
		                              	</ul>
	                                </div>
                              	</div>
                         	 
                               
                               <div class="form-group">
	                              <label for="cname" class="control-label col-lg-2">휴대폰번호</label>
	                                <div class="col-lg-10">
	                                  <input class="form-control" id="phoneNum" name="phoneNum"  type="text"  value="${adminList.phone}" style="margin-bottom:3%; background-color:white;"  readonly="readonly"></input>
	                                </div>
                               </div>
                                               
                        </form>
                        <!-- 서브관리자 접속 시 수정 불가 -->
                        	</c:otherwise>
		                    </c:choose>
                        
                     
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